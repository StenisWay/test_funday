import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_provider.dart';

/// PlayerPage 使用 ProviderScope override，讓每個頁面擁有獨立的 PlayerNotifier 生命週期。
class PlayerPage extends StatelessWidget {
  const PlayerPage({
    super.key,
    required this.filePath,
    required this.fileName,
    required this.title,
  });

  final String filePath;
  final String fileName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        playerFilePathProvider.overrideWithValue(filePath),
        playerFileNameProvider.overrideWithValue(fileName),
        playerProvider.overrideWith(PlayerNotifier.new),
      ],
      child: _PlayerView(title: title),
    );
  }
}

class _PlayerView extends ConsumerWidget {
  const _PlayerView({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(playerProvider);
    final notifier = ref.read(playerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 標題
            Text(
              title.isNotEmpty ? title : state.fileName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 28),

            // 播放 / 暫停 圓形按鈕
            GestureDetector(
              onTap: notifier.togglePlayPause,
              child: Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE0E0E0),
                ),
                child: Icon(
                  state.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.black87,
                  size: 36,
                ),
              ),
            ),

            // 錯誤訊息（有錯時才顯示）
            if (state.status == PlayerStatus.error) ...[
              const SizedBox(height: 16),
              Text(
                state.errorMessage ?? '播放發生錯誤',
                style: TextStyle(fontSize: 13, color: Colors.red.shade400),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
