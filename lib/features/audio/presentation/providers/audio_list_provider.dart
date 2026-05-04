import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';

import '../../../../core/result/result.dart';
import '../../../../core/datasources/audio_remote_datasource.dart';
import '../../../../core/network/audio_api_client.dart';
import '../../data/models/audio_model.dart';
import '../../data/repositories/audio_repository.dart';
import 'audio_list_state.dart';

export 'audio_list_state.dart';

// ─────────────────────────────────────────
// DI 鏈（Providers）
// ─────────────────────────────────────────

/// API 用 Dio（baseUrl 交由 AudioApiClient 的 @RestApi 管理）
final audioDioProvider = Provider<Dio>((ref) {
  return DioClient.create();
});

/// Retrofit API Client
final audioApiClientProvider = Provider<AudioApiClient>((ref) {
  return AudioApiClient(ref.watch(audioDioProvider));
});

/// 遠端資料來源
final audioDataSourceProvider = Provider<AudioRemoteDataSource>((ref) {
  return AudioRemoteDataSource(ref.watch(audioApiClientProvider));
});

/// Repository
final audioRepositoryProvider = Provider<AudioRepository>((ref) {
  return AudioRepository(dataSource: ref.watch(audioDataSourceProvider));
});

// ─────────────────────────────────────────
// Notifier（Riverpod 3.x）
// ─────────────────────────────────────────

class AudioListNotifier extends Notifier<AudioListState> {
  /// build() 是 Notifier 的進入點，取代 StateNotifier 的 constructor
  @override
  AudioListState build() {
    Future.microtask(fetchAudios);
    return const AudioListState();
  }

  AudioRepository get _repository => ref.read(audioRepositoryProvider);

  /// 初次載入（重置分頁，從第 1 頁開始）
  Future<void> fetchAudios() async {
    if (state.status == AudioListStatus.loading) return;
    state = state.copyWith(
      status: AudioListStatus.loading,
      items: const [],
      currentPage: 1,
      total: 0,
      hasMore: true,
      errorMessage: null,
    );

    final result = await _repository.fetchAudios(page: 1);
    switch (result) {
      case ResultSuccess(:final data):
        final statuses = await _buildDownloadStatuses(data.items);
        state = state.copyWith(
          status: AudioListStatus.success,
          items: data.items,
          downloadStatuses: statuses,
          total: data.total,
          hasMore: data.items.length < data.total,
          currentPage: 2,
        );
      case ResultFailure(:final message):
        state = state.copyWith(
          status: AudioListStatus.failure,
          errorMessage: message,
        );
      case ResultLoading():
        // fetchAudios 不會回傳 loading，防禦性處理
        break;
    }
  }

  /// 捲動到底部時，載入下一頁
  Future<void> fetchMore() async {
    if (!state.hasMore) return;
    if (state.status == AudioListStatus.loading ||
        state.status == AudioListStatus.loadingMore) {
      return;
    }

    state = state.copyWith(status: AudioListStatus.loadingMore);

    final result = await _repository.fetchAudios(page: state.currentPage);
    switch (result) {
      case ResultSuccess(:final data):
        final newStatuses = await _buildDownloadStatuses(data.items);
        final newItems = [...state.items, ...data.items];
        state = state.copyWith(
          status: AudioListStatus.success,
          items: newItems,
          downloadStatuses: {...state.downloadStatuses, ...newStatuses},
          total: data.total,
          hasMore: newItems.length < data.total,
          currentPage: state.currentPage + 1,
        );
      case ResultFailure(:final message):
        state = state.copyWith(
          status: AudioListStatus.failure,
          errorMessage: message,
        );
      case ResultLoading():
        break;
    }
  }

  /// 下載指定音訊至本地
  ///
  /// 監聽 [AudioRepository.downloadAudio] 回傳的 Stream，
  /// 根據 [ResultLoading] / [ResultSuccess] / [ResultFailure] 更新下載狀態。
  Future<void> downloadAudio(AudioModel item) async {
    final stream = _repository.downloadAudio(
      url: item.url,
      fileName: item.fileName,
    );

    await for (final result in stream) {
      switch (result) {
        case ResultLoading():
          state = state.copyWith(
            downloadStatuses: {
              ...state.downloadStatuses,
              item.id: DownloadStatus.downloading,
            },
          );
        case ResultSuccess():
          state = state.copyWith(
            downloadStatuses: {
              ...state.downloadStatuses,
              item.id: DownloadStatus.downloaded,
            },
          );
        case ResultFailure():
          state = state.copyWith(
            downloadStatuses: {
              ...state.downloadStatuses,
              item.id: DownloadStatus.error,
            },
          );
      }
    }
  }

  Future<String> getLocalFilePath(AudioModel item) =>
      _repository.getLocalFilePath(item.fileName);

  Future<Map<int, DownloadStatus>> _buildDownloadStatuses(
    List<AudioModel> items,
  ) async {
    final statuses = <int, DownloadStatus>{};
    for (final item in items) {
      final exists = await _repository.isDownloaded(item.fileName);
      statuses[item.id] =
          exists ? DownloadStatus.downloaded : DownloadStatus.notDownloaded;
    }
    return statuses;
  }
}

// ─────────────────────────────────────────
// 最終 Provider
// ─────────────────────────────────────────

/// Riverpod 3.x：NotifierProvider
final audioListProvider = NotifierProvider<AudioListNotifier, AudioListState>(
  AudioListNotifier.new,
);
