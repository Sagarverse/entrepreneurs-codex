# How to ship a new version

This is the procedure for cutting a new release of
**The Entrepreneur's Codex**. Follow it in order; each step
exists because the next one depends on it.

## 1. Bump the version

In `pubspec.yaml`:

```yaml
version: 1.1.0+2
```

The format is `MAJOR.MINOR.PATCH+BUILD`. The auto-update check
in the app compares the `MAJOR.MINOR.PATCH` triple to the
GitHub Release `tag_name` and prompts the user if the release
is strictly newer.

Also update `currentVersion` in
`lib/services/update_service.dart` so the in-app version label
on the About screen stays in sync.

## 2. Update the changelog

Append a new section to `store/changelog.md`. Group changes
under **Added**, **Changed**, **Fixed**, **Removed**. The first
line of the section becomes the GitHub Release body — keep it
human.

## 3. Commit + tag

```bash
git add -A
git commit -m "Bump to 1.1.0 — <one-line summary>"
git tag v1.1.0
git push origin main
git push origin v1.1.0
```

The tag must be exactly `vX.Y.Z` (the `v` prefix is required;
the auto-update parser strips it before comparing).

## 4. Publish the GitHub Release

```bash
gh release create v1.1.0 \
  --title "v1.1.0 — <one-line summary>" \
  --notes-file store/changelog.md
```

The release body is shown verbatim to users when they tap
"View release notes" from the in-app update prompt.

For the very first release you may also want to upload build
artifacts (`.apk`, `.aab`, `.ipa`). If you do, mention them
in the body — the in-app prompt only links to the release
page itself.

## 5. Verify the update check

On any device running an older build:

1. Open the app — the Arabic bell sounds, the codex fades in.
2. Within ~2 seconds, the gold "A new edition of the codex"
   sheet appears.
3. Tap **Update the Codex** — your default browser opens
   the new release page.
4. Tap **Not now** — the sheet dismisses; the next launch
   shows it again.

## Play Store / App Store

For a Play Store rollout:

```bash
flutter build appbundle --release
# Upload the resulting build/app/outputs/bundle/release/app-release.aab
# to the Google Play Console
```

For an iOS/TestFlight build:

```bash
flutter build ipa --release
# Upload via Xcode → Organizer → Distribute App
```

Update the in-store copy from `store/description.txt` and the
privacy policy URL from `store/privacy-policy.md` before each
release that changes behaviour.
