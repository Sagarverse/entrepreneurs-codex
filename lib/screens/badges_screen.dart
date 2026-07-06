import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart' as models;
import '../services/app_state.dart';
import '../data/badges.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';
import '../widgets/ink_divider.dart';

/// Hall of Seals — every badge arranged like medals mounted on a wall.
class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final unlocked = state.unlockedBadgeCount;
    final total = state.totalBadgeCount;
    final pct = total == 0 ? 0.0 : unlocked / total;

    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'HALL OF SEALS',
          style: GoogleFonts.cinzel(
            fontSize: 13,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _Header(unlocked: unlocked, total: total, pct: pct),
          const SizedBox(height: 18),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.78,
            ),
            itemCount: allBadges.length,
            itemBuilder: (context, i) {
              final badge = allBadges[i];
              final isUnlocked =
                  state.progress.unlockedBadges.contains(badge.id);
              return _SealTile(badge: badge, unlocked: isUnlocked);
            },
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final int unlocked;
  final int total;
  final double pct;
  const _Header({
    required this.unlocked,
    required this.total,
    required this.pct,
  });

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.gold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'YOUR COLLECTION',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 3,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$unlocked',
                style: GoogleFonts.cinzel(
                  fontSize: 48,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '/ $total',
                  style: GoogleFonts.cinzel(
                    fontSize: 16,
                    color: CodexPalette.textOnInkDim,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: CodexPalette.inkHigher,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                widthFactor: pct,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        CodexPalette.goldDeep,
                        CodexPalette.goldBright,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SealTile extends StatelessWidget {
  final models.Badge badge;
  final bool unlocked;
  const _SealTile({required this.badge, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: () => _showSealSheet(context, badge, unlocked),
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: unlocked
                  ? CodexPalette.gold
                  : CodexPalette.goldDeep.withValues(alpha: 0.4),
              width: unlocked ? 1 : 0.5,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: unlocked ? 1 : 0.35,
                child: Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: unlocked
                        ? CodexPalette.gold.withValues(alpha: 0.15)
                        : CodexPalette.inkHigher,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: unlocked
                          ? CodexPalette.gold
                          : CodexPalette.goldDeep.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    badge.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                badge.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.cinzel(
                  fontSize: 10,
                  letterSpacing: 1,
                  color: unlocked
                      ? CodexPalette.goldBright
                      : CodexPalette.textOnInkDim,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              if (!unlocked)
                const Icon(Icons.lock_rounded,
                    size: 12, color: CodexPalette.textOnInkDim)
              else
                Text(
                  'SEALED',
                  style: GoogleFonts.cinzel(
                    fontSize: 8,
                    letterSpacing: 2,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSealSheet(
      BuildContext context, models.Badge badge, bool unlocked) {
    showModalBottomSheet(
      context: context,
      backgroundColor: CodexPalette.inkBlack,
      showDragHandle: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: unlocked
                      ? CodexPalette.gold.withValues(alpha: 0.15)
                      : CodexPalette.inkHigher,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: unlocked
                        ? CodexPalette.gold
                        : CodexPalette.goldDeep,
                    width: 1.5,
                  ),
                ),
                child: Opacity(
                  opacity: unlocked ? 1 : 0.4,
                  child: Text(badge.icon,
                      style: const TextStyle(fontSize: 52)),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                badge.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(
                  fontSize: 18,
                  letterSpacing: 2,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const InkDivider(),
              const SizedBox(height: 12),
              Text(
                badge.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  color: CodexPalette.textOnInk,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: unlocked
                      ? CodexPalette.gold.withValues(alpha: 0.15)
                      : CodexPalette.inkHigher,
                  border: Border.all(
                    color: unlocked
                        ? CodexPalette.gold
                        : CodexPalette.goldDeep,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      unlocked
                          ? Icons.verified_rounded
                          : Icons.lock_rounded,
                      size: 14,
                      color: unlocked
                          ? CodexPalette.gold
                          : CodexPalette.textOnInkDim,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      unlocked ? 'SEALED' : 'LOCKED',
                      style: GoogleFonts.cinzel(
                        fontSize: 11,
                        letterSpacing: 3,
                        color: unlocked
                            ? CodexPalette.goldBright
                            : CodexPalette.textOnInkDim,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
