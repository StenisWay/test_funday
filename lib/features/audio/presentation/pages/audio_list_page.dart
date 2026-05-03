import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/audio_list_provider.dart';
import '../widgets/audio_list_item.dart';
import 'player_page.dart';

class AudioListPage extends ConsumerStatefulWidget {
  const AudioListPage({super.key});

  @override
  ConsumerState<AudioListPage> createState() => _AudioListPageState();
}

class _AudioListPageState extends ConsumerState<AudioListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    if (_scrollController.offset >= maxScroll - 200) {
      ref.read(audioListProvider.notifier).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(audioListProvider);

    ref.listen<AudioListState>(audioListProvider, (prev, next) {
      if (next.status == AudioListStatus.failure &&
          next.items.isNotEmpty &&
          next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('載入更多失敗：${next.errorMessage}'),
            action: SnackBarAction(
              label: '重試',
              onPressed: () =>
                  ref.read(audioListProvider.notifier).fetchMore(),
            ),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'FUNDAY',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
        ),
      ),
      body: switch (state.status) {
        // 初次載入中
        AudioListStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),

        // 初次載入失敗（無資料）
        AudioListStatus.failure when state.items.isEmpty => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                Text(state.errorMessage ?? '載入失敗'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(audioListProvider.notifier).fetchAudios(),
                  child: const Text('重新載入'),
                ),
              ],
            ),
          ),

        // 有資料（成功 / loadingMore / 失敗但已有部分資料）
        _ => RefreshIndicator(
            onRefresh: () =>
                ref.read(audioListProvider.notifier).fetchAudios(),
            child: ListView.separated(
              controller: _scrollController,
              itemCount: state.items.length + (state.hasMore ? 1 : 0),
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFE0E0E0),
              ),
              itemBuilder: (context, index) {
                // 最後一格：loadingMore 指示器
                if (index == state.items.length) {
                  return state.status == AudioListStatus.loadingMore
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }

                final item = state.items[index];
                final dlStatus = state.getDownloadStatus(item.id);

                return AudioListItem(
                  item: item,
                  downloadStatus: dlStatus,
                  onDownload: () =>
                      ref.read(audioListProvider.notifier).downloadAudio(item),
                  onPlay: () async {
                    final path = await ref
                        .read(audioListProvider.notifier)
                        .getLocalFilePath(item);
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerPage(
                          filePath: path,
                          fileName: item.fileName,
                          title: item.title,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
      },
    );
  }
}
