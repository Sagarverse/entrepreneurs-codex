# Deployment Guide

This is the one-stop runbook for shipping a release of
**The Entrepreneur's Codex** to the platforms you care about.

The auto-update check in the app reads from **GitHub Releases**, so
the *first* deploy you make is the only one that needs care —
after that, every new tag and release just becomes a prompt inside
the running app.

## 1. Versioning

Edit two files together before every release:

- **`pubspec.yaml`** — `version: 1.1.0+2`
- **`lib/services/update_service.dart`** — `static const String currentVersion = '1.1.0';`

The auto-update check compares the `X.Y.Z` triple to the GitHub
Release's `tag_name` (with the `v` prefix stripped), so the two
must agree. The `+N` build number in pubspec is what Flutter uses
internally for `versionCode` on Android.

## 2. Web — Vercel / Netlify / Firebase / GitHub Pages

The web build is fully self-contained and needs no backend.

```bash
flutter build web --release --base-href /
```

The static output lives in `build/web/`. Drop that directory into
any static host:

- **Vercel / Netlify:** `vercel deploy --prebuilt` or drag-drop
  the `build/web` folder in the dashboard.
- **Firebase:** `firebase init hosting` once, then
  `firebase deploy --only hosting`.
- **GitHub Pages:** push `build/web/` to the `gh-pages` branch
  (`npx gh-pages -d build/web`) and enable Pages on that branch in
  the repo settings.

Custom domain → point DNS to the host. SSL is automatic on all four
platforms above.

## 3. Android — Play Store

The Android app uses a single Application ID —
`com.sagarverse.entrepreneur_codex` — and a debug-signed release
build (for local testing only). For Play Store:

```bash
# 1. Generate an upload keystore ONCE and keep it safe
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload

# 2. Add a key.properties file (DO NOT commit this)
cat > android/key.properties <<'EOF'
storePassword=...
keyPassword=...
keyAlias=upload
storeFile=/Users/sagarm/upload-keystore.jks
EOF

# 3. Wire signingConfigs.release in android/app/build.gradle.kts
#    (replace the existing TODO comment block with the snippet below)
```

Snippet to paste in `android/app/build.gradle.kts` *inside* the
`android { ... }` block:

```kotlin
import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

signingConfigs {
    create("release") {
        keyAlias = keystoreProperties["keyAlias"] as String?
        keyPassword = keystoreProperties["keyPassword"] as String?
        storeFile = (keystoreProperties["storeFile"] as String?)?.let { file(it) }
        storePassword = keystoreProperties["storePassword"] as String?
    }
}

buildTypes {
    release {
        signingConfig = signingConfigs.getByName("release")
    }
}
```

Then build the bundle:

```bash
flutter build appbundle --release
# → build/app/outputs/bundle/release/app-release.aab
```

Upload to the **Google Play Console** → your app →
**Release → Production → Create release**. Use the copy from
`store/description.txt` for the listing, and
`store/privacy-policy.md` for the privacy policy URL (host the .md
on your static site, e.g. `https://your-domain.com/privacy`).

## 4. iOS — App Store

```bash
cd ios && pod install && cd ..
flutter build ipa --release
# → build/ios/ipa/*.ipa
```

Open **Xcode → Organizer → Distribute App → App Store Connect**.
Upload the IPA. Use the same `store/description.txt` copy for the
App Store listing and link to the same privacy policy page.

## 5. Auto-update after first release

Once the first release is published, the in-app auto-update flow
takes over. To cut a new version:

```bash
# 1. Bump version (pubspec.yaml + update_service.dart)
# 2. Add a changelog entry to store/changelog.md
# 3. Commit
git add -A && git commit -m "v1.1.0 — short summary"
git tag v1.1.0
git push origin main
git push origin v1.1.0

# 4. Publish the GitHub Release
gh release create v1.1.0 \
  --title "v1.1.0 — short summary" \
  --notes-file store/changelog.md
```

Every device on an older build will see a gold "A new edition of
the codex" sheet within ~1.6s of opening the app.

## 6. Verification checklist (run before every release)

- [ ] `flutter analyze` reports 0 issues
- [ ] `flutter test` passes 8/8
- [ ] `flutter build web --release` succeeds
- [ ] `flutter build appbundle --release` succeeds
- [ ] Walking the app: onboarding → codex → chapter → quiz → seal
      → certificate all complete cleanly
- [ ] Sound toggle works
- [ ] Manual "Set Current Day" recovers from a synthetic day-15
      state correctly
- [ ] GitHub Release is published and the auto-update check
      surfaces it (verify by installing an older build, opening
      the app, and confirming the update sheet appears)
