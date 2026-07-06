# Changelog

All notable changes to The Entrepreneur's Codex are documented
here. The version number follows [Semantic Versioning](https://semver.org/).

## [1.1.0] — 2026-07-06

### Added
- **Settings → JOURNEY → Set Current Day**: pick any chapter from 1
  to (completed + 2). Use it to recover from a crash, or to start
  partway through on a fresh install without losing prior progress.
- **Home chapter-progress bar**: a hairline gold rule under the
  pips, with tick marks, showing `X OF 30 SEALED` numerically.
- **Streak-milestone toast**: a gold "7 / 14 / 30 day streak" callout
  fires after the user seals a chapter that crosses a milestone.
- **store/DEPLOY.md**: full runbook for Vercel / Netlify / Firebase /
  GitHub Pages web deploys, signed Android bundle for Play Store,
  iOS IPA for App Store, and a verification checklist.

### Changed
- **App name**: package renamed `entrepreneur_mindset` →
  `entrepreneur_codex`. Android applicationId is
  `com.sagarverse.entrepreneur_codex`, iOS bundle is
  `com.sagarverse.entrepreneurCodex`, PWA manifest now reads
  "The Entrepreneur's Codex" with the gold theme color.
- Web `<title>` and `apple-mobile-web-app-title` updated.

### Notes
- The auto-update check will surface this release to any device
  still on 1.0.0 within ~1.6s of opening the app.
- Users on 1.0.0 → 1.1.0 keep all XP, journal entries, and
  completed chapters — the data model is fully backwards compatible.

## [1.0.0] — 2026-07-06

### Added
- 30 chapters across 4 weeks: abundance, craft, action, monetization
- Cinematic dark / gold / ink visual identity
  (Cinzel · Cormorant Garamond · Inter)
- Scroll-reveal portfolio animations on chapter cards
- 5-question end-of-chapter quiz with active-recall XP
- Curated YouTube video library per chapter
- PDF Certificate of Completion (landscape A4)
- Hall of Seals, Progress Atlas, Journal
- Minimalistic Arabic bell sound on key moments
- Auto-update from GitHub Releases (silent, non-blocking)
- About the Developer screen

### Privacy
- 100% on-device progress; no accounts, no servers, no analytics
- Single network call at launch: GitHub Releases API for updates

### Notes
- The app is released under MIT — see [LICENSE](../LICENSE)
- Issues and feature requests: github.com/Sagarverse/entrepreneurs-codex/issues
