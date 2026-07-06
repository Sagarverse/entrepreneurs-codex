import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'services/app_state.dart';
import 'services/codex_audio.dart';
import 'services/storage_service.dart';
import 'theme.dart';
import 'widgets/animated_seal.dart';
import 'screens/codex_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/weekly_intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = StorageService();
  await storage.init();
  await CodexAudio.instance.init();
  // Load sound preference from storage
  await CodexAudio.instance
      .setEnabled(storage.soundEnabled);
  runApp(EntrepreneurApp(storage: storage));
}

class EntrepreneurApp extends StatelessWidget {
  final StorageService storage;
  const EntrepreneurApp({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StorageService>.value(value: storage),
        ChangeNotifierProvider(create: (_) => AppState(storage)),
      ],
      child: MaterialApp(
        title: 'The Entrepreneur\'s Codex',
        debugShowCheckedModeBanner: false,
        theme: CodexTheme.build(),
        darkTheme: CodexTheme.build(),
        themeMode: ThemeMode.dark,
        home: const _SplashGate(),
      ),
    );
  }
}

/// Decides what to show on app start:
///   1. First launch → onboarding.
///   2. Otherwise → 1.6s seal splash → check if the user just landed on a
///      new week and hasn't seen its intro yet → show [WeeklyIntroScreen]
///      once → otherwise → [CodexScreen].
class _SplashGate extends StatefulWidget {
  const _SplashGate();

  @override
  State<_SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<_SplashGate> {
  late final Future<_SplashDecision> _decision;
  bool _entered = false;

  @override
  void initState() {
    super.initState();
    _decision = _decide();
    // Play the Arabic bell once the gate is up.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 250), () {
        CodexAudio.instance.bell();
      });
    });
  }

  Future<_SplashDecision> _decide() async {
    final storage = context.read<StorageService>();
    if (storage.isFirstLaunch) {
      return const _SplashDecision.route(_RouteKind.onboarding);
    }
    // Hold the seal for ~1.6s so it feels like a moment, not a flash.
    await Future.delayed(const Duration(milliseconds: 1600));
    if (!mounted) return const _SplashDecision.route(_RouteKind.codex);
    final state = context.read<AppState>();
    final day = state.progress.currentDay;
    final week = state.weekOfDay(day);
    final highestCompleted = state.progress.completedDays.isEmpty
        ? 0
        : state.progress.completedDays.reduce((a, b) => a > b ? a : b);
    // First day of this week (days 1, 8, 15, 22) — show weekly intro once.
    final isFirstOfWeek = day == (week - 1) * 7 + 1;
    if (isFirstOfWeek &&
        highestCompleted < day &&
        !state.hasSeenWeekIntro(week)) {
      return _SplashDecision.routeWithWeek(_RouteKind.weeklyIntro, week);
    }
    return const _SplashDecision.route(_RouteKind.codex);
  }

  void _go(_SplashDecision decision) {
    if (_entered || !mounted) return;
    _entered = true;
    switch (decision.kind) {
      case _RouteKind.onboarding:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ));
        break;
      case _RouteKind.weeklyIntro:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => WeeklyIntroScreen(
            week: decision.week ?? 1,
            onComplete: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const CodexScreen())),
          ),
        ));
        break;
      case _RouteKind.codex:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const CodexScreen(),
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      body: Center(
        child: FutureBuilder<_SplashDecision>(
          future: _decision,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AnimatedSeal(size: 120, progress: 0),
                  const SizedBox(height: 32),
                  Text(
                    'THE ENTREPRENEUR\'S CODEX',
                    style: GoogleFonts.cinzel(
                      fontSize: 14,
                      letterSpacing: 6,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              );
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _go(snap.data!);
            });
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AnimatedSeal(size: 120, progress: 0),
                const SizedBox(height: 32),
                Text(
                  'THE ENTREPRENEUR\'S CODEX',
                  style: GoogleFonts.cinzel(
                    fontSize: 14,
                    letterSpacing: 6,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum _RouteKind { onboarding, codex, weeklyIntro }

class _SplashDecision {
  final _RouteKind kind;
  final int? week;
  const _SplashDecision.route(this.kind) : week = null;
  const _SplashDecision.routeWithWeek(this.kind, this.week);
}
