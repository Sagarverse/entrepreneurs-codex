import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';
import '../theme.dart';
import '../widgets/chapter_card.dart';
import '../widgets/codex_frame.dart';
import '../widgets/codex_xp_bar.dart';
import '../widgets/ink_divider.dart';
import 'lesson_intro_screen.dart';
import 'lesson_screen.dart';

/// The Progress Atlas — 30 chapters laid out as a path on a parchment star-chart.
/// Each chapter is a tappable node.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final p = state.progress;
    final completionPct = (p.completionPercent * 100).round();
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'PROGRESS ATLAS',
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
          _Headline(
            completed: p.completedDays.length,
            pct: completionPct,
            xp: p.totalXp,
          ),
          const SizedBox(height: 18),
          CodexFrame(
            padding: const EdgeInsets.all(20),
            borderColor: CodexPalette.goldDeep,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXPERIENCE',
                  style: GoogleFonts.cinzel(
                    fontSize: 10,
                    letterSpacing: 3,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                CodexXpBar(totalXp: p.totalXp),
                const SizedBox(height: 20),
                const InkDivider(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _StatPip(
                        label: 'STREAK',
                        value: '${p.streak} 🔥',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _StatPip(
                        label: 'JOURNAL',
                        value: '${p.journalEntries.length}/30',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _StatPip(
                        label: 'SEALS',
                        value:
                            '${state.unlockedBadgeCount}/${state.totalBadgeCount}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _PathHeader(),
          const SizedBox(height: 12),
          // 4 weeks, each its own constellation row
          for (var w = 1; w <= 4; w++) ...[
            _WeekSpine(week: w),
            const SizedBox(height: 14),
          ],
          const SizedBox(height: 16),
          const _Legend(),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  final int completed;
  final int pct;
  final int xp;
  const _Headline({
    required this.completed,
    required this.pct,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$completed',
          style: GoogleFonts.cinzel(
            fontSize: 64,
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w800,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 6),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            '/ 30',
            style: GoogleFonts.cinzel(
              fontSize: 18,
              color: CodexPalette.textOnInkDim,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$pct%',
              style: GoogleFonts.cinzel(
                fontSize: 22,
                color: CodexPalette.gold,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '$xp XP',
              style: GoogleFonts.cinzel(
                fontSize: 11,
                letterSpacing: 2,
                color: CodexPalette.textOnInkDim,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatPip extends StatelessWidget {
  final String label;
  final String value;
  const _StatPip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: CodexPalette.inkBlack,
        border: Border.all(
            color: CodexPalette.goldDeep.withValues(alpha: 0.5), width: 0.5),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.cinzel(
              fontSize: 15,
              color: CodexPalette.goldBright,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.cinzel(
              fontSize: 9,
              letterSpacing: 2,
              color: CodexPalette.textOnInkDim,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PathHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.auto_stories_rounded,
            color: CodexPalette.gold, size: 16),
        const SizedBox(width: 8),
        Text(
          'THE PATH',
          style: GoogleFonts.cinzel(
            fontSize: 11,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: InkDivider(),
          ),
        ),
      ],
    );
  }
}

class _WeekSpine extends StatelessWidget {
  final int week;
  const _WeekSpine({required this.week});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final startDay = (week - 1) * 7 + 1;
    final endDay = startDay + 6;
    final weekTheme = state.lessonForDay(startDay)?.weekTheme ??
        'WEEK $week';

    return CodexFrame(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: CodexPalette.gold.withValues(alpha: 0.15),
                  border: Border.all(
                      color: CodexPalette.gold, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  'WEEK $week',
                  style: GoogleFonts.cinzel(
                    fontSize: 9,
                    letterSpacing: 3,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  weekTheme.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    letterSpacing: 3,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '$startDay–$endDay',
                style: GoogleFonts.cinzel(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: CodexPalette.textOnInkDim,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Spine: 7 chapter nodes connected by a hairline gold path
          Row(
            children: [
              for (var i = 0; i < 7; i++) ...[
                Expanded(
                  child: Center(
                    child: ChapterCard(
                      day: startDay + i,
                      completed: state.progress.completedDays
                          .contains(startDay + i),
                      isCurrent:
                          state.progress.currentDay == startDay + i,
                      isUnlocked:
                          state.isDayUnlocked(startDay + i),
                      onTap: () => _openChapter(context, state, startDay + i),
                    ),
                  ),
                ),
                if (i < 6)
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: CodexPalette.goldDeep
                          .withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void _openChapter(BuildContext context, AppState state, int day) {
    final lesson = state.lessonForDay(day);
    if (lesson == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LessonIntroScreen(
          lesson: lesson,
          onComplete: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => LessonScreen(day: day),
            ));
          },
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _LegendItem(
            dot: CodexPalette.goldBright,
            label: 'Sealed',
            outlined: true),
        _LegendItem(
            dot: CodexPalette.gold,
            label: 'Active',
            outlined: true),
        _LegendItem(
            dot: CodexPalette.inkRaised, label: 'Open',
            outlined: true),
        _LegendItem(
            dot: CodexPalette.inkRaised, label: 'Locked',
            outlined: true),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color dot;
  final String label;
  final bool outlined;
  const _LegendItem({
    required this.dot,
    required this.label,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: dot,
            borderRadius: BorderRadius.circular(2),
            border: outlined
                ? Border.all(color: CodexPalette.goldDeep, width: 0.5)
                : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.cinzel(
            fontSize: 10,
            letterSpacing: 2,
            color: CodexPalette.textOnInkDim,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
