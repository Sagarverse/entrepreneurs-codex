import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../services/codex_audio.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';
import '../widgets/ink_divider.dart';
import '../widgets/quiz_question_card.dart';

/// The Examination — 5 questions, cinematic reveal, awards 25 XP on completion.
class QuizScreen extends StatefulWidget {
  final DailyLesson lesson;
  const QuizScreen({super.key, required this.lesson});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;
  late List<bool?> _selections;
  bool _finished = false;
  bool _rewarded = false;

  @override
  void initState() {
    super.initState();
    _selections = List<bool?>.filled(widget.lesson.quiz.length, null);
  }

  void _onSelected(int qIdx, int optionIdx) {
    if (_selections[qIdx] != null) return;
    final correct = optionIdx == widget.lesson.quiz[qIdx].correctIndex;
    setState(() => _selections[qIdx] = correct);
    if (correct) {
      // Soft bell on a correct answer.
      CodexAudio.instance.bell(scale: 0.4);
    }
    context.read<AppState>().recordQuizAnswer(widget.lesson.day, qIdx, correct);
  }

  Future<void> _advance() async {
    if (_current + 1 >= widget.lesson.quiz.length) {
      // Done
      if (!_rewarded) {
        _rewarded = true;
        await context.read<AppState>().completeQuiz(widget.lesson.day);
      }
      if (!mounted) return;
      // Louder bell when the examination is complete.
      CodexAudio.instance.bell(scale: 0.8);
      setState(() => _finished = true);
      return;
    }
    if (!mounted) return;
    setState(() => _current += 1);
  }

  Future<void> _reset() async {
    setState(() {
      _current = 0;
      _selections = List<bool?>.filled(widget.lesson.quiz.length, null);
      _finished = false;
      _rewarded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'EXAMINATION',
          style: GoogleFonts.cinzel(
            fontSize: 14,
            letterSpacing: 4,
            fontWeight: FontWeight.w700,
            color: CodexPalette.gold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _finished ? _buildResult() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final q = widget.lesson.quiz[_current];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _selections[_current] == null ? null : _advance,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CodexFrame(
          padding: EdgeInsets.zero,
          borderColor: CodexPalette.goldDeep,
          child: Column(
            children: [
              const SizedBox(height: 4),
              const InkDivider(),
              Expanded(
                child: SingleChildScrollView(
                  child: QuizQuestionCard(
                    question: q,
                    questionNumber: _current + 1,
                    totalQuestions: widget.lesson.quiz.length,
                    currentSelection: _selections[_current],
                    onSelected: (opt) => _onSelected(_current, opt),
                  ),
                ),
              ),
              if (_selections[_current] != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: _advance,
                      style: FilledButton.styleFrom(
                        backgroundColor: CodexPalette.gold,
                        foregroundColor: CodexPalette.inkBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: Text(
                        _current + 1 == widget.lesson.quiz.length
                            ? 'COMPLETE EXAMINATION'
                            : 'NEXT QUESTION',
                        style: GoogleFonts.cinzel(
                          fontSize: 13,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult() {
    final correct = _selections.where((s) => s == true).length;
    final total = widget.lesson.quiz.length;
    final double pct = total == 0 ? 0 : (correct / total);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: CodexFrame(
          padding: const EdgeInsets.all(28),
          borderColor: CodexPalette.gold,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'EXAMINATION COMPLETE',
                style: GoogleFonts.cinzel(
                  fontSize: 14,
                  letterSpacing: 4,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '$correct / $total',
                style: GoogleFonts.cinzel(
                  fontSize: 56,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _verdict(pct),
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 20,
                  color: CodexPalette.textOnInk,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              const InkDivider(),
              const SizedBox(height: 16),
              Text(
                '+25 XP  ·  EXAMINATION BONUS',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 3,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _reset,
                    child: Text(
                      'RETAKE',
                      style: GoogleFonts.cinzel(
                        fontSize: 12,
                        letterSpacing: 3,
                        color: CodexPalette.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: FilledButton.styleFrom(
                      backgroundColor: CodexPalette.gold,
                      foregroundColor: CodexPalette.inkBlack,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text(
                      'CONTINUE',
                      style: GoogleFonts.cinzel(
                        fontSize: 12,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _verdict(double pct) {
    if (pct >= 0.8) return 'You have read between the lines. Mastery.';
    if (pct >= 0.5) return 'A worthy first attempt. Return to the chapter.';
    return 'The chapter awaits your deeper study. Begin again.';
  }
}
