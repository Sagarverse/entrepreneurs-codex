import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/update_service.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';

/// A non-blocking prompt shown when [UpdateService] finds a newer
/// version on GitHub Releases. The user can update now (opens the
/// release page) or dismiss — the check is silent on subsequent
/// launches.
class UpdatePromptSheet extends StatelessWidget {
  final String newTag;
  final String releaseUrl;
  const UpdatePromptSheet({
    super.key,
    required this.newTag,
    required this.releaseUrl,
  });

  /// Convenience for showing this sheet from anywhere.
  static Future<void> show(
    BuildContext context, {
    required String newTag,
    required String releaseUrl,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => UpdatePromptSheet(
        newTag: newTag,
        releaseUrl: releaseUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: CodexFrame(
          padding: const EdgeInsets.all(24),
          borderColor: CodexPalette.gold,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome_rounded,
                      color: CodexPalette.gold, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'A NEW EDITION OF THE CODEX',
                    style: GoogleFonts.cinzel(
                      fontSize: 10,
                      letterSpacing: 4,
                      color: CodexPalette.gold,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Version $newTag is now available',
                style: GoogleFonts.cinzel(
                  fontSize: 22,
                  color: CodexPalette.goldBright,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'A new chapter of the codex has been sealed. '
                'Refresh the seal of your installation to walk with it.',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 16,
                  color: CodexPalette.textOnInk,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () async {
                    final ok =
                        await UpdateService.openReleasePage(releaseUrl);
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                    if (!ok && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not open the release page.'),
                        ),
                      );
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: CodexPalette.gold,
                    foregroundColor: CodexPalette.inkBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Text(
                    'UPDATE THE CODEX',
                    style: GoogleFonts.cinzel(
                      fontSize: 12,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'NOT NOW',
                    style: GoogleFonts.cinzel(
                      fontSize: 11,
                      letterSpacing: 3,
                      color: CodexPalette.textOnInkDim,
                      fontWeight: FontWeight.w700,
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
}
