# The Entrepreneur's Codex

A cinematic, curiosity-driven 30-day journey of the entrepreneurial
mind — built in Flutter, sealed in ink and gold.

> _"A thirty-day journey of the mind, the hand, and the pen."_

---

## What it is

- **30 chapters** across 4 weeks — abundance, craft, action, and
  monetization
- A **cinematic dark / gold / ink** aesthetic — Cinzel, Cormorant
  Garamond, Inter
- A **single scrollable lesson** per chapter: manifesto → sections
  → skill of the day → trial → revelation (videos) → reflection
  → examination (quiz) → seal
- A **portfolio-style scroll-reveal** so cards appear as you reach
  them
- A **5-question end-of-chapter quiz** with active-recall XP
- A **curated YouTube library** per chapter
- A **PDF Certificate of Completion** when all 30 chapters are
  sealed (landscape A4, ink + gold)
- **Hall of Seals** (badges), **Progress Atlas** (constellation),
  and a private **Journal**

## Privacy by default

All progress — XP, journal, challenges, quiz answers — is stored
on the device. No accounts. No servers. No analytics. The only
network call the app makes is a single check of GitHub's public
Releases API on launch, so you always have the latest edition.

See [`store/privacy-policy.md`](store/privacy-policy.md).

## Stack

- **Flutter 3.x** (Dart 3.10)
- **Provider** for state
- **SharedPreferences** for persistence
- **audioplayers** for the bell
- **pdf** + **printing** for the certificate
- **google_fonts** for the typefaces
- **share_plus** + **url_launcher** for sharing & outbound links

## Run it

```bash
flutter pub get
flutter run -d chrome          # web
flutter run -d <device-id>     # mobile
```

## Ship a new version

See [`store/release-template.md`](store/release-template.md). The
short version:

1. Bump `version:` in `pubspec.yaml` and `currentVersion` in
   `lib/services/update_service.dart`
2. Add an entry to `store/changelog.md`
3. `git tag vX.Y.Z && git push --tags`
4. `gh release create vX.Y.Z --notes-file store/changelog.md`

The app will auto-prompt users on launch when a newer release
exists.

## Project layout

```
lib/
  data/            curriculum (30 days of content) + week intros
  models/          plain Dart models
  services/        app state, storage, audio, certificate, update
  screens/         all UI surfaces
  widgets/         small gold/ink primitives (frames, seal, etc.)
store/             Play Store / App Store copy, changelog, release process
```

## Made by

**Sagar M** — sagarm.2k5@gmail.com

See the **About the Developer** screen inside the app
(Settings → About the Developer) for the latest contact details.
