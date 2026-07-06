import 'package:flutter/material.dart';
import '../models/app_models.dart';

/// Tappable card representing a single daily challenge.
class ChallengeCard extends StatelessWidget {
  final DailyChallenge challenge;
  final int day;
  final int index;
  final bool completed;
  final ValueChanged<bool> onChanged;

  const ChallengeCard({
    super.key,
    required this.challenge,
    required this.day,
    required this.index,
    required this.completed,
    required this.onChanged,
  });

  Color _typeColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    switch (challenge.type) {
      case 'action':
        return scheme.primary;
      case 'thought':
        return scheme.tertiary;
      case 'skill':
        return scheme.secondary;
      case 'creative':
        return scheme.error;
      default:
        return scheme.outline;
    }
  }

  IconData _typeIcon() {
    switch (challenge.type) {
      case 'action':
        return Icons.bolt_rounded;
      case 'thought':
        return Icons.psychology_rounded;
      case 'skill':
        return Icons.handyman_rounded;
      case 'creative':
        return Icons.lightbulb_rounded;
      default:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = _typeColor(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: completed
            ? accent.withValues(alpha: 0.10)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: completed
              ? accent.withValues(alpha: 0.5)
              : theme.colorScheme.outlineVariant,
          width: completed ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onChanged(!completed),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: completed ? accent : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: completed ? accent : theme.colorScheme.outline,
                    width: 2,
                  ),
                ),
                child: completed
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),
              // Body
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        decoration: completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: completed
                            ? theme.colorScheme.onSurfaceVariant
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(_typeIcon(), size: 13, color: accent),
                              const SizedBox(width: 4),
                              Text(
                                challenge.type.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star_rounded,
                                size: 14,
                                color: theme.colorScheme.tertiary),
                            const SizedBox(width: 2),
                            Text(
                              '+${challenge.points}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: theme.colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
