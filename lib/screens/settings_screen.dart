import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/week_intros.dart';
import '../services/app_state.dart';
import '../services/codex_audio.dart';
import '../services/storage_service.dart';
import '../theme.dart';
import 'about_developer_screen.dart';
import 'codex_screen.dart';
import 'weekly_intro_screen.dart';

/// Settings — re-watch a week intro, or reset progress and start over.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        title: Text(
          'SETTINGS',
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
          _SoundToggle(),
          const SizedBox(height: 28),
          Text(
            'JOURNEY',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _SetCurrentDayRow(),
          const SizedBox(height: 28),
          Text(
            'RE-WATCH',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          for (final w in weekIntros) ...[
            _WeekRow(week: w.week, theme: w.theme),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 28),
          Text(
            'CREDITS',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 4,
              color: CodexPalette.gold,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _AboutRow(),
          const SizedBox(height: 28),
          Text(
            'DANGER',
            style: GoogleFonts.cinzel(
              fontSize: 11,
              letterSpacing: 4,
              color: CodexPalette.sealRedBright,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _ResetRow(),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const AboutDeveloperScreen(),
          ));
        },
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
                  border:
                      Border.all(color: CodexPalette.goldDeep, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(Icons.person_outline_rounded,
                    color: CodexPalette.gold, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT THE DEVELOPER',
                      style: GoogleFonts.cinzel(
                        fontSize: 11,
                        letterSpacing: 3,
                        color: CodexPalette.gold,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${AboutDeveloperScreen.developerName} · the hand behind the codex',
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

class _WeekRow extends StatelessWidget {
  final int week;
  final String theme;
  const _WeekRow({required this.week, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => WeeklyIntroScreen(
                week: week,
                onComplete: () => Navigator.of(context).pop(),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            color: CodexPalette.inkRaised,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CodexPalette.inkHigher,
                  border: Border.all(
                      color: CodexPalette.gold, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  'W$week',
                  style: GoogleFonts.cinzel(
                    fontSize: 14,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WEEK $week',
                      style: GoogleFonts.cinzel(
                        fontSize: 11,
                        letterSpacing: 3,
                        color: CodexPalette.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      theme,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 16,
                        color: CodexPalette.textOnInk,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.play_circle_outline_rounded,
                  color: CodexPalette.gold),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: () => _confirmReset(context),
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: CodexPalette.sealRed.withValues(alpha: 0.5),
                width: 0.5),
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.restart_alt_rounded,
                  color: CodexPalette.sealRedBright, size: 24),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RESET ALL PROGRESS',
                      style: GoogleFonts.cinzel(
                        fontSize: 12,
                        letterSpacing: 3,
                        color: CodexPalette.sealRedBright,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Wipe XP, badges, journal, and start fresh.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 14,
                        color: CodexPalette.textOnInkDim,
                        fontStyle: FontStyle.italic,
                      ),
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

  Future<void> _confirmReset(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: CodexPalette.inkRaised,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(
                color: CodexPalette.sealRed, width: 0.5),
          ),
          title: Text(
            'RESET THE CODEX?',
            style: GoogleFonts.cinzel(
              fontSize: 14,
              letterSpacing: 3,
              color: CodexPalette.sealRedBright,
              fontWeight: FontWeight.w800,
            ),
          ),
          content: Text(
            'This will erase all XP, badges, journal entries, and challenges. The 30-day journey will begin again from chapter one.',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 15,
              color: CodexPalette.textOnInk,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                'CANCEL',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  letterSpacing: 3,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.sealRed,
                foregroundColor: CodexPalette.textOnInk,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: Text(
                'RESET',
                style: GoogleFonts.cinzel(
                  fontSize: 11,
                  letterSpacing: 3,
                  color: CodexPalette.textOnInk,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      await context.read<AppState>().resetAll();
      if (!context.mounted) return;
      // Force storage service to mark first launch complete so user lands
      // straight on the codex (without onboarding) but with progress cleared.
      await context.read<StorageService>().setFirstLaunchComplete();
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const CodexScreen()),
        (_) => false,
      );
    }
  }
}

class _SoundToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storage = context.watch<StorageService>();
    final enabled = storage.soundEnabled;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CodexPalette.inkRaised,
        border: Border.all(
            color: CodexPalette.goldDeep.withValues(alpha: 0.5),
            width: 0.5),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CodexPalette.inkHigher,
              border: Border.all(
                  color: enabled
                      ? CodexPalette.gold
                      : CodexPalette.goldDeep,
                  width: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Icon(
              enabled
                  ? Icons.volume_up_rounded
                  : Icons.volume_off_rounded,
              color: enabled
                  ? CodexPalette.goldBright
                  : CodexPalette.textOnInkDim,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SOUND',
                  style: GoogleFonts.cinzel(
                    fontSize: 11,
                    letterSpacing: 3,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  enabled
                      ? 'Cinematic audio is on'
                      : 'Cinematic audio is muted',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 14,
                    color: CodexPalette.textOnInkDim,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: enabled,
            activeThumbColor: CodexPalette.gold,
            activeTrackColor:
                CodexPalette.gold.withValues(alpha: 0.3),
            inactiveThumbColor: CodexPalette.textOnInkDim,
            inactiveTrackColor: CodexPalette.inkHigher,
            onChanged: (val) async {
              await storage.setSoundEnabled(val);
              await CodexAudio.instance.setEnabled(val);
            },
          ),
        ],
      ),
    );
  }
}

/// "Set Current Day" — lets the user pick which chapter the codex
/// should treat as their current one. Used to recover from a crash
/// or to start partway through on a fresh install.
class _SetCurrentDayRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final current = state.progress.currentDay;
    final completed = state.progress.completedDays.length;
    return Material(
      color: CodexPalette.inkRaised,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: () => _openPicker(context, current, completed),
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
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CodexPalette.inkHigher,
                  border:
                      Border.all(color: CodexPalette.gold, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  '$current',
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SET CURRENT DAY',
                      style: GoogleFonts.cinzel(
                        fontSize: 11,
                        letterSpacing: 3,
                        color: CodexPalette.gold,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      completed == 0
                          ? 'Choose which chapter to begin on'
                          : '$completed chapter${completed == 1 ? '' : 's'} sealed · currently on chapter $current',
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

  Future<void> _openPicker(
      BuildContext context, int current, int completed) async {
    final state = context.read<AppState>();
    // The picker lets the user go up to completed+2 (so they can
    // preview the next chapter) but no further.
    final maxDay = (completed + 2).clamp(1, 30);
    int selected = current;
    final picked = await showDialog<int>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSt) {
            return AlertDialog(
              backgroundColor: CodexPalette.inkRaised,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: const BorderSide(
                    color: CodexPalette.goldDeep, width: 0.5),
              ),
              title: Text(
                'SET CURRENT CHAPTER',
                style: GoogleFonts.cinzel(
                  fontSize: 13,
                  letterSpacing: 3,
                  color: CodexPalette.gold,
                  fontWeight: FontWeight.w800,
                ),
              ),
              content: SizedBox(
                width: 320,
                height: 380,
                child: Column(
                  children: [
                    Text(
                      'Pick the chapter you are on. You can move up to two ahead of what you have finished.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 14,
                        color: CodexPalette.textOnInkDim,
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: maxDay,
                        itemBuilder: (_, i) {
                          final d = i + 1;
                          final isSel = d == selected;
                          final isDone = state.progress.completedDays
                              .contains(d);
                          return GestureDetector(
                            onTap: () => setSt(() => selected = d),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSel
                                    ? CodexPalette.gold
                                    : isDone
                                        ? CodexPalette.inkHigher
                                        : CodexPalette.inkBlack,
                                border: Border.all(
                                  color: isSel
                                      ? CodexPalette.goldBright
                                      : isDone
                                          ? CodexPalette.goldDeep
                                          : CodexPalette.goldDeep
                                              .withValues(alpha: 0.4),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                '$d',
                                style: GoogleFonts.cinzel(
                                  fontSize: 14,
                                  color: isSel
                                      ? CodexPalette.inkBlack
                                      : isDone
                                          ? CodexPalette.gold
                                          : CodexPalette.textOnInkDim,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(null),
                  child: Text(
                    'CANCEL',
                    style: GoogleFonts.cinzel(
                      fontSize: 11,
                      letterSpacing: 3,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(selected),
                  style: FilledButton.styleFrom(
                    backgroundColor: CodexPalette.gold,
                    foregroundColor: CodexPalette.inkBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Text(
                    'SET',
                    style: GoogleFonts.cinzel(
                      fontSize: 11,
                      letterSpacing: 3,
                      color: CodexPalette.inkBlack,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
    if (picked != null && context.mounted) {
      await context.read<AppState>().setCurrentDay(picked);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Current chapter set to $picked'),
          backgroundColor: CodexPalette.inkHigher,
        ),
      );
    }
  }
}
