import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../cinematic_page_route.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../services/codex_audio.dart';
import '../theme.dart';
import '../widgets/codex_challenge_card.dart';
import '../widgets/codex_frame.dart';
import '../widgets/drop_cap.dart';
import '../widgets/manuscript_text.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/teaser_card.dart';
import 'certificate_screen.dart';
import 'milestone_screen.dart';
import 'quiz_screen.dart';
import 'video_screen.dart';

/// The lesson — a single scrollable page.
///
/// Everything for a chapter lives on one screen: the chapter header,
/// the manifesto, the sections, the skill of the day, the trials, the
/// revelation (videos), the reflection, the examination, and finally
/// the seal-the-chapter button. The user scrolls the page; there is no
/// "next" button.
class LessonScreen extends StatefulWidget {
  final int day;
  const LessonScreen({super.key, required this.day});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final _journalCtrl = TextEditingController();
  final _journalFocus = FocusNode();
  bool _sealTriggered = false;

  @override
  void initState() {
    super.initState();
    final state = context.read<AppState>();
    final existing = state.journalFor(widget.day);
    if (existing != null) {
      _journalCtrl.text = existing;
    }
    // Soft bell on chapter open.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      CodexAudio.instance.bell(scale: 0.6);
    });
  }

  @override
  void dispose() {
    _journalCtrl.dispose();
    _journalFocus.dispose();
    super.dispose();
  }

  Future<void> _markComplete(
      BuildContext context, AppState state, DailyLesson lesson) async {
    if (_sealTriggered) return;
    _sealTriggered = true;
    final wasCompleted = state.progress.completedDays.contains(lesson.day);
    if (!wasCompleted) {
      CodexAudio.instance.bell(scale: 1.0);
    }
    await state.completeDay(lesson.day);
    if (!context.mounted) return;
    if (wasCompleted) {
      Navigator.of(context).pop();
      return;
    }
    // If this seal completed the entire 30-chapter codex, send the
    // user straight to the certificate. Otherwise, the milestone screen
    // previews tomorrow's chapter.
    if (lesson.day == 30) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const CertificateScreen()),
      );
      return;
    }
    final next = state.lessonForDay(lesson.day + 1);
    await Navigator.of(context).pushReplacement(CinematicPageRoute(
      builder: (_) => MilestoneScreen(lesson: lesson, nextLesson: next),
    ));
  }

  Future<void> _openQuiz(BuildContext context, DailyLesson lesson) async {
    await Navigator.of(context).push(CinematicPageRoute(
      builder: (_) => QuizScreen(lesson: lesson),
    ));
  }

  Future<void> _openVideo(BuildContext context, DailyLesson lesson) async {
    await Navigator.of(context).push(CinematicPageRoute(
      builder: (_) => VideoScreen(lesson: lesson),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final lesson = state.lessonForDay(widget.day);
    if (lesson == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Lesson not found')),
      );
    }

    final isCompleted = state.progress.completedDays.contains(lesson.day);
    final challengesDone = state.progress.challengesCompleted[lesson.day] ??
        List.filled(lesson.challenges.length, false);
    final allChallengesDone =
        challengesDone.length == lesson.challenges.length &&
            challengesDone.every((c) => c);

    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      // No AppBar — the chapter is its own title. This kills the M3
      // bottom divider that was the source of the spurious gold line.
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 56, 20, 32),
        children: [
          // Header is always visible immediately — it's the chapter's
          // title and shouldn't depend on scroll position.
          _Header(lesson: lesson),
          const SizedBox(height: 24),
          ScrollReveal(child: _Manifesto(lesson: lesson)),
          const SizedBox(height: 20),
          for (var i = 0; i < lesson.sections.length; i++) ...[
            ScrollReveal(
              child: _SectionFrame(
                index: i,
                heading: lesson.sections[i].heading,
                content: lesson.sections[i].content,
                isFirst: i == 0,
              ),
            ),
            const SizedBox(height: 14),
          ],
          const SizedBox(height: 6),
          ScrollReveal(child: _SkillCard(lesson: lesson)),
          const SizedBox(height: 20),
          ScrollReveal(
            child: _Trial(
              lesson: lesson,
              challengesDone: challengesDone,
              onChanged: (i, v) => state.toggleChallenge(lesson.day, i, v),
            ),
          ),
          const SizedBox(height: 20),
          ScrollReveal(
            child: _Revelation(
              lesson: lesson,
              onOpenVideo: () => _openVideo(context, lesson),
            ),
          ),
          const SizedBox(height: 20),
          ScrollReveal(
            child: _Reflection(
              lesson: lesson,
              controller: _journalCtrl,
              focusNode: _journalFocus,
              onChanged: (val) => state.saveJournal(lesson.day, val),
            ),
          ),
          const SizedBox(height: 20),
          ScrollReveal(
            child: _Examination(
              lesson: lesson,
              onTake: () => _openQuiz(context, lesson),
            ),
          ),
          const SizedBox(height: 28),
          ScrollReveal(
            child: _SealBar(
              lesson: lesson,
              isCompleted: isCompleted,
              allChallengesDone: allChallengesDone,
              onMarkComplete: () => _markComplete(context, state, lesson),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Header -----------------

class _Header extends StatelessWidget {
  final DailyLesson lesson;
  const _Header({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHAPTER ${romanNumeral(lesson.day)}',
          style: GoogleFonts.cinzel(
            fontSize: 11,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          lesson.weekTheme.toUpperCase(),
          style: GoogleFonts.cinzel(
            fontSize: 10,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          lesson.chapterTitle,
          style: GoogleFonts.cinzel(
            fontSize: 28,
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          lesson.title,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 18,
            color: CodexPalette.textOnInkDim,
            fontStyle: FontStyle.italic,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// ----------------- Manifesto -----------------

class _Manifesto extends StatelessWidget {
  final DailyLesson lesson;
  const _Manifesto({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(24),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE MANIFESTO',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          DropCap(
            letter: lesson.mindsetLesson.isNotEmpty
                ? lesson.mindsetLesson[0]
                : 'T',
            trailing: [
              Text(
                lesson.mindsetLesson,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 18,
                  color: CodexPalette.textOnInk,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CodexPalette.inkBlack,
              border: Border(
                left: BorderSide(color: CodexPalette.gold, width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.format_quote_rounded,
                    color: CodexPalette.gold, size: 22),
                const SizedBox(height: 6),
                Text(
                  lesson.quote,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 19,
                    color: CodexPalette.goldBright,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '— ${lesson.quoteAuthor}',
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    letterSpacing: 2,
                    color: CodexPalette.gold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Section -----------------

class _SectionFrame extends StatelessWidget {
  final int index;
  final String heading;
  final String content;
  final bool isFirst;
  const _SectionFrame({
    required this.index,
    required this.heading,
    required this.content,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: isFirst ? CodexPalette.gold : CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: CodexPalette.gold, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  '${index + 1}',
                  style: GoogleFonts.cinzel(
                    fontSize: 12,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  heading,
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ManuscriptText(content),
        ],
      ),
    );
  }
}

// ----------------- Skill of the day -----------------

class _SkillCard extends StatelessWidget {
  final DailyLesson lesson;
  const _SkillCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SKILL OF THE DAY',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lesson.skillName,
            style: GoogleFonts.cinzel(
              fontSize: 20,
              color: CodexPalette.goldBright,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lesson.skillDescription,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInk,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: CodexPalette.inkBlack,
              border: Border.all(
                  color: CodexPalette.gold.withValues(alpha: 0.3),
                  width: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.flag_rounded,
                    color: CodexPalette.gold, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    lesson.actionStep,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 16,
                      color: CodexPalette.textOnInk,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Trial -----------------

class _Trial extends StatelessWidget {
  final DailyLesson lesson;
  final List<bool> challengesDone;
  final void Function(int index, bool value) onChanged;
  const _Trial({
    required this.lesson,
    required this.challengesDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE TRIAL',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Three trials. Three seals. Earn them all.',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInkDim,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < lesson.challenges.length; i++) ...[
            ScrollReveal(
              child: CodexChallengeCard(
                challenge: lesson.challenges[i],
                index: i,
                completed: i < challengesDone.length && challengesDone[i],
                onChanged: (v) => onChanged(i, v),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

// ----------------- Revelation -----------------

class _Revelation extends StatelessWidget {
  final DailyLesson lesson;
  final VoidCallback onOpenVideo;
  const _Revelation({required this.lesson, required this.onOpenVideo});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE REVELATION',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Watch those who have walked this path.',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInk,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.play_circle_outline_rounded,
                color: lesson.videos.isEmpty
                    ? CodexPalette.textOnInkDim
                    : CodexPalette.gold,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                lesson.videos.isEmpty
                    ? 'No videos curated for this chapter.'
                    : '${lesson.videos.length} curated ${lesson.videos.length == 1 ? "video" : "videos"}',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: lesson.videos.isEmpty ? null : onOpenVideo,
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.gold,
                disabledBackgroundColor: CodexPalette.inkHigher,
                foregroundColor: CodexPalette.inkBlack,
                disabledForegroundColor: CodexPalette.textOnInkDim,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: Text(
                'OPEN THE LIBRARY',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Reflection -----------------

class _Reflection extends StatelessWidget {
  final DailyLesson lesson;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const _Reflection({
    required this.lesson,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE REFLECTION',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            lesson.reflectionPrompt,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 18,
              color: CodexPalette.goldBright,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: CodexPalette.inkBlack,
              border: Border.all(
                  color: CodexPalette.gold.withValues(alpha: 0.3), width: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              maxLines: 8,
              minLines: 5,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                color: CodexPalette.textOnInk,
                height: 1.5,
              ),
              decoration: InputDecoration(
                hintText: 'Write freely. No eyes but yours will read this.',
                hintStyle: GoogleFonts.cormorantGaramond(
                  fontSize: 15,
                  color: CodexPalette.textOnInkDim,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Examination -----------------

class _Examination extends StatelessWidget {
  final DailyLesson lesson;
  final VoidCallback onTake;
  const _Examination({required this.lesson, required this.onTake});

  @override
  Widget build(BuildContext context) {
    return CodexFrame(
      padding: const EdgeInsets.all(20),
      borderColor: CodexPalette.goldDeep,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE EXAMINATION',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Prove what you have absorbed. Five questions. +25 XP for completion.',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: CodexPalette.textOnInk,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: lesson.quiz.isEmpty ? null : onTake,
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.gold,
                disabledBackgroundColor: CodexPalette.inkHigher,
                foregroundColor: CodexPalette.inkBlack,
                disabledForegroundColor: CodexPalette.textOnInkDim,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: Text(
                'BEGIN THE EXAMINATION',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Seal bar (the only call-to-action) -----------------

class _SealBar extends StatelessWidget {
  final DailyLesson lesson;
  final bool isCompleted;
  final bool allChallengesDone;
  final VoidCallback onMarkComplete;
  const _SealBar({
    required this.lesson,
    required this.isCompleted,
    required this.allChallengesDone,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    final next = context.read<AppState>().lessonForDay(lesson.day + 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isCompleted && !allChallengesDone)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Complete every trial before sealing this chapter.',
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 15,
                color: CodexPalette.textOnInkDim,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        FilledButton(
          onPressed:
              (!isCompleted && !allChallengesDone) ? null : onMarkComplete,
          style: FilledButton.styleFrom(
            backgroundColor: CodexPalette.gold,
            disabledBackgroundColor: CodexPalette.inkHigher,
            foregroundColor: CodexPalette.inkBlack,
            disabledForegroundColor: CodexPalette.textOnInkDim,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2)),
          ),
          child: Text(
            isCompleted ? 'RE-VIEW MILESTONE' : 'SEAL THE CHAPTER',
            style: GoogleFonts.cinzel(
              fontSize: 13,
              letterSpacing: 4,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (next != null) ...[
          const SizedBox(height: 24),
          Text(
            'TOMORROW · ${next.chapterTitle.toUpperCase()}',
            style: GoogleFonts.cinzel(
              fontSize: 10,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TeaserCard(
            nextLesson: next,
            hook: next.teaserHook ?? 'Another chapter of the codex awaits.',
            quote: next.teaserQuote ??
                '"The next page turns on its own."',
            alreadyUnlocked: false,
          ),
        ],
      ],
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
