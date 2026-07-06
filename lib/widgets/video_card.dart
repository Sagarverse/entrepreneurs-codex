import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../theme.dart';

/// A card for a single curated video. Tap to open in external browser.
class VideoCard extends StatelessWidget {
  final VideoResource video;
  final VoidCallback? onTap;

  const VideoCard({super.key, required this.video, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: CodexPalette.goldDeep, width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail — use YouTube's img.youtube.com (works for any public video)
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: SizedBox(
                  width: 96,
                  height: 64,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://i.ytimg.com/vi/${video.youtubeId}/hqdefault.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: CodexPalette.inkHigher,
                          child: const Icon(Icons.play_circle_outline,
                              color: CodexPalette.gold),
                        ),
                      ),
                      // Play button overlay
                      Container(
                        color: Colors.black.withValues(alpha: 0.25),
                        child: const Center(
                          child: Icon(Icons.play_arrow_rounded,
                              color: Colors.white, size: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${video.speaker} · ${video.durationMinutes} min',
                      style: theme.textTheme.bodySmall,
                    ),
                    if (video.whyWatch != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        video.whyWatch!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: CodexPalette.gold,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
