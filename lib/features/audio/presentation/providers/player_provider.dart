import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'player_state.dart';

export 'player_state.dart';

// ─────────────────────────────────────────
// 參數 Providers（由 PlayerPage ProviderScope override）
// ─────────────────────────────────────────

final playerFilePathProvider = Provider<String>(
  (ref) => throw UnimplementedError(
    'playerFilePathProvider must be overridden inside PlayerPage via ProviderScope.',
  ),
);

final playerFileNameProvider = Provider<String>(
  (ref) => throw UnimplementedError(
    'playerFileNameProvider must be overridden inside PlayerPage via ProviderScope.',
  ),
);

// ─────────────────────────────────────────
// Notifier（Riverpod 3.x）
// ─────────────────────────────────────────

class PlayerNotifier extends Notifier<PlayerState> {
  late final ap.AudioPlayer _player;

  @override
  PlayerState build() {
    final filePath = ref.watch(playerFilePathProvider);
    final fileName = ref.watch(playerFileNameProvider);

    _player = ap.AudioPlayer();

    // 播放完畢 → completed
    _player.onPlayerComplete.listen((_) {
      state = state.copyWith(status: PlayerStatus.completed);
    });

    // 同步 audioplayers 原生狀態
    // 使用 ap.PlayerState 前綴避免與 Freezed PlayerState 衝突
    _player.onPlayerStateChanged.listen((ap.PlayerState ps) {
      switch (ps) {
        case ap.PlayerState.playing:
          state = state.copyWith(status: PlayerStatus.playing);
        case ap.PlayerState.paused:
          state = state.copyWith(status: PlayerStatus.paused);
        case ap.PlayerState.stopped:
        case ap.PlayerState.completed:
          state = state.copyWith(status: PlayerStatus.completed);
        case ap.PlayerState.disposed:
          break;
      }
    });

    // 頁面離開時自動 dispose AudioPlayer
    ref.onDispose(() => _player.dispose());

    return PlayerState(filePath: filePath, fileName: fileName);
  }

  Future<void> play() async {
    try {
      await _player.play(ap.DeviceFileSource(state.filePath));
    } catch (e) {
      state = state.copyWith(
        status: PlayerStatus.error,
        errorMessage: '播放失敗：$e',
      );
    }
  }

  Future<void> pause() async {
    try {
      await _player.pause();
    } catch (e) {
      state = state.copyWith(
        status: PlayerStatus.error,
        errorMessage: '暫停失敗：$e',
      );
    }
  }

  Future<void> resume() async {
    try {
      await _player.resume();
    } catch (e) {
      state = state.copyWith(
        status: PlayerStatus.error,
        errorMessage: '恢復播放失敗：$e',
      );
    }
  }

  /// 統一入口：根據當前狀態切換播放 / 暫停
  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await pause();
    } else if (state.isPaused) {
      await resume();
    } else {
      await play();
    }
  }
}

// ─────────────────────────────────────────
// Provider
//
// AutoDispose：頁面 pop 後自動釋放 AudioPlayer 資源。
// 透過 PlayerPage 內的 ProviderScope override 傳入 filePath / fileName。
// ─────────────────────────────────────────

/// 透過 PlayerPage 的巢狀 ProviderScope override，
/// 讓每個播放頁面持有獨立生命週期的 PlayerNotifier。
/// ProviderScope dispose 時（頁面 pop），AudioPlayer 會隨之釋放。
final playerProvider =
    NotifierProvider<PlayerNotifier, PlayerState>(
  PlayerNotifier.new,
);
