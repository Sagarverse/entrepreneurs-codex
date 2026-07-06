import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/app_models.dart';

/// Builds the gold/ink PDF certificate the user earns on completion
/// of all 30 chapters of The Entrepreneur's Codex.
///
/// Template: landscape A4 (842 × 595 pt), ink-black background, gold
/// rules and serif type. The user's name is the centerpiece.
class CertificateService {
  static const _ink = PdfColor.fromInt(0xFF0A0A0F);
  static const _inkRaised = PdfColor.fromInt(0xFF13131A);
  static const _gold = PdfColor.fromInt(0xFFC9A961);
  static const _goldBright = PdfColor.fromInt(0xFFE5C77A);
  static const _goldDeep = PdfColor.fromInt(0xFF8B7430);
  static const _parchment = PdfColor.fromInt(0xFFEDE3CB);
  static const _parchmentDim = PdfColor.fromInt(0xFF8A7E66);

  /// Build a one-page landscape A4 PDF for the user. Returns the raw
  /// bytes so callers can share/print/save as needed.
  static Future<Uint8List> build(UserProgress p) async {
    final doc = pw.Document(
      title: 'The Entrepreneur\'s Codex — Certificate of Completion',
      author: 'The Entrepreneur\'s Codex',
    );

    final name = p.userName.trim().isEmpty
        ? 'The Entrepreneur'
        : p.userName.trim();
    final completed = p.codexCompletedAt != null
        ? _formatDate(DateTime.fromMillisecondsSinceEpoch(p.codexCompletedAt!))
        : _formatDate(DateTime.now());

    const closing = [
      'Mindset forged. Skill sharpened.',
      'Action taken. Reflection written.',
      'The codex is now yours to keep.',
    ];

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Container(
            color: _ink,
            child: pw.Padding(
              padding: const pw.EdgeInsets.fromLTRB(48, 40, 48, 40),
              child: pw.Container(
                decoration: _outerFrame(),
                padding: const pw.EdgeInsets.fromLTRB(36, 30, 36, 30),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    _header(),
                    pw.SizedBox(height: 12),
                    _awardLine(),
                    pw.SizedBox(height: 22),
                    _recipient(name),
                    pw.SizedBox(height: 16),
                    _divider(),
                    pw.SizedBox(height: 12),
                    _reason(),
                    pw.SizedBox(height: 16),
                    _closingLines(closing),
                    pw.Spacer(),
                    _footerRow(p, completed),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    return doc.save();
  }

  // ---------- Pieces of the template ----------

  static pw.BoxDecoration _outerFrame() {
    return pw.BoxDecoration(
      color: _inkRaised,
      border: pw.Border.all(color: _goldDeep, width: 0.6),
    );
  }

  static pw.Widget _header() {
    return pw.Column(
      children: [
        // Small ornament: a gold horizontal rule, centered, with a
        // diamond in the middle — matches the InkDivider motif.
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Expanded(
              child: pw.Container(
                height: 0.6,
                color: _goldDeep,
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 14),
              child: pw.Text(
                '✦',
                style: pw.TextStyle(
                  color: _gold,
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Container(
                height: 0.6,
                color: _goldDeep,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'THE ENTREPRENEUR\'S CODEX',
          style: pw.TextStyle(
            color: _gold,
            fontSize: 12,
            letterSpacing: 6,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 6),
        pw.Text(
          'A thirty-day journey of the mind, the hand, and the pen',
          style: pw.TextStyle(
            color: _parchmentDim,
            fontSize: 10,
            fontStyle: pw.FontStyle.italic,
          ),
        ),
      ],
    );
  }

  static pw.Widget _awardLine() {
    return pw.Text(
      'CERTIFICATE OF COMPLETION',
      style: pw.TextStyle(
        color: _goldBright,
        fontSize: 30,
        letterSpacing: 6,
        fontWeight: pw.FontWeight.bold,
      ),
    );
  }

  static pw.Widget _recipient(String name) {
    return pw.Column(
      children: [
        pw.Text(
          'awarded to',
          style: pw.TextStyle(
            color: _parchmentDim,
            fontSize: 11,
            fontStyle: pw.FontStyle.italic,
            letterSpacing: 2,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          name,
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            color: _goldBright,
            fontSize: 38,
            fontWeight: pw.FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        pw.SizedBox(height: 8),
        // Underline under the name
        pw.Container(
          width: 220,
          height: 0.8,
          color: _gold,
        ),
      ],
    );
  }

  static pw.Widget _divider() {
    return pw.Container(
      width: 60,
      height: 0.6,
      color: _goldDeep,
    );
  }

  static pw.Widget _reason() {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 60),
      child: pw.Text(
        'for the unwavering completion of all thirty chapters, every trial, '
        'every reflection, and every examination — the entire codex, '
        'begun and seen through to its end.',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          color: _parchment,
          fontSize: 12,
          lineSpacing: 4,
        ),
      ),
    );
  }

  static pw.Widget _closingLines(List<String> lines) {
    return pw.Column(
      children: [
        for (final line in lines)
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Text(
              line,
              style: pw.TextStyle(
                color: _gold,
                fontSize: 11,
                fontStyle: pw.FontStyle.italic,
                letterSpacing: 1,
              ),
            ),
          ),
      ],
    );
  }

  static pw.Widget _footerRow(UserProgress p, String completedDate) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        // Left: date
        _signatureBlock('SEALED', completedDate),
        // Center: codex seal
        pw.Container(
          width: 70,
          height: 70,
          decoration: pw.BoxDecoration(
            shape: pw.BoxShape.circle,
            color: _ink,
            border: pw.Border.all(color: _gold, width: 1.2),
          ),
          child: pw.Center(
            child: pw.Text(
              '✦',
              style: pw.TextStyle(
                color: _gold,
                fontSize: 36,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ),
        // Right: stats
        _signatureBlock(
          'AWARDED FOR',
          'Level ${p.level}  ·  ${p.totalXp} XP  ·  ${p.completedQuizzes} examinations',
          align: pw.TextAlign.right,
        ),
      ],
    );
  }

  static pw.Widget _signatureBlock(
    String label,
    String value, {
    pw.TextAlign align = pw.TextAlign.left,
  }) {
    return pw.Column(
      crossAxisAlignment: align == pw.TextAlign.right
          ? pw.CrossAxisAlignment.end
          : pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            color: _gold,
            fontSize: 8,
            letterSpacing: 3,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Container(
          width: 160,
          height: 0.5,
          color: _goldDeep,
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          textAlign: align,
          style: pw.TextStyle(
            color: _parchment,
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  /// Share a built PDF via the platform's print/share sheet.
  static Future<void> shareOrPrint(Uint8List bytes, String filename) async {
    await Printing.sharePdf(bytes: bytes, filename: filename);
  }
}
