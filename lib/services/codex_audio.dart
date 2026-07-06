import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// Minimal sound design for The Entrepreneur's Codex.
///
/// ONE sound — an Arabic bell — plays for the meaningful moments of the
/// journey: app open, chapter start, chapter complete, key actions. The
/// codex is a quiet place; it does not need a soundtrack.
class CodexAudio {
  CodexAudio._();
  static final CodexAudio instance = CodexAudio._();

  final AudioPlayer _bell = AudioPlayer(playerId: 'codex_bell');

  bool _enabled = true;
  double _volume = 0.7;

  bool get enabled => _enabled;
  double get volume => _volume;

  Future<void> init() async {
    await _bell.setReleaseMode(ReleaseMode.stop);
    await _bell.setVolume(_volume);
  }

  Future<void> setEnabled(bool value) async {
    _enabled = value;
    if (!value) {
      await _bell.stop();
    }
  }

  Future<void> setVolume(double v) async {
    _volume = v.clamp(0.0, 1.0);
    await _bell.setVolume(_volume);
  }

  /// The Arabic bell. Plays for every meaningful moment in the codex.
  /// `volume` is a 0..1 scale on top of the master volume so the same
  /// asset can ring loud for a chapter seal and quiet for a button tap.
  Future<void> bell({double scale = 1.0}) async {
    if (!_enabled) return;
    try {
      await _bell.setVolume((_volume * scale).clamp(0.0, 1.0));
      await _bell.play(AssetSource('sounds/intro.wav'));
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('CodexAudio: bell failed: $e');
      }
    }
  }

  Future<void> dispose() async {
    await _bell.dispose();
  }
}
