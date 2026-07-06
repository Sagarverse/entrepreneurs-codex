import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/update_service.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';

/// About the Developer — a small, gold-ink framed card that introduces
/// the person behind The Entrepreneur's Codex, with tappable links for
/// phone, email, and the GitHub repo.
class AboutDeveloperScreen extends StatelessWidget {
  const AboutDeveloperScreen({super.key});

  // Developer contact — published with the app. Edit here if these
  // ever change.
  static const String developerName = 'Sagar M';
  static const String developerPhone = '+91 9019989269';
  static const String developerPhoneRaw = 'tel:+919019989269';
  static const String developerEmail = 'sagarm.2k5@gmail.com';
  static const String developerEmailRaw = 'mailto:sagarm.2k5@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'ABOUT THE DEVELOPER',
          style: GoogleFonts.cinzel(
            fontSize: 12,
            letterSpacing: 4,
            color: CodexPalette.gold,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          CodexFrame(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
            borderColor: CodexPalette.gold,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CodexPalette.inkBlack,
                    border:
                        Border.all(color: CodexPalette.gold, width: 1),
                  ),
                  child: Text(
                    'S',
                    style: GoogleFonts.cinzel(
                      fontSize: 38,
                      color: CodexPalette.goldBright,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  developerName,
                  style: GoogleFonts.cinzel(
                    fontSize: 22,
                    color: CodexPalette.goldBright,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'CREATOR · THE ENTREPRENEUR\'S CODEX',
                  style: GoogleFonts.cinzel(
                    fontSize: 9,
                    letterSpacing: 3,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                Container(width: 60, height: 0.5, color: CodexPalette.goldDeep),
                const SizedBox(height: 20),
                Text(
                  'A thirty-day journey of the mind, the hand, and the pen — '
                  'forged in ink and gold by an entrepreneur who believes '
                  'mindset is the first capital.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 16,
                    color: CodexPalette.textOnInk,
                    height: 1.55,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _ContactRow(
            icon: Icons.phone_iphone_rounded,
            label: 'PHONE',
            value: developerPhone,
            onTap: () => _open(context, developerPhoneRaw),
          ),
          const SizedBox(height: 10),
          _ContactRow(
            icon: Icons.alternate_email_rounded,
            label: 'EMAIL',
            value: developerEmail,
            onTap: () => _open(context, developerEmailRaw),
          ),
          const SizedBox(height: 10),
          _ContactRow(
            icon: Icons.code_rounded,
            label: 'GITHUB',
            value: 'github.com/${UpdateService.repoOwner}/${UpdateService.repoName}',
            onTap: () => _open(
              context,
              'https://github.com/${UpdateService.repoOwner}/${UpdateService.repoName}',
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Column(
              children: [
                Text(
                  'MADE WITH CARE',
                  style: GoogleFonts.cinzel(
                    fontSize: 9,
                    letterSpacing: 4,
                    color: CodexPalette.textOnInkDim,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'v${UpdateService.currentVersion} · The Entrepreneur\'s Codex',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 13,
                    color: CodexPalette.textOnInkDim,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await canLaunchUrl(uri) &&
        await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open $url'),
          backgroundColor: CodexPalette.inkHigher,
        ),
      );
    }
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
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
                  border:
                      Border.all(color: CodexPalette.goldDeep, width: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Icon(icon, color: CodexPalette.gold, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.cinzel(
                        fontSize: 10,
                        letterSpacing: 3,
                        color: CodexPalette.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 15,
                        color: CodexPalette.textOnInk,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.open_in_new_rounded,
                  color: CodexPalette.gold, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
