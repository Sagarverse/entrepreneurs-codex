// Week intros — cinematic 30-second text animations that frame the arc of
// each of the 4 weeks. Played once when the user first opens a day in that
// week (gated by AppState.markWeekIntroSeen).

import '../models/app_models.dart';

final List<WeekIntro> weekIntros = [
  WeekIntro(
    week: 1,
    theme: 'The Awakening',
    subtitle: 'Mindset is the foundation of everything.',
    lines: [
      'Most people never begin.',
      'Not because they lack talent.',
      'Not because they lack time.',
      'They never begin because they never shift the inner operating system.',
      'This week — the foundation of the codex — we rewire that.',
      'Seven chapters on who you must become',
      'before what you must do.',
    ],
  ),
  WeekIntro(
    week: 2,
    theme: 'The Craft',
    subtitle: 'Skills separate the dreamer from the builder.',
    lines: [
      'You have shifted your mind.',
      'Now we sharpen the instrument.',
      'This week is about craft —',
      'the unsexy skills that 99% of people skip',
      'and the 1% lean on to build empires.',
      'Seven chapters on the disciplines',
      'every serious entrepreneur must master.',
    ],
  ),
  WeekIntro(
    week: 3,
    theme: 'The Execution',
    subtitle: 'Knowledge without action is entertainment.',
    lines: [
      'You know what to think.',
      'You know what to learn.',
      'Now — to do.',
      'This week is about building, shipping, and selling.',
      'No theory. No "someday."',
      'Seven chapters on the act',
      'that separates the entrepreneur',
      'from the person who talks about being one.',
    ],
  ),
  WeekIntro(
    week: 4,
    theme: 'The Mastery',
    subtitle: 'From operator to legacy.',
    lines: [
      'You have built.',
      'You have shipped.',
      'You have sold.',
      'Now the question changes.',
      'It is no longer "How do I start?"',
      'It is "How do I lead? Sustain? Outlast?"',
      'Nine chapters on the discipline of mastery',
      'and the design of a life',
      'that earns the word legacy.',
    ],
  ),
];
