import 'package:flutter/material.dart';
import '../providers/audio_list_provider.dart';
import '../../data/models/audio_model.dart';

class AudioListItem extends StatelessWidget {
  const AudioListItem({
    super.key,
    required this.item,
    required this.downloadStatus,
    required this.onDownload,
    required this.onPlay,
  });

  final AudioModel item;
  final DownloadStatus downloadStatus;
  final VoidCallback onDownload;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── 左側：標題 ──
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title.isNotEmpty ? item.title : '（無標題）',
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // ── 右側：操作按鈕 + 日期 ──
            InkWell(
              onTap: downloadStatus == DownloadStatus.downloaded ? onPlay : onDownload,
              child: _buildRight(),
            ),
          ],
        ),
      );
  }

  Widget _buildRight() {
    return switch (downloadStatus) {
      DownloadStatus.downloading => const _DownloadingIndicator(),
      DownloadStatus.downloaded => _ActionCell(
          icon: Icons.play_arrow,
          label: '播放',
          date: item.formattedDate,
          onTap: onPlay,
        ),
      DownloadStatus.error => _ActionCell(
          icon: Icons.refresh,
          label: '重試',
          date: item.formattedDate,
          onTap: onDownload,
        ),
      DownloadStatus.notDownloaded => _ActionCell(
          icon: Icons.download,
          label: '下載',
          date: item.formattedDate,
          onTap: onDownload,
        ),
    };
  }
}

// ─────────────────────────────────────────
// 子元件
// ─────────────────────────────────────────

class _ActionCell extends StatelessWidget {
  const _ActionCell({
    required this.icon,
    required this.label,
    required this.date,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 外框按鈕
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withValues(alpha: 0.12), width: 1),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 15),
                Icon(icon, size: 20, color: Colors.black87),
                const SizedBox(width: 3),
                Text(
                  label,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          // 日期（若有）
          if (date.isNotEmpty) ...[
            const SizedBox(height: 3),
            Text(
              date,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }
}

class _DownloadingIndicator extends StatelessWidget {
  const _DownloadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
        ),
        SizedBox(height: 3),
        Text('下載中', style: TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
