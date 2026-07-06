import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../theme.dart';

/// A single quiz question with cinematic reveal of correct/incorrect.
class QuizQuestionCard extends StatefulWidget {
  final QuizQuestion question;
  final int questionNumber;
  final int totalQuestions;
  final bool? currentSelection; // null = not answered, true = correct, false = wrong
  final ValueChanged<int> onSelected;
  final VoidCallback? onContinue;

  const QuizQuestionCard({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.currentSelection,
    required this.onSelected,
    this.onContinue,
  });

  @override
  State<QuizQuestionCard> createState() => _QuizQuestionCardState();
}

class _QuizQuestionCardState extends State<QuizQuestionCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final answered = widget.currentSelection != null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EXAMINATION',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: CodexPalette.gold,
                  letterSpacing: 3,
                ),
              ),
              Text(
                '${widget.questionNumber} of ${widget.totalQuestions}',
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: widget.questionNumber / widget.totalQuestions,
              minHeight: 2,
              backgroundColor: CodexPalette.inkHigher,
              valueColor: const AlwaysStoppedAnimation(CodexPalette.gold),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            widget.question.question,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 28),
          // Options
          for (var i = 0; i < widget.question.options.length; i++) ...[
            _OptionTile(
              label: String.fromCharCode(65 + i), // A, B, C, D
              text: widget.question.options[i],
              state: _stateFor(i),
              onTap: answered ? null : () => widget.onSelected(i),
            ),
            const SizedBox(height: 10),
          ],
          if (answered) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.currentSelection!
                    ? CodexPalette.gold.withValues(alpha: 0.12)
                    : CodexPalette.sealRed.withValues(alpha: 0.12),
                border: Border.all(
                  color: widget.currentSelection!
                      ? CodexPalette.gold
                      : CodexPalette.sealRed,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.currentSelection! ? 'CORRECT' : 'NOT QUITE',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: widget.currentSelection!
                          ? CodexPalette.gold
                          : CodexPalette.sealRedBright,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.question.explanation,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: CodexPalette.textOnInk,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (widget.onContinue != null)
              Center(
                child: Text(
                  'TAP ANYWHERE TO CONTINUE',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: CodexPalette.gold,
                    letterSpacing: 3,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  _OptionState _stateFor(int i) {
    if (widget.currentSelection == null) return _OptionState.idle;
    if (i == widget.question.correctIndex) return _OptionState.correct;
    return _OptionState.faded;
  }
}

enum _OptionState { idle, correct, faded, wrong }

class _OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final _OptionState state;
  final VoidCallback? onTap;

  const _OptionTile({
    required this.label,
    required this.text,
    required this.state,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color border = CodexPalette.goldDeep;
    Color bg = CodexPalette.inkRaised;
    Color fg = CodexPalette.textOnInk;
    Widget? badge;

    switch (state) {
      case _OptionState.idle:
        break;
      case _OptionState.correct:
        border = CodexPalette.gold;
        bg = CodexPalette.gold.withValues(alpha: 0.12);
        badge = const Icon(Icons.check_circle_rounded, color: CodexPalette.gold);
        break;
      case _OptionState.faded:
        fg = CodexPalette.textOnInkDim;
        break;
      case _OptionState.wrong:
        border = CodexPalette.sealRed;
        bg = CodexPalette.sealRed.withValues(alpha: 0.10);
        badge = const Icon(Icons.cancel_rounded, color: CodexPalette.sealRedBright);
        break;
    }

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: border, width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: border),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: state == _OptionState.faded
                          ? CodexPalette.textOnInkDim
                          : CodexPalette.gold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(color: fg),
                ),
              ),
              if (badge != null) ...[
                const SizedBox(width: 8),
                badge,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
