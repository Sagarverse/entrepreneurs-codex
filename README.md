# Valion - The Entrepreneur's Codex

<p align="center">
  <img src="assets/icon.png" width="120" alt="Valion Logo" />
</p>

<p align="center">
  <em>A cinematic 30-day journey of the mind, the hand, and the pen.</em>
</p>

---

## Overview

**Valion** is a premium, beautifully crafted mobile application designed for aspiring and veteran entrepreneurs alike. It serves as a 30-day "Codex"—a structured, daily curriculum that merges mindset shifts, actionable skills, and reflective journaling into a single, cohesive cinematic experience.

Rather than just another habit tracker or reading app, Valion is an interactive book of shadows for business. It uses a bespoke dark theme, gold accents, and fluid micro-animations to create an elite, immersive environment for daily growth.

## Features

- 📖 **The 30-Day Codex**: A structured daily curriculum that unlocks sequentially. Each day includes a Manifesto, Skill of the Day, Trial (Actionable Challenges), Video Revelation, and a Reflection prompt.
- 🎨 **Cinematic UI/UX**: Built with an uncompromising focus on aesthetics. Features deep blacks (`Codex Ink Black`), rich golds, elegant typography (Cinzel & Cormorant Garamond), and smooth scroll-reveal animations.
- 🖋️ **The Journal**: A built-in reflection space where you document your daily thoughts and progress. 
- 🏆 **Milestones & Certificates**: Beautiful, shareable milestone cards at the end of each day, culminating in a printable, high-resolution PDF certificate upon completion of the 30-day journey.
- ⚡ **Seamless Navigation**: Flow effortlessly from one chapter to the next without ever breaking the immersion, thanks to custom page transitions and optimized native splash screens.

## Screenshots

<p align="center">
  <img src="screenshots/screenshot_1.png" width="250" alt="App Screenshot" />
  <!-- Add more screenshots here in the future -->
</p>

## Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: Provider
- **Local Storage**: Shared Preferences
- **Design System**: Custom `CodexPalette` and `CodexTypography` (No external UI libraries used for core styling)
- **PDF Generation**: `pdf` and `printing` packages for the final certificate
- **Asset Generation**: Python (`generate_icon.py`) for programmatic SVG-to-PNG logo rendering to ensure exact theme matching.

## Getting Started

### Prerequisites
- Flutter SDK (`^3.10.8`)
- Android Studio / Xcode for emulators

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/valion.git
   ```
2. Navigate to the project directory:
   ```bash
   cd valion
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Architecture Notes

- `lib/data/curriculum.dart`: Contains the entire 30-day content matrix.
- `lib/theme.dart`: The source of truth for the app's visual identity.
- `lib/services/app_state.dart`: Manages progress, unlocking logic, and journal entries.
- `lib/widgets/scroll_reveal.dart`: A custom widget that handles the cinematic fade-and-slide entrance of elements as they scroll into view.

## License

All rights reserved. 
