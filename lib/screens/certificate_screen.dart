import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';
import '../services/certificate_service.dart';
import '../services/codex_audio.dart';
import '../theme.dart';
import '../widgets/codex_frame.dart';

/// The final reward — a printable PDF certificate the user earns when
/// all 30 chapters of the codex are sealed.
class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  Uint8List? _pdfBytes;
  bool _building = false;
  bool _buildingStarted = false;

  @override
  void initState() {
    super.initState();
    // Soft bell on arrival — the moment should feel earned.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      CodexAudio.instance.bell(scale: 0.7);
      _build();
    });
  }

  Future<void> _build() async {
    if (_buildingStarted) return;
    _buildingStarted = true;
    setState(() => _building = true);
    try {
      final state = context.read<AppState>();
      final bytes = await CertificateService.build(state.progress);
      if (!mounted) return;
      setState(() {
        _pdfBytes = bytes;
        _building = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _building = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not build certificate: $e'),
          backgroundColor: CodexPalette.inkHigher,
        ),
      );
    }
  }

  Future<void> _share() async {
    if (_pdfBytes == null) return;
    final state = context.read<AppState>();
    final name = state.progress.userName.trim().isEmpty
        ? 'entrepreneur'
        : _safeFile(state.progress.userName);
    await CertificateService.shareOrPrint(
      _pdfBytes!,
      'codex-certificate-$name.pdf',
    );
  }

  String _safeFile(String s) =>
      s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'-+'), '-').replaceAll(RegExp(r'^-|-$'), '');

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final p = state.progress;
    return Scaffold(
      backgroundColor: CodexPalette.inkBlack,
      appBar: AppBar(
        backgroundColor: CodexPalette.inkBlack,
        foregroundColor: CodexPalette.gold,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'YOUR CERTIFICATE',
          style: GoogleFonts.cinzel(
            fontSize: 13,
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
            padding: const EdgeInsets.all(24),
            borderColor: CodexPalette.gold,
            child: Column(
              children: [
                const Icon(Icons.workspace_premium_rounded,
                    color: CodexPalette.gold, size: 32),
                const SizedBox(height: 12),
                Text(
                  'THE CODEX IS COMPLETE',
                  style: GoogleFonts.cinzel(
                    fontSize: 12,
                    letterSpacing: 4,
                    color: CodexPalette.gold,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Thirty chapters. Thirty seals. Yours, kept.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 16,
                    color: CodexPalette.textOnInk,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 18),
                _StatRow(label: 'TOTAL XP', value: '${p.totalXp}'),
                const SizedBox(height: 6),
                _StatRow(label: 'LEVEL', value: p.level),
                const SizedBox(height: 6),
                _StatRow(
                    label: 'EXAMINATIONS PASSED',
                    value: '${p.completedQuizzes}'),
                const SizedBox(height: 6),
                _StatRow(
                    label: 'JOURNAL ENTRIES',
                    value: '${p.journalEntries.length}'),
                const SizedBox(height: 6),
                _StatRow(
                    label: 'SEALED ON',
                    value: p.codexCompletedAt != null
                        ? _formatDate(DateTime.fromMillisecondsSinceEpoch(
                            p.codexCompletedAt!))
                        : '—'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _CertificatePreview(
            bytes: _pdfBytes,
            building: _building,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton.icon(
              onPressed: _pdfBytes == null ? null : _share,
              icon: const Icon(Icons.ios_share_rounded, size: 18),
              label: Text(
                _pdfBytes == null ? 'PREPARING…' : 'SHARE OR PRINT PDF',
                style: GoogleFonts.cinzel(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: CodexPalette.gold,
                disabledBackgroundColor: CodexPalette.inkHigher,
                foregroundColor: CodexPalette.inkBlack,
                disabledForegroundColor: CodexPalette.textOnInkDim,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'RETURN TO THE CODEX',
              style: GoogleFonts.cinzel(
                fontSize: 11,
                letterSpacing: 3,
                color: CodexPalette.gold,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          value,
          style: GoogleFonts.cinzel(
            fontSize: 14,
            color: CodexPalette.goldBright,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _CertificatePreview extends StatelessWidget {
  final Uint8List? bytes;
  final bool building;
  const _CertificatePreview({required this.bytes, required this.building});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: CodexPalette.inkRaised,
        border: Border.all(color: CodexPalette.goldDeep, width: 0.5),
        borderRadius: BorderRadius.circular(2),
      ),
      child: building
          ? const Center(
              child: CircularProgressIndicator(
                color: CodexPalette.gold,
                strokeWidth: 1.5,
              ),
            )
          : bytes == null
              ? Center(
                  child: Text(
                    'PREPARING CERTIFICATE…',
                    style: GoogleFonts.cinzel(
                      fontSize: 10,
                      letterSpacing: 3,
                      color: CodexPalette.textOnInkDim,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.picture_as_pdf_rounded,
                            color: CodexPalette.gold, size: 36),
                        const SizedBox(height: 12),
                        Text(
                          'CERTIFICATE OF COMPLETION',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            fontSize: 11,
                            letterSpacing: 4,
                            color: CodexPalette.goldBright,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'A landscape A4 PDF, ink & gold, ready to print or share.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 13,
                            color: CodexPalette.textOnInkDim,
                            fontStyle: FontStyle.italic,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
