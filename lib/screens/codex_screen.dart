import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../cinematic_page_route.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../theme.dart';
import '../widgets/animated_seal.dart';
import '../widgets/codex_frame.dart';
import '../widgets/ink_divider.dart';
import '../widgets/teaser_card.dart';
import 'certificate_screen.dart';
import 'lesson_intro_screen.dart';
import 'lesson_screen.dart';
import 'progress_screen.dart';
import 'badges_screen.dart';
import 'journal_screen.dart';
import 'settings_screen.dart';

/// The Codex — the home of the app. A single vertical scroll that contains
/// the entire state of the user's journey, organized like chapters of a book.
class CodexScreen extends StatelessWidget {
  const CodexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final lesson = state.currentLesson;
    final next = state.nextLesson;
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _SealSection(state: state)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  if (lesson != null) _TodayChapter(lesson: lesson, state: state),
                  if (lesson == null)
                    _Completed(
                      streak: state.progress.streak,
                      xp: state.progress.totalXp,
                    ),
                  const SizedBox(height: 28),
                  if (next != null)
                    TeaserCard(
                      nextLesson: next,
                      hook: next.teaserHook ??
                          'Another chapter of the codex awaits.',
                      quote: next.teaserQuote ??
                          '"The next page turns on its own."',
                      alreadyUnlocked:
                          state.isDayUnlocked(next.day),
                    ),
                  const SizedBox(height: 28),
                  const InkDivider(),
                  const SizedBox(height: 20),
                  Text(
                    'TOOLS OF THE TRADE',
                    style: GoogleFonts.cinzel(
                      fontSize: 11,
                      letterSpacing: 4,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ToolsGrid(state: state),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SealSection extends StatelessWidget {
  final AppState state;
  const _SealSection({required this.state});

  @override
  Widget build(BuildContext context) {
    final p = state.progress;
    final completionPct = (p.completionPercent * 100).round();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              tooltip: 'Settings',
              onPressed: () {
                Navigator.of(context).push(
                  CinematicPageRoute(
                      builder: (_) => const SettingsScreen()),
                );
              },
              icon: const Icon(Icons.settings_rounded,
                  color: CodexPalette.gold, size: 20),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedSeal(progress: p.completionPercent, size: 140),
          const SizedBox(height: 16),
          Text(
            'THE ENTREPRENEUR\'S CODEX',
            style: GoogleFonts.cinzel(
              fontSize: 12,
              letterSpacing: 5,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'CHAPTER ${romanNumeral(p.currentDay)} OF XXX',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 3,
              color: CodexPalette.textOnInkDim,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Pip(
                label: 'LEVEL',
                value: p.level,
              ),
              _Pip(label: 'STREAK', value: '${p.streak} 🔥'),
              _Pip(label: 'XP', value: '${p.totalXp}'),
              _Pip(
                label: 'COMPLETE',
                value: '$completionPct%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Pip extends StatelessWidget {
  final String label;
  final String value;
  const _Pip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.cinzel(
            fontSize: 16,
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 9,
            letterSpacing: 2,
            color: CodexPalette.textOnInkDim,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _TodayChapter extends StatelessWidget {
  final DailyLesson lesson;
  final AppState state;
  const _TodayChapter({required this.lesson, required this.state});

  @override
  Widget build(BuildContext context) {
    final isCompleted = state.progress.completedDays.contains(lesson.day);
    final isUnlocked = state.isDayUnlocked(lesson.day);
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor:
          isCompleted ? CodexPalette.gold : CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                lesson.weekTheme.toUpperCase(),
                style: GoogleFonts.cinzel(
                  fontSize: 9,
                  letterSpacing: 3,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (isCompleted)
                const Icon(Icons.verified_rounded,
                    color: CodexPalette.gold, size: 18),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'CHAPTER ${romanNumeral(lesson.day)}',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 3,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            lesson.chapterTitle,
            style: GoogleFonts.cinzel(
              fontSize: 24,
              color: CodexPalette.goldBright,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            lesson.title,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInk,
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.star_rounded,
                  color: CodexPalette.gold, size: 16),
              const SizedBox(width: 4),
              Text(
                '+${lesson.xpReward} XP',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  color: CodexPalette.gold,
                ),
              ),
              const Spacer(),
              Text(
                '${lesson.challenges.length} TRIALS · ${lesson.quiz.length} QUESTIONS',
                style: GoogleFonts.cinzel(
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                  color: CodexPalette.textOnInkDim,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: !isUnlocked
                  ? null
                  : () {
                      Navigator.of(context).push(
                        CinematicPageRoute(
                          builder: (_) => LessonIntroScreen(
                            lesson: lesson,
                            onComplete: () {
                              Navigator.of(context).pushReplacement(
                                CinematicPageRoute(
                                  builder: (_) =>
                                      LessonScreen(day: lesson.day),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.gold,
                disabledBackgroundColor: CodexPalette.inkHigher,
                foregroundColor: CodexPalette.inkBlack,
                disabledForegroundColor: CodexPalette.textOnInkDim,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: Text(
                !isUnlocked
                    ? 'LOCKED · COMPLETE PRIOR CHAPTERS'
                    : isCompleted
                        ? 'REVISIT THIS CHAPTER'
                        : 'BEGIN THE CHAPTER',
                style: GoogleFonts.cinzel(
                  fontSize: 13,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Completed extends StatelessWidget {
  final int streak;
  final int xp;
  const _Completed({required this.streak, required this.xp});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(24),
      borderColor: CodexPalette.gold,
      child: Column(
        children: [
          Text(
            'THE CODEX IS COMPLETE',
            style: GoogleFonts.cinzel(
              fontSize: 14,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You have walked all 30 chapters. The codex is yours.',
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInk,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '$xp XP · $streak day streak',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 3,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              icon: const Icon(Icons.workspace_premium_rounded, size: 18),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const CertificateScreen(),
                ));
              },
              label: Text(
                'CLAIM YOUR CERTIFICATE',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.gold,
                foregroundColor: CodexPalette.inkBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolsGrid extends StatelessWidget {
  final AppState state;
  const _ToolsGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    final journalCount = state.progress.journalEntries.length;
    final codexComplete = state.isCodexComplete;
    return Column(
      children: [
        _ToolRow(
          icon: Icons.calendar_view_month_rounded,
          title: 'PROGRESS ATLAS',
          subtitle: 'Your 30-day constellation',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ProgressScreen(),
            ));
          },
        ),
        const SizedBox(height: 10),
        _ToolRow(
          icon: Icons.book_rounded,
          title: 'JOURNAL',
          subtitle: '$journalCount reflections',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const JournalScreen(),
            ));
          },
        ),
        const SizedBox(height: 10),
        _ToolRow(
          icon: Icons.workspace_premium_rounded,
          title: 'HALL OF SEALS',
          subtitle:
              '${state.unlockedBadgeCount} of ${state.totalBadgeCount} unlocked',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const BadgesScreen(),
            ));
          },
        ),
        if (codexComplete) ...[
          const SizedBox(height: 10),
          _ToolRow(
            icon: Icons.workspace_premium_rounded,
            title: 'YOUR CERTIFICATE',
            subtitle: 'Download, print, or share your completion',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const CertificateScreen(),
              ));
            },
          ),
        ],
      ],
    );
  }
}

class _ToolRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _ToolRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: CodexPalette.goldDeep.withValues(alpha: 0.5),
                width: 0.5),
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CodexPalette.inkHigher,
                  border: Border.all(
                      color: CodexPalette.goldDeep, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Icon(icon, color: CodexPalette.gold, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.cinzel(
                        fontSize: 13,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w800,
                        color: CodexPalette.goldBright,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 14,
                        color: CodexPalette.textOnInkDim,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: CodexPalette.gold),
            ],
          ),
        ),
      ),
    );
  }
}

String romanNumeral(int n) {
  if (n <= 0 || n > 30) return '$n';
  const map = [
    'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X',
    'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX',
    'XXI', 'XXII', 'XXIII', 'XXIV', 'XXV', 'XXVI', 'XXVII', 'XXVIII', 'XXIX', 'XXX',
  ];
  return map[n - 1];
}
