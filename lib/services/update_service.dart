import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Checks GitHub Releases for a newer version of The Entrepreneur's
/// Codex. When a release is published with a `tag_name` matching a
/// semver string (e.g. "v1.0.1" or "1.0.1") that's greater than the
/// running app's [currentVersion], the user is shown a non-blocking
/// prompt that opens the release page (or, on Android, the Play
/// Store listing) so they can update.
class UpdateService {
  /// The GitHub owner + repo the app reads releases from. Edit this
  /// if the repo ever moves.
  static const String repoOwner = 'Sagarverse';
  static const String repoName = 'entrepreneurs-codex';

  /// The version of *this* build. Must match the version in
  /// `pubspec.yaml`. The auto-update check ignores the build number
  /// suffix (+1) and compares the X.Y.Z semver triple.
  static const String currentVersion = '1.0.0';

  /// Play Store listing — only used on Android. The release-page
  /// fallback works for every platform.
  static const String androidPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.sagarverse.entrepreneurs_codex';

  /// Public release page for a specific tag — used when we know the
  /// newer version. This is also the cross-platform fallback the
  /// update prompt opens.
  static String releasePageFor(String tag) =>
      'https://github.com/$repoOwner/$repoName/releases/tag/$tag';

  /// Result of a check.
  static const UpdateStatus upToDate = UpdateStatus._('up_to_date');
  static const UpdateStatus noNetwork = UpdateStatus._('no_network');
  static const UpdateStatus error = UpdateStatus._('error');

  /// Fetches the latest release from GitHub. Returns one of:
  ///   - [UpdateCheck] with status = [UpdateStatus.updateAvailable]
  ///     and a download URL if a newer version is available,
  ///   - [UpdateStatus.upToDate] when the user is on the newest version,
  ///   - [UpdateStatus.noNetwork] when offline,
  ///   - [UpdateStatus.error] on any other failure.
  ///
  /// This is intentionally fire-and-forget — failures are silent,
  /// the app should never block launch because the release API
  /// happened to be down.
  static Future<UpdateCheck> checkForUpdate() async {
    final uri = Uri.parse(
      'https://api.github.com/repos/$repoOwner/$repoName/releases/latest',
    );
    try {
      final res = await http.get(
        uri,
        headers: const {'Accept': 'application/vnd.github+json'},
      ).timeout(const Duration(seconds: 6));
      if (res.statusCode != 200) {
        return UpdateCheck._(upToDate, null, null,
            'GitHub returned ${res.statusCode}');
      }
      final body = json.decode(res.body) as Map<String, dynamic>;
      final tag = (body['tag_name'] as String?) ?? '';
      final htmlUrl =
          (body['html_url'] as String?) ?? releasePageFor(tag);
      final newer = _isNewer(tag, currentVersion);
      return UpdateCheck._(
        newer ? UpdateStatus.updateAvailable : upToDate,
        newer ? tag : null,
        newer ? htmlUrl : null,
        null,
      );
    } on Exception catch (e) {
      if (kDebugMode) debugPrint('UpdateService: $e');
      return UpdateCheck._(noNetwork, null, null, '$e');
    }
  }

  /// Compares two semver strings (e.g. "1.2.3" vs "1.10.0"). A "v"
  /// prefix is tolerated. Returns true if [candidate] is strictly
  /// newer than [current]. Any parse failure returns false (i.e.
  /// "don't prompt the user") so a malformed tag never blocks
  /// normal use of the app.
  static bool _isNewer(String candidate, String current) {
    final a = _parse(candidate);
    final b = _parse(current);
    if (a == null || b == null) return false;
    for (var i = 0; i < 3; i++) {
      if (a[i] > b[i]) return true;
      if (a[i] < b[i]) return false;
    }
    return false;
  }

  static List<int>? _parse(String v) {
    var s = v.trim();
    if (s.toLowerCase().startsWith('v')) s = s.substring(1);
    final parts = s.split('.');
    if (parts.isEmpty || parts.length > 3) return null;
    final out = <int>[];
    for (final p in parts) {
      final n = int.tryParse(p);
      if (n == null || n < 0) return null;
      out.add(n);
    }
    while (out.length < 3) {
      out.add(0);
    }
    return out;
  }

  /// Opens the given URL in the platform's browser. Used by the
  /// update dialog. Returns true if a browser was launched, false
  /// if no handler was available.
  static Future<bool> openReleasePage(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }
}

/// Status returned by [UpdateService.checkForUpdate]. Plain const
/// class instead of an enum because we need `const` singletons of
/// well-known statuses that can be passed around by reference.
class UpdateStatus {
  final String id;
  const UpdateStatus._(this.id);

  static const updateAvailable = UpdateStatus._('update_available');
  static const upToDate = UpdateStatus._('up_to_date');
  static const noNetwork = UpdateStatus._('no_network');
  static const error = UpdateStatus._('error');
}

class UpdateCheck {
  final UpdateStatus status;
  final String? newTag;
  final String? releaseUrl;
  final String? message;

  const UpdateCheck._(
    this.status,
    this.newTag,
    this.releaseUrl,
    this.message,
  );

  bool get hasUpdate => status == UpdateStatus.updateAvailable;
}
