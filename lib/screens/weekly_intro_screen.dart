import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/week_intros.dart';
import '../models/app_models.dart';
import '../services/app_state.dart';
import '../widgets/cinematic_intro.dart';

/// Plays once when the user first opens a day in a new week.
class WeeklyIntroScreen extends StatefulWidget {
  final int week;
  final VoidCallback? onComplete;

  const WeeklyIntroScreen({super.key, required this.week, this.onComplete});

  @override
  State<WeeklyIntroScreen> createState() => _WeeklyIntroScreenState();
}

class _WeeklyIntroScreenState extends State<WeeklyIntroScreen> {
  WeekIntro? _intro;

  @override
  void initState() {
    super.initState();
    // Mark this week as seen as soon as the screen is shown.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().markWeekIntroSeen(widget.week);
    });
    for (final w in weekIntros) {
      if (w.week == widget.week) {
        _intro = w;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_intro == null) {
      // Unknown week — skip immediately.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.onComplete?.call();
      });
      return const Scaffold(body: SizedBox.shrink());
    }

    return CinematicIntro(
      bookendTop: 'WEEK ${romanWeek(widget.week)}',
      lines: _intro!.lines,
      bookendBottom: _intro!.theme.toUpperCase(),
      onComplete: widget.onComplete,
    );
  }
}

String romanWeek(int n) {
  switch (n) {
    case 1:
      return 'ONE';
    case 2:
      return 'TWO';
    case 3:
      return 'THREE';
    case 4:
      return 'FOUR';
    default:
      return '$n';
  }
}
