import '../models/app_models.dart';

final List<DailyLesson> allLessons = [
  // ============================================================
  // WEEK 1: MINDSET FOUNDATION (Days 1-7)
  // ============================================================

  // DAY 1 — Abundance Mindset
  DailyLesson(
    day: 1,
    title: 'The Abundance Mindset',
    theme: 'Shifting from scarcity to abundance thinking',
    category: 'mindset',
    quote:
        'The mind is everything. What you think, you become.',
    quoteAuthor: 'Buddha',
    mindsetLesson:
        'Entrepreneurship begins in the mind. Most people operate from a scarcity mindset — believing there is not enough money, opportunity, or success to go around. This belief becomes a self-fulfilling prophecy. An abundance mindset recognizes that opportunity is everywhere, that wealth is created (not just distributed), and that someone else\'s success does not diminish your own potential. Today, you will learn to identify scarcity thoughts and replace them with abundance beliefs.',
    skillName: 'Abundance Thinking',
    skillDescription:
        'The ability to see opportunity, possibility, and potential in every situation rather than limitation and lack.',
    xpReward: 100,
    chapterTitle: 'Chapter I — The Abundance',
    weekTheme: 'The Awakening',
    teaserQuote: "I have not failed. I've just found 10,000 ways that don't work. — Thomas Edison",
    teaserHook: "What if failure was a feature, not a bug? Tomorrow you'll find out.",
    quiz: [
      QuizQuestion(
        question: 'An abundance mindset primarily sees...',
        options: ['Resources as scarce', 'Wealth as created, not just distributed', 'Success as zero-sum', 'Risk as the enemy'],
        correctIndex: 1,
        explanation: "Abundance treats wealth as something created — and your success doesn't shrink anyone else's.",
      ),
      QuizQuestion(
        question: "When you see someone else's success, abundance thinking says...",
        options: ['Their win is my loss', 'I can learn from how they did it', 'I should be jealous', "It's a fluke"],
        correctIndex: 1,
        explanation: 'Abundance borrows the playbook. Scarcity tears it up.',
      ),
      QuizQuestion(
        question: 'Which is a scarcity thought?',
        options: ['How can I create more?', "There isn't enough to go around", 'What can I learn?', 'Where is the opportunity?'],
        correctIndex: 1,
        explanation: "'There isn't enough' is the giveaway scarcity script.",
      ),
      QuizQuestion(
        question: 'Scarcity is dangerous for an entrepreneur because it...',
        options: ['Encourages bold bets', 'Disguises itself as realism', 'Is based on data', 'Protects you from loss'],
        correctIndex: 1,
        explanation: "Scarcity sounds like realism. It's actually the loudest voice against action.",
      ),
      QuizQuestion(
        question: 'The opposite of scarcity is...',
        options: ['Risk aversion', 'Greed', 'Creation', 'Competition'],
        correctIndex: 2,
        explanation: "Creation, not competition. Build something new; you can't be outbid for it.",
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Power of Believing that You Can Improve',
        speaker: 'Carol Dweck',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 4,
        whyWatch: "The single clearest explanation of growth vs. fixed mindset you'll find anywhere.",
      ),
      VideoResource(
        title: 'Scarcity vs. Abundance Mindset',
        speaker: 'Tom Bilyeu',
        youtubeId: 'Q8biiSXLjyc',
        durationMinutes: 9,
        whyWatch: 'How to spot scarcity thinking in real time and flip the switch.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'What is Scarcity Mindset?',
        content:
            'A scarcity mindset is the belief that resources are limited, success is a zero-sum game, and there is never enough. It manifests as jealousy of others\' success, fear of taking risks, hoarding information, and a constant feeling of "I can\'t afford it." This mindset keeps people trapped in mediocrity because they never take the bold actions required for entrepreneurial success.',
      ),
      LessonSection(
        heading: 'The Abundance Alternative',
        content:
            'An abundance mindset sees the world as full of opportunity. It believes that wealth can be created, that collaboration beats competition, and that there is always a way forward. Entrepreneurs with abundance thinking share knowledge freely, celebrate others\' wins, invest in themselves, and see failure as feedback — not a final verdict.',
      ),
      LessonSection(
        heading: 'The Science Behind It',
        content:
            'Neuroscience shows that our brains have a Reticular Activating System (RAS) that filters information based on what we believe is important. When you believe in scarcity, your brain literally filters out opportunities. When you shift to abundance, you start seeing possibilities that were always there but invisible to you.',
      ),
      LessonSection(
        heading: 'Your First Shift',
        content:
            'Today, catch every scarcity thought as it arises. When you think "I can\'t afford that," reframe it to "How can I afford that?" When you feel jealous of someone\'s success, reframe it to "What can I learn from their journey?" This simple linguistic shift rewires your neural pathways over time.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write down 5 scarcity thoughts you\'ve had this week and reframe each one into an abundance statement.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Find one successful entrepreneur\'s story and identify 3 moments where they chose abundance over scarcity.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Give something valuable away for free today — advice, a resource, or a genuine compliment to a competitor.',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'What is one area of your life where scarcity thinking has held you back the most? How would your decisions change if you truly believed in unlimited possibility?',
    actionStep:
        'Create an "Abundance Affirmation" that you will repeat every morning: "Opportunity is everywhere. There is more than enough. I create my own abundance."',
  ),

  // DAY 2 — Failure Reframing
  DailyLesson(
    day: 2,
    title: 'Reframing Failure',
    theme: 'Turning failure into your greatest asset',
    category: 'mindset',
    quote:
        'I have not failed. I\'ve just found 10,000 ways that won\'t work.',
    quoteAuthor: 'Thomas Edison',
    mindsetLesson:
        'Fear of failure is the single biggest barrier to entrepreneurial action. Society teaches us that failure is shameful — something to avoid at all costs. But every successful entrepreneur has a long resume of failures. The difference is not that they avoided failure; it\'s that they learned to reframe it as data, as tuition paid for education, as a necessary step on the path to mastery. Today you will rewire your relationship with failure.',
    skillName: 'Failure Resilience',
    skillDescription:
        'The ability to bounce back from setbacks, extract lessons from every failure, and maintain forward momentum.',
    xpReward: 100,
    chapterTitle: 'Chapter II — The Forging',
    weekTheme: 'The Awakening',
    teaserQuote: 'The only person you are destined to become is the person you decide to be. — Ralph Waldo Emerson',
    teaserHook: 'The mind that bends, breaks through. Day 3 unlocks something most people never discover.',
    quiz: [
      QuizQuestion(
        question: 'The healthiest way to interpret failure is as...',
        options: ['Evidence you are not good enough', 'A judgment of your worth', 'Information, not verdict', 'A reason to quit'],
        correctIndex: 2,
        explanation: 'Failure is data. It is not who you are.',
      ),
      QuizQuestion(
        question: "Edison's famous 10,000 attempts is an example of...",
        options: ['Stubbornness', 'Re-framing failure as iteration', 'Wasting time', 'Being lucky'],
        correctIndex: 1,
        explanation: "Iteration in disguise. Every 'failure' was a successful exclusion.",
      ),
      QuizQuestion(
        question: 'The biggest cost of avoiding failure is...',
        options: ['Lower income', 'Avoided risk', 'Never starting', 'Stress'],
        correctIndex: 2,
        explanation: 'Avoidance guarantees the only real failure: not trying.',
      ),
      QuizQuestion(
        question: "A 'failure resume' is a tool that...",
        options: ['Documents shame', "Lists what didn't work and what you learned", 'Is shared with recruiters', 'Boosts ego'],
        correctIndex: 1,
        explanation: "It's a leader's private log: data about the edges of the map.",
      ),
      QuizQuestion(
        question: 'When you fail, the FIRST response should be...',
        options: ['Apologize', 'Curiosity: what is this telling me?', 'Give up', 'Blame the market'],
        correctIndex: 1,
        explanation: 'Curiosity converts a verdict into a question.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Why You Should Celebrate Failure',
        speaker: 'Dylan Carney',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 4,
        whyWatch: 'Re-frame failure as the price of admission to mastery.',
      ),
      VideoResource(
        title: 'Embrace the Suck',
        speaker: 'Jocko Willink',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 3,
        whyWatch: 'Two minutes that will change your relationship with setbacks.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Failure Paradox',
        content:
            'In school, failure is punished. In entrepreneurship, failure is prerequisite. Every "overnight success" story has years of failed attempts behind it. Airbnb was rejected by investors dozens of times. Steve Jobs was fired from his own company. Oprah was told she was "unfit for TV." The pattern is universal: failure is not the opposite of success — it is part of success.',
      ),
      LessonSection(
        heading: 'Types of Failure',
        content:
            'Not all failures are equal. There are "intelligent failures" — well-planned experiments that didn\'t work but produced valuable data. There are "learning failures" — mistakes made while developing a new skill. And there are "reckless failures" — avoidable errors from negligence. The goal is to maximize intelligent failures and minimize reckless ones.',
      ),
      LessonSection(
        heading: 'The Post-Failure Protocol',
        content:
            'When something fails: (1) Feel the emotion fully — don\'t suppress it. (2) Write down exactly what happened, without self-judgment. (3) Extract 3 specific lessons. (4) Identify what you\'ll do differently next time. (5) Take one small action immediately to rebuild momentum. This protocol turns failure from a stopping point into a stepping stone.',
      ),
      LessonSection(
        heading: 'Building Anti-Fragility',
        content:
            'Nassim Taleb coined the term "antifragile" — systems that get stronger from shocks, not just survive them. Your entrepreneurial mindset can become antifragile. Each failure, properly processed, makes you more resilient, wiser, and better equipped for the next challenge. This is the ultimate competitive advantage.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write down your biggest past "failure" and apply the Post-Failure Protocol to extract 3 lessons from it.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Do something small today that has a 50% chance of failing (ask for a discount, pitch an idea, try a new skill).',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Research one famous entrepreneur\'s biggest failure and how they recovered from it.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What would you attempt if you knew you could not fail? What is stopping you from attempting it anyway, knowing that even failure would teach you something invaluable?',
    actionStep:
        'Adopt the mantra: "I either win or I learn. I never lose." Write it somewhere you\'ll see daily.',
  ),

  // DAY 3 — Self-Belief
  DailyLesson(
    day: 3,
    title: 'Unshakeable Self-Belief',
    theme: 'Building the inner confidence to start',
    category: 'mindset',
    quote:
        'Whether you think you can or you think you can\'t, you\'re right.',
    quoteAuthor: 'Henry Ford',
    mindsetLesson:
        'Before anyone else believes in your vision, you must believe in it yourself — with unshakeable conviction. Self-belief is not arrogance; it\'s the quiet confidence that comes from knowing you will figure things out, no matter what. Most aspiring entrepreneurs never start because they\'re waiting to "feel ready." The truth is, confidence doesn\'t precede action — it follows it. Today you\'ll learn to build self-belief through action, not affirmation alone.',
    skillName: 'Self-Efficacy',
    skillDescription:
        'The deep-seated belief in your ability to learn, adapt, and succeed at whatever you set your mind to.',
    xpReward: 100,
    chapterTitle: 'Chapter III — The Awakening',
    weekTheme: 'The Awakening',
    teaserQuote: 'We are what we repeatedly do. Excellence, then, is not an act but a habit. — Aristotle',
    teaserHook: "Discipline is freedom wearing a mask. Tomorrow you'll meet the version of you that never quits.",
    quiz: [
      QuizQuestion(
        question: 'The defining word in a growth mindset is...',
        options: ['Talent', 'Effort', 'Yet', 'IQ'],
        correctIndex: 2,
        explanation: "Adding 'yet' converts a fixed statement into a temporary one.",
      ),
      QuizQuestion(
        question: "Fixed mindset says 'I'm not a math person.' Growth says:",
        options: ["I'm not a math person, and never will be", 'Math is for geniuses', "I haven't learned math YET", 'Some people just get it'],
        correctIndex: 2,
        explanation: "'Yet' is the entire growth mindset in one syllable.",
      ),
      QuizQuestion(
        question: 'Praise that helps a growth mindset emphasizes...',
        options: ['Innate talent', 'Effort and strategy', 'Speed', 'Outcomes only'],
        correctIndex: 1,
        explanation: 'Praise the process, not the person. Effort beats outcome.',
      ),
      QuizQuestion(
        question: 'A growth mindset treats challenges as...',
        options: ['Threats to avoid', 'Opportunities to grow', 'Proof of weakness', 'Wasted time'],
        correctIndex: 1,
        explanation: "Challenge is signal you're at the edge of learning. Walk toward it.",
      ),
      QuizQuestion(
        question: "Carol Dweck's research suggests intelligence...",
        options: ['Is mostly fixed', 'Can be developed', "Doesn't matter", 'Is genetic only'],
        correctIndex: 1,
        explanation: 'Plasticity is real. Train the brain like a muscle.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Power of Yet',
        speaker: 'Carol Dweck',
        youtubeId: '1Evwgu369Jw',
        durationMinutes: 2,
        whyWatch: 'The single most powerful one-word shift you can make today.',
      ),
      VideoResource(
        title: 'Mindset: The New Psychology of Success',
        speaker: 'Carol Dweck',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 10,
        whyWatch: 'A short, distilled tour of her research.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Confidence-Action Loop',
        content:
            'Most people get this backwards. They think: "When I feel confident, I\'ll take action." But the real formula is: "When I take action, I build confidence." Each small win creates evidence for your brain that you are capable. This is called "self-efficacy" — the accumulated proof that you can handle challenges. Start small, win small, build big.',
      ),
      LessonSection(
        heading: 'Imposter Syndrome Decoded',
        content:
            'Almost every entrepreneur experiences imposter syndrome — the feeling that you\'re a fraud and about to be "found out." This is actually a sign of growth. It means you\'re operating at the edge of your competence, which is exactly where growth happens. The cure is not to wait until you feel qualified; it\'s to recognize that everyone who\'s ever done something great felt unqualified at first.',
      ),
      LessonSection(
        heading: 'The Evidence Journal',
        content:
            'Create a document where you record every win, every compliment, every piece of positive feedback, every challenge you overcame. On days when self-doubt creeps in, read this journal. Your brain tends to forget successes and magnify failures. The evidence journal corrects this cognitive distortion with hard data.',
      ),
      LessonSection(
        heading: 'Borrowing Belief',
        content:
            'Sometimes you can\'t believe in yourself yet — and that\'s okay. In those moments, borrow belief from someone who does believe in you. A mentor, a friend, a family member. Or borrow belief from your future self — the version of you who has already succeeded. Ask: "What would Future Me do in this situation?" Then do that.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Start your Evidence Journal: write down 10 things you\'ve accomplished that you\'re proud of (big or small).',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Identify one skill you feel "not good enough" at and spend 30 minutes practicing it today.',
        type: 'skill',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Tell one person about your entrepreneurial dream — out loud. Notice the fear and do it anyway.',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'What is the story you tell yourself about why you\'re not ready? Is that story actually true, or is it a protective mechanism keeping you safe but stuck?',
    actionStep:
        'Write a letter from your "Future Self" (5 years from now, successful) to your current self. What advice would they give? Keep this letter accessible.',
  ),

  // DAY 4 — Discipline
  DailyLesson(
    day: 4,
    title: 'Discipline Over Motivation',
    theme: 'Building the habits that make success inevitable',
    category: 'mindset',
    quote:
        'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
    quoteAuthor: 'Aristotle',
    mindsetLesson:
        'Motivation is a feeling — it comes and goes. Discipline is a system — it works regardless of how you feel. The entrepreneurs who succeed are not the ones who feel motivated every day; they\'re the ones who built systems and habits that carry them forward even on days when motivation is zero. Today you\'ll learn to stop relying on motivation and start building entrepreneurial discipline.',
    skillName: 'Habit Engineering',
    skillDescription:
        'The ability to design and maintain systems and routines that produce consistent results regardless of emotional state.',
    xpReward: 100,
    chapterTitle: 'Chapter IV — The Discipline',
    weekTheme: 'The Awakening',
    teaserQuote: 'The best way to predict the future is to create it. — Peter Drucker',
    teaserHook: 'Vision is the compass, not the map. Tomorrow you design the next 5 years in a single afternoon.',
    quiz: [
      QuizQuestion(
        question: 'Discipline is best described as...',
        options: ['Punishment', 'Freedom wearing a mask', 'Boring', 'For weak people'],
        correctIndex: 1,
        explanation: 'Discipline is the engine that makes freedom possible.',
      ),
      QuizQuestion(
        question: 'The most reliable time to do a hard thing is...',
        options: ['When you feel like it', "When it's scheduled", 'After lunch', 'Tomorrow'],
        correctIndex: 1,
        explanation: "Decide the time in advance. Feelings don't get a vote.",
      ),
      QuizQuestion(
        question: 'Willpower is...',
        options: ['Unlimited', 'A finite, daily resource', 'A personality trait', 'Permanent'],
        correctIndex: 1,
        explanation: 'Treat willpower as a budget. Spend it on what matters; conserve elsewhere.',
      ),
      QuizQuestion(
        question: 'Discipline beats motivation because...',
        options: ["It's louder", "It works on days you don't feel like it", "It's more impressive", "It's easier"],
        correctIndex: 1,
        explanation: 'Motivation is a feeling. Discipline is a system.',
      ),
      QuizQuestion(
        question: "A 'keystone habit' is...",
        options: ['A small habit that triggers bigger ones', 'An expensive habit', 'A rare habit', 'A social habit'],
        correctIndex: 0,
        explanation: 'One well-chosen keystone can pull a dozen other habits with it.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Discipline Equals Freedom',
        speaker: 'Jocko Willink',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 2,
        whyWatch: 'The mantra that anchors Navy SEAL training. Apply it to your day.',
      ),
      VideoResource(
        title: 'The Power of Habit',
        speaker: 'Charles Duhigg',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 9,
        whyWatch: 'How habits form and how to rewire them.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Motivation is a Trap',
        content:
            'Waiting for motivation is like waiting for perfect weather before going to work. It\'s unreliable and outside your control. Research shows that motivation follows action, not the other way around. The most productive people don\'t negotiate with themselves — they have a system and they execute it. "I don\'t feel like it" is not a valid excuse in their operating system.',
      ),
      LessonSection(
        heading: 'The Power of Keystone Habits',
        content:
            'Charles Duhigg\'s research on habits reveals that certain "keystone habits" create a cascade of positive changes. For entrepreneurs, key keystone habits include: waking up early, exercising, planning the day before it starts, and doing the hardest task first (eat the frog). When you lock in these habits, everything else becomes easier.',
      ),
      LessonSection(
        heading: 'The 2-Minute Rule',
        content:
            'When starting a new habit, make it so small it\'s impossible to fail. Want to read more? Start with 2 minutes of reading per day. Want to exercise? Start with 2 minutes of movement. The goal is not the output — it\'s establishing the identity of "someone who does this consistently." Once the identity is set, you can scale the behavior.',
      ),
      LessonSection(
        heading: 'Environment Design',
        content:
            'Willpower is a limited resource. The most disciplined people don\'t actually use more willpower — they design their environment so that good choices are easy and bad choices are hard. Remove distractions from your workspace. Put your phone in another room. Prepare healthy food in advance. Make your default path the productive path.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Identify one keystone habit you want to build and commit to a 2-minute version of it every day for the next week.',
        type: 'action',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Do the hardest task on your to-do list FIRST today, before checking email or social media.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Redesign one aspect of your environment to make a positive behavior easier (e.g., put a book on your pillow, hide your phone charger from the bedroom).',
        type: 'creative',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'On a scale of 1-10, how much do you rely on motivation vs. systems? What is one area where building a system would make a bigger difference than trying to feel more motivated?',
    actionStep:
        'Create a "Non-Negotiable Daily List" — 3 things you will do every single day regardless of how you feel. Start tomorrow.',
  ),

  // DAY 5 — Vision
  DailyLesson(
    day: 5,
    title: 'Crafting Your Vision',
    theme: 'Creating a compelling future that pulls you forward',
    category: 'mindset',
    quote:
        'The only way to do great work is to love what you do. If you haven\'t found it yet, keep looking.',
    quoteAuthor: 'Steve Jobs',
    mindsetLesson:
        'Entrepreneurship without vision is just busy-ness. A clear, compelling vision serves as your North Star — it guides decisions, fuels persistence, and attracts the right people to your cause. Vision is not a vague wish; it\'s a detailed, emotionally charged picture of the future you are building. Today you\'ll learn to craft a vision so powerful it pulls you through any obstacle.',
    skillName: 'Vision Crafting',
    skillDescription:
        'The ability to create and communicate a vivid, inspiring picture of a desired future state that motivates action.',
    xpReward: 100,
    chapterTitle: 'Chapter V — The Vision',
    weekTheme: 'The Awakening',
    teaserQuote: "Life shrinks or expands in proportion to one's courage. — Anaïs Nin",
    teaserHook: 'The comfort zone is a beautiful prison. Tomorrow you escape — and never want to come back.',
    quiz: [
      QuizQuestion(
        question: 'A 5-year vision primarily answers the question:',
        options: ['What did I do yesterday?', 'Who am I becoming?', 'What are my KPIs?', "What's my todo today?"],
        correctIndex: 1,
        explanation: "Vision is identity over time. Identity answers 'who', not 'what'.",
      ),
      QuizQuestion(
        question: 'A good vision is best when it is...',
        options: ['Vague enough to be flexible', 'Sharp enough to make decisions easier', 'Realistic', 'Approved by everyone'],
        correctIndex: 1,
        explanation: "If your vision doesn't make some decisions easier, it's too vague.",
      ),
      QuizQuestion(
        question: 'Vision precedes...',
        options: ['Strategy', 'Execution', 'Both', 'Neither'],
        correctIndex: 0,
        explanation: "Strategy is the answer to 'how do I get there.' Vision defines 'there'.",
      ),
      QuizQuestion(
        question: 'A 5-year vision written down is more powerful than one...',
        options: ['Thought about', 'Discussed with friends', 'Held in the head', 'Imagined vividly'],
        correctIndex: 2,
        explanation: "What is unwritten is unowned. Pen, paper, today's date.",
      ),
      QuizQuestion(
        question: 'When vision is clear, daily priorities become...',
        options: ['Harder', 'Easier to filter', 'More numerous', 'More stressful'],
        correctIndex: 1,
        explanation: "Vision is a filter. Most 'priorities' are noise when you have a sharp vision.",
      ),
    ],
    videos: [
      VideoResource(
        title: 'Start With Why',
        speaker: 'Simon Sinek',
        youtubeId: 'QoqohmccTSc',
        durationMinutes: 18,
        whyWatch: 'The talk that reframed how millions think about vision.',
      ),
      VideoResource(
        title: 'The Power of Vision',
        speaker: 'Myron Golden',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 8,
        whyWatch: 'Why vision precedes strategy, not the other way around.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Why Vision Matters',
        content:
            'Studies of highly successful entrepreneurs reveal a common trait: they all have a crystal-clear vision of what they want to create. This vision serves multiple functions: it acts as a filter for opportunities (does this move me toward my vision?), it provides resilience during hard times (this struggle is worth it because of where I\'m going), and it attracts talent and resources (people join visions, not business plans).',
      ),
      LessonSection(
        heading: 'The 5-Year Visualization',
        content:
            'Close your eyes and imagine your life 5 years from now, assuming everything goes better than you could imagine. Where are you living? What does your typical day look like? What have you built? Who are you serving? How do you feel? Be specific — the more sensory detail, the more your brain treats this vision as real and begins working toward it.',
      ),
      LessonSection(
        heading: 'Vision vs. Goals',
        content:
            'People confuse vision with goals. Goals are specific, measurable targets (earn \$100K, launch a product, get 1000 customers). Vision is bigger — it\'s the WHY behind the goals. Vision is the world you want to create, the person you want to become, the impact you want to have. Goals are the stepping stones; vision is the destination.',
      ),
      LessonSection(
        heading: 'Living Your Vision Now',
        content:
            'Don\'t wait until you\'ve "arrived" to embody your vision. Start acting as the person you want to become today. Dress like them. Make decisions like them. Spend your time like them. This is not "fake it till you make it" — it\'s "practice it till you become it." Identity change precedes behavior change.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write a 1-page "Vision Document" describing your ideal life and business 5 years from now in vivid detail.',
        type: 'creative',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Create a vision board (physical or digital) with images that represent your entrepreneurial vision.',
        type: 'creative',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Share your vision with one trusted person and ask them to hold you accountable to it.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'If money were no object and failure were impossible, what would you spend your life building? Does your current path align with that vision?',
    actionStep:
        'Write your vision in one sentence — your "North Star Statement." Example: "I am building a world where every small business owner has access to affordable, powerful marketing tools."',
  ),

  // DAY 6 — Resilience
  DailyLesson(
    day: 6,
    title: 'The Resilience Engine',
    theme: 'Developing the grit to outlast every obstacle',
    category: 'mindset',
    quote:
        'It\'s not that I\'m so smart, it\'s just that I stay with problems longer.',
    quoteAuthor: 'Albert Einstein',
    mindsetLesson:
        'The entrepreneurial journey is not a sprint — it\'s an ultra-marathon through unpredictable terrain. The single trait that predicts long-term success more than intelligence, talent, or luck is resilience: the ability to keep going when things get hard. Resilience is not something you\'re born with; it\'s a skill you can build systematically. Today you\'ll learn the components of the resilience engine.',
    skillName: 'Grit & Resilience',
    skillDescription:
        'The sustained passion and perseverance applied toward long-term goals despite obstacles, setbacks, and plateaus.',
    xpReward: 100,
    chapterTitle: 'Chapter VI — The Threshold',
    weekTheme: 'The Awakening',
    teaserQuote: 'What you do speaks so loudly that I cannot hear what you say. — Ralph Waldo Emerson',
    teaserHook: "Impostor syndrome isn't a flaw. It's a signal that you've outgrown your old identity. Tomorrow, you outgrow.",
    quiz: [
      QuizQuestion(
        question: 'The comfort zone is best described as...',
        options: ['A safe place to grow', 'A beautiful prison', 'Where dreams live', "Where you'll be safe forever"],
        correctIndex: 1,
        explanation: 'It feels safe; it shrinks the life you could be living.',
      ),
      QuizQuestion(
        question: 'Growth happens primarily...',
        options: ['Inside the comfort zone', 'At the edge of it', 'During sleep', 'When you plan more'],
        correctIndex: 1,
        explanation: 'Edge. Always at the edge. Comfort is the result of growth, not its source.',
      ),
      QuizQuestion(
        question: 'A useful weekly practice is to do one thing that...',
        options: ['Feels safe', 'Slightly scares you', 'Matches your routine', "You've done before"],
        correctIndex: 1,
        explanation: "Book a 'scare' every week. Look back in 90 days.",
      ),
      QuizQuestion(
        question: "'Playing it safe' is a strategy that...",
        options: ['Maximizes return', 'Minimizes regret at the cost of growth', 'Builds wealth', 'Always wins'],
        correctIndex: 1,
        explanation: 'Safety in the short term is often risk in the long term.',
      ),
      QuizQuestion(
        question: 'Which phrase best reframes discomfort?',
        options: ["'This is bad'", "'This is signal that I'm growing'", "'This should be easier'", "'I should turn back'"],
        correctIndex: 1,
        explanation: 'Discomfort is the receipt that growth is happening.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Magic of Not Giving Up',
        speaker: 'Mattie James',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 6,
        whyWatch: 'How stepping outside the comfort zone becomes addictive.',
      ),
      VideoResource(
        title: 'The Comfort Zone is a Beautiful Prison',
        speaker: 'Ed Mylett',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 8,
        whyWatch: 'The wake-up call for the over-cautious.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Grit Research',
        content:
            'Angela Duckworth\'s groundbreaking research on "grit" found that it predicts success better than IQ, talent, or socioeconomic background. Grit is the combination of passion (consistent interest over years) and perseverance (sustained effort despite setbacks). The good news: grit can be developed. It grows every time you push through a challenge you wanted to quit.',
      ),
      LessonSection(
        heading: 'The Resilience Toolkit',
        content:
            'Resilience has four components: (1) Physical foundation — sleep, nutrition, exercise (you can\'t be mentally tough with a depleted body). (2) Emotional regulation — the ability to process difficult emotions without being hijacked by them. (3) Cognitive reframing — the skill of finding empowering meanings in hard situations. (4) Social support — having people who believe in you when you temporarily don\'t believe in yourself.',
      ),
      LessonSection(
        heading: 'The Stockdale Paradox',
        content:
            'Admiral James Stockdale, a POW for 7 years, observed that the prisoners who survived were those who balanced brutal realism about their current situation with unwavering faith that they would ultimately prevail. The optimists who said "we\'ll be out by Christmas" died of disappointment when Christmas came and went. Resilience requires holding both truths: "This is really hard right now" AND "I will make it through."',
      ),
      LessonSection(
        heading: 'Building Your Resilience Bank',
        content:
            'Think of resilience as a bank account. You make deposits by: completing hard things, keeping promises to yourself, exercising, getting enough sleep, and maintaining strong relationships. You make withdrawals during crises, setbacks, and stressful periods. The key is to make regular deposits during calm periods so you have reserves when storms hit.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Do something physically challenging today (a hard workout, cold shower, long run) to build your "resilience bank."',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Identify one past experience where you showed resilience. Write down what got you through it.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Reach out to one person who has been a source of support and thank them for being part of your resilience network.',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'When was the last time you wanted to quit something but didn\'t? What kept you going? How can you bottle that force for future challenges?',
    actionStep:
        'Create a "Resilience Mantra" — a short phrase you\'ll repeat during hard moments. Example: "This is hard, and I can do hard things."',
  ),

  // DAY 7 — Growth Mindset
  DailyLesson(
    day: 7,
    title: 'The Growth Mindset',
    theme: 'Unlocking your unlimited potential to learn and evolve',
    category: 'mindset',
    quote:
        'Becoming is better than being.',
    quoteAuthor: 'Carol Dweck',
    mindsetLesson:
        'Carol Dweck\'s research revealed two fundamentally different ways people view their abilities: fixed mindset (abilities are static, you are either smart/talented or not) and growth mindset (abilities can be developed through effort and learning). Entrepreneurs with a growth mindset thrive because they see challenges as opportunities to grow, not threats to their ego. Today you\'ll learn to cultivate a growth mindset as your default operating system.',
    skillName: 'Growth Orientation',
    skillDescription:
        'The belief that abilities and intelligence can be developed through dedication, hard work, and learning from feedback.',
    xpReward: 150,
    chapterTitle: 'Chapter VII — The Authentic',
    weekTheme: 'The Awakening',
    teaserQuote: 'Where focus goes, energy flows. — Tony Robbins',
    teaserHook: "Opportunity is not a thing you find. It's a thing you become sensitive to. Tomorrow your eyes open.",
    quiz: [
      QuizQuestion(
        question: 'Impostor syndrome is most accurately...',
        options: ['A sign you are a fraud', 'A signal of growth at the edge of competence', 'A personality flaw', 'A reason to quit'],
        correctIndex: 1,
        explanation: "It shows up exactly when you've outgrown your old identity.",
      ),
      QuizQuestion(
        question: 'The cure for impostor syndrome is...',
        options: ['More credentials', 'Acting anyway — and collecting evidence', 'Waiting until you feel ready', 'Faking it forever'],
        correctIndex: 1,
        explanation: 'Action creates evidence. Waiting creates more doubt.',
      ),
      QuizQuestion(
        question: 'Most successful people...',
        options: ['Never feel like frauds', 'Feel like frauds at some point', "Don't care what others think", 'Are obviously talented'],
        correctIndex: 1,
        explanation: "If you haven't felt like a fraud, you probably haven't aimed high enough yet.",
      ),
      QuizQuestion(
        question: 'Healthy authenticity means...',
        options: ['Pretending to be flawless', 'Acknowledging the gap and showing up anyway', 'Hiding your questions', 'Avoiding risk'],
        correctIndex: 1,
        explanation: 'Show the gap. That gap is the doorway to your next level.',
      ),
      QuizQuestion(
        question: 'The opposite of impostor syndrome is not...',
        options: ['Confidence', 'Humility grounded in evidence', 'Pretending', 'Knowing everything'],
        correctIndex: 0,
        explanation: "Confidence is the goal — but it's earned through evidence, not absence of doubt.",
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Fraud Who Changed the World',
        speaker: 'Tim Ferriss',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 5,
        whyWatch: "Every successful person has felt like a fraud. Here's what they did.",
      ),
      VideoResource(
        title: 'Owning Your Authority',
        speaker: 'Marie Forleo',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 7,
        whyWatch: 'How to stop asking for permission to be who you already are.',
      ),
    ],
    unlockBadge: 'mindset_master',
    sections: [
      LessonSection(
        heading: 'Fixed vs. Growth: The Difference',
        content:
            'Fixed mindset says: "I\'m not a math person," "I\'m not creative," "I\'m not a natural leader." Growth mindset says: "I haven\'t learned math YET," "I can develop creativity," "Leadership is a skill I can build." The word "yet" is the growth mindset\'s secret weapon. Every limitation becomes temporary when you add "yet."',
      ),
      LessonSection(
        heading: 'The Danger of Praise',
        content:
            'Research shows that praising children for being "smart" actually harms their development — they become afraid of challenges that might disprove their "smart" label. Praising effort ("I love how hard you worked on that") builds growth mindset. Apply this to yourself: celebrate effort, strategy, and progress — not fixed traits.',
      ),
      LessonSection(
        heading: 'Reframing Challenges',
        content:
            'In a fixed mindset, a challenge is a threat — it might reveal you\'re not good enough. In a growth mindset, a challenge is an invitation — it\'s a chance to expand your capabilities. When you catch yourself avoiding something because it\'s hard, recognize that as your fixed mindset talking, and consciously choose the growth response: "This is my chance to get better."',
      ),
      LessonSection(
        heading: 'The Entrepreneurial Growth Loop',
        content:
            'Entrepreneurship is the ultimate growth mindset arena. Every day presents new problems you don\'t know how to solve. The growth-minded entrepreneur says: "I don\'t know how to do this yet, but I can learn." They seek feedback eagerly (even when it stings), they study competitors to learn (not to feel threatened), and they measure success by progress, not perfection.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Catch yourself saying "I can\'t..." or "I\'m not good at..." today. Add "yet" to the end of each statement.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Learn one new skill for 30 minutes today — something you\'ve told yourself you\'re "not good at."',
        type: 'skill',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Ask someone for honest feedback about one area of your work or life. Receive it without defending yourself.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What is one area where you\'ve held a fixed mindset about yourself? How has that belief limited your actions? What would change if you fully embraced "I can learn this"?',
    actionStep:
        'Write "YET" on a sticky note and put it on your mirror. Every time you think a limiting thought, add "yet" and notice the shift.',
  ),

  // ============================================================
  // WEEK 2: MONEY SKILLS (Days 8-14)
  // ============================================================

  // DAY 8 — Opportunity Spotting
  DailyLesson(
    day: 8,
    title: 'The Art of Opportunity Spotting',
    theme: 'Training your eyes to see what others miss',
    category: 'skill',
    quote:
        'Opportunity is missed by most people because it is dressed in overalls and looks like work.',
    quoteAuthor: 'Thomas Edison',
    mindsetLesson:
        'Entrepreneurs don\'t wait for opportunities to knock — they train themselves to spot opportunities everywhere. Opportunity spotting is a skill, not luck. It\'s about seeing problems as business ideas, noticing inefficiencies as profit potential, and recognizing trends before they become obvious. Today you\'ll learn the frameworks that successful entrepreneurs use to find opportunities hiding in plain sight.',
    skillName: 'Opportunity Recognition',
    skillDescription:
        'The trained ability to identify unmet needs, market gaps, and emerging trends that can be turned into profitable ventures.',
    xpReward: 100,
    chapterTitle: 'Chapter VIII — The Eye',
    weekTheme: 'The Craft',
    teaserQuote: "Don't be afraid to give up the good to go for the great. — John D. Rockefeller",
    teaserHook: "Selling is not convincing. It's clarifying. Tomorrow you learn the difference, and your bank account notices.",
    quiz: [
      QuizQuestion(
        question: 'Opportunities are best spotted by people who...',
        options: ['Have more money', 'Have developed a pattern-recognition habit', 'Are lucky', 'Travel often'],
        correctIndex: 1,
        explanation: "It's a trained perception, not a gift. Train it.",
      ),
      QuizQuestion(
        question: "A 'problem' is best reframed as...",
        options: ['A reason to quit', 'A paid opportunity in disguise', "Someone else's fault", 'A market signal to avoid'],
        correctIndex: 1,
        explanation: 'Every problem is a market. Every annoyance is a paid product idea.',
      ),
      QuizQuestion(
        question: 'Opportunity recognition is mostly...',
        options: ['Genius', 'Volume — seeing more things, more often', 'Luck', 'Education'],
        correctIndex: 1,
        explanation: 'Volume. Be in more rooms, read more angles, take more walks.',
      ),
      QuizQuestion(
        question: 'The best opportunities often look...',
        options: ['Exciting and obvious', 'Boring or unsexy at first', 'Risky to the point of insane', 'Approved by family'],
        correctIndex: 1,
        explanation: 'Boring is underrated. Boring is profitable.',
      ),
      QuizQuestion(
        question: 'When you see an opportunity, your first job is to...',
        options: ['Tell everyone', 'Validate it cheaply before you commit', 'Build a full product', 'Quit your job'],
        correctIndex: 1,
        explanation: 'Validate. Cheap. Before commitment. Always.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'How to See Opportunities Others Miss',
        speaker: 'Robert Greene',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 11,
        whyWatch: 'The 48 Laws author on sharpening perception.',
      ),
      VideoResource(
        title: 'Where Good Ideas Come From',
        speaker: 'Steven Johnson',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 17,
        whyWatch: 'A deep dive into how innovation actually happens.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Problems = Profits',
        content:
            'Every successful business is a solution to a problem. The bigger the problem, the bigger the potential business. Start paying attention to frustrations — yours and others\'. Every time you hear someone say "I wish there was a..." or "Why is it so hard to..." — that\'s a business opportunity. Keep a "Problem Journal" and write down every frustration you encounter.',
      ),
      LessonSection(
        heading: 'The DES Framework',
        content:
            'Spot opportunities using three lenses: (D)emographics — changes in population, age distribution, urbanization. (E)conomics — shifts in how people earn and spend money. (S)ociety — changes in values, behaviors, and cultural norms. For example: aging population (D) + rising healthcare costs (E) + desire to age at home (S) = opportunity for in-home senior care services.',
      ),
      LessonSection(
        heading: 'Trend Surfing',
        content:
            'You don\'t need to create trends — you can ride them. Pay attention to: (1) Technology shifts (AI, remote work tools). (2) Regulatory changes (new laws create new needs). (3) Lifestyle trends (minimalism, sustainability, digital nomadism). The key is to spot trends early, before they become saturated. Read industry reports, follow thought leaders, watch what young people are doing.',
      ),
      LessonSection(
        heading: 'The 10-Idea Habit',
        content:
            'James Altucher recommends generating 10 ideas every day — not necessarily good ideas, just ideas. This exercises your "idea muscle." Most will be bad, but a few will be interesting, and occasionally one will be a gem. The point is not the ideas themselves; it\'s training your brain to constantly scan for possibilities. An entrepreneur with a strong idea muscle never runs out of opportunities.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Start a "Problem Journal" — write down 10 frustrations or inefficiencies you noticed today.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Generate 10 business ideas using the DES framework (at least 2 from each lens).',
        type: 'creative',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Identify one trend in your industry or community and brainstorm 3 business ideas that could ride that trend.',
        type: 'creative',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What problem do you personally experience that you would pay someone to solve? Could YOU be the one to solve it?',
    actionStep:
        'Commit to the 10-Idea Habit: every day for the next week, write down 10 business ideas. Don\'t judge them — just generate.',
  ),

  // DAY 9 — Value Creation
  DailyLesson(
    day: 9,
    title: 'Value Creation & Your First Customer',
    theme: 'Creating value and getting paid for it — starting today',
    category: 'skill',
    quote:
        'Strive not to be a success, but rather to be of value.',
    quoteAuthor: 'Albert Einstein',
    mindsetLesson:
        'The fundamental equation of entrepreneurship is simple: Wealth = Value × Scale. But here\'s the part most courses skip — you cannot scale what you haven\'t sold once. Today you\'ll learn to think in terms of value creation AND learn the tactical, uncomfortable art of cold outreach: how to reach people who don\'t know you exist and convince them to pay for the value you create. This is the bridge from "I have an idea" to "I have a customer."',
    skillName: 'Value Creation',
    skillDescription:
        'The ability to identify, create, and deliver meaningful value that people are willing to pay for — and then reach those people through cold outreach.',
    xpReward: 100,
    chapterTitle: 'Chapter IX — The Persuader',
    weekTheme: 'The Craft',
    teaserQuote: 'The riches are in the niches. — unknown',
    teaserHook: 'Most businesses die not from bad products, but from building something nobody wants. Tomorrow, you learn the art of asking.',
    quiz: [
      QuizQuestion(
        question: 'The most effective cold outreach message leads with...',
        options: ['Your credentials', 'A specific observation about THEIR problem', 'A discount offer', 'Your story'],
        correctIndex: 1,
        explanation: 'Lead with their pain. Your credentials are the footnote, not the headline.',
      ),
      QuizQuestion(
        question: 'The "100 DMs" strategy works because...',
        options: ['Spam converts', 'Volume creates the data to find what resonates', 'People love cold messages', 'Algorithms reward it'],
        correctIndex: 1,
        explanation: 'Volume is the teacher. After 100 attempts, you know what works and what doesn\'t.',
      ),
      QuizQuestion(
        question: 'Value stacking means...',
        options: ['Adding more features', 'Delivering multiple types of value (functional, emotional, social) simultaneously', 'Charging more', 'Bundling products'],
        correctIndex: 1,
        explanation: 'Stack the layers of value. Each layer increases willingness to pay and loyalty.',
      ),
      QuizQuestion(
        question: 'The best cold email is usually...',
        options: ['Long and thorough', '3-5 sentences with one clear ask', 'A sales pitch', 'Formal with your resume'],
        correctIndex: 1,
        explanation: 'Short. Specific. One ask. Respect their time and you earn their attention.',
      ),
      QuizQuestion(
        question: 'Your first customer is most likely found through...',
        options: ['Paid ads', 'Direct personal outreach to someone who already has the problem', 'A viral post', 'A press release'],
        correctIndex: 1,
        explanation: 'Customer #1 almost always comes from a direct conversation, not a funnel.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The One Question That Will Change Your Sales Forever',
        speaker: 'Daniel Pink',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 6,
        whyWatch: 'Reframes selling as serving.',
      ),
      VideoResource(
        title: 'How to Sell Anything to Anyone',
        speaker: 'Grant Cardone',
        youtubeId: 'Q8biiSXLjyc',
        durationMinutes: 12,
        whyWatch: 'Practical, high-energy sales fundamentals.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The 4 Types of Value',
        content:
            '(1) Functional Value: solves a practical problem (Uber solves transportation). (2) Emotional Value: makes people feel something (luxury brands sell status and belonging). (3) Social Value: changes how others perceive them (LinkedIn premium signals professionalism). (4) Transformational Value: changes who they are (a fitness coach transforms identity). The most profitable businesses deliver multiple types simultaneously. Your job: stack at least 2 types into everything you sell.',
      ),
      LessonSection(
        heading: 'The Cold Outreach Playbook',
        content:
            'Cold outreach is how you get your first 10 customers when you have zero audience. The formula: (1) IDENTIFY — find 50 specific people who have the exact problem you solve. Use LinkedIn, Twitter/X, Reddit, Facebook Groups, forums. (2) RESEARCH — spend 2 minutes on each. Find one specific thing about their situation. (3) REACH OUT — send a personalized message: "Hey [Name], I noticed [specific observation about their problem]. I built [your solution] that [specific benefit]. Would you be open to trying it for free / at a discount so I can get feedback?" (4) FOLLOW UP — 80% of sales happen after the 5th follow-up. Most people quit after 1.',
      ),
      LessonSection(
        heading: 'The 100 DMs Challenge',
        content:
            'This is the single most powerful exercise for any new entrepreneur: send 100 direct messages to potential customers over the next 10 days (10/day). Not spam — personalized, research-backed messages that lead with their problem and offer genuine help. Here\'s what will happen: Messages 1-20: Mostly silence. You\'ll feel rejected. This is normal. Messages 21-50: You start finding what language resonates. Response rate climbs. Messages 51-80: You have real conversations. Some say "not now" (follow up later). Messages 81-100: You close your first 1-3 customers. More importantly, you now KNOW what people actually want. The 100 DMs challenge teaches you more about your market in 10 days than 6 months of "market research."',
      ),
      LessonSection(
        heading: 'The Free-to-Paid Bridge',
        content:
            'Your first customer should NOT pay full price. Use the "Founding Customer" model: offer your product/service to the first 5-10 people at 50-80% off (or free) in exchange for: (1) Detailed feedback on what works and what doesn\'t. (2) A testimonial or case study when they see results. (3) Permission to use their story in future marketing. This removes the risk for them and gives you the two things you need most: proof that your thing works, and social proof to sell to the next 100 people.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Send 10 personalized cold DMs today to people who have the problem you solve. Use the Cold Outreach Playbook formula. Track every response.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Write your "Founding Customer" offer: what you\'ll give, at what discount, and what you ask in return (feedback + testimonial).',
        type: 'creative',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Ask 3 people: "What\'s the biggest problem in your daily life that you\'d pay to solve?" Record their exact words — this is copywriting gold.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What is stopping you from reaching out to a potential customer TODAY? Is it fear of rejection, or fear of success? What would you do if you knew they\'d say yes?',
    actionStep:
        'Write your "Value Statement": "I help [specific group] achieve [specific result] through [your unique approach]." Then send it to 3 real people and ask: "Would you pay for this?"',
  ),

  // DAY 10 — Sales Psychology
  DailyLesson(
    day: 10,
    title: 'Sales Psychology 101',
    theme: 'Understanding why people buy',
    category: 'skill',
    quote:
        'People don\'t buy what you do; they buy why you do it.',
    quoteAuthor: 'Simon Sinek',
    mindsetLesson:
        'Many new entrepreneurs are uncomfortable with "sales" because they associate it with manipulation. But ethical sales is simply understanding human psychology and helping people make decisions that benefit them. Every entrepreneur must learn to sell — their product, their vision, their ideas. Today you\'ll learn the psychology behind why people buy and how to sell without feeling sleazy.',
    skillName: 'Ethical Sales',
    skillDescription:
        'The ability to understand customer psychology and guide people to decisions that genuinely serve their best interests.',
    xpReward: 100,
    chapterTitle: 'Chapter X — The Validator',
    weekTheme: 'The Craft',
    teaserQuote: 'Your most unhappy customers are your greatest source of learning. — Bill Gates',
    teaserHook: "Your network isn't what you know — it's who trusts you. Tomorrow, you master the art of the first real connection.",
    quiz: [
      QuizQuestion(
        question: "The 'Mom Test' rule is:",
        options: ['Ask your mom if your idea is good', 'Never ask leading questions about your idea', 'Pitch your mom first', 'Test only with family'],
        correctIndex: 1,
        explanation: "Don't ask 'would you use this?' Ask about their life. Their answers are real.",
      ),
      QuizQuestion(
        question: 'Cheap validation means...',
        options: ['A finished product', 'Talking to 5-10 real people about the problem', 'Building a landing page', 'A focus group'],
        correctIndex: 1,
        explanation: 'Five real conversations are worth more than five months of building.',
      ),
      QuizQuestion(
        question: 'The biggest sign that you should NOT build yet is...',
        options: ['No one believes in you', "You can't find anyone with the problem", "You don't like the topic", "You don't have funding"],
        correctIndex: 1,
        explanation: "If the problem doesn't exist for real people, no product will create it.",
      ),
      QuizQuestion(
        question: 'Customer interviews are most useful when they reveal...',
        options: ['Praise for your idea', 'Complaints and workarounds people already have', 'Net Promoter Scores', 'Demographics'],
        correctIndex: 1,
        explanation: 'Workarounds = the strongest demand signal. They are already paying — in time, money, or pain.',
      ),
      QuizQuestion(
        question: 'The best way to learn if someone will buy is...',
        options: ['To ask them', 'To ask them to pay', 'To send a press release', 'To run a poll'],
        correctIndex: 1,
        explanation: 'Behavior beats opinion. Money is the cleanest behavior.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Mom Test',
        speaker: 'Rob Fitzpatrick',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 8,
        whyWatch: "The canonical guide to customer conversations that don't lie.",
      ),
      VideoResource(
        title: 'Why Most Startups Fail',
        speaker: 'Startup Genome',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 4,
        whyWatch: 'Data on why building before validating kills companies.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Why People Buy',
        content:
            'People buy for two reasons: to move toward pleasure (gain) or to move away from pain (loss). Research shows that pain avoidance is roughly 2x more powerful than pleasure seeking. This is why "Don\'t miss out" works better than "Here\'s something nice." Understand which motivation drives your customer and speak to it directly.',
      ),
      LessonSection(
        heading: 'The Trust Formula',
        content:
            'Trust = (Credibility + Reliability + Intimacy) / Self-Orientation. Credibility: do you know your stuff? Reliability: do you do what you say? Intimacy: do they feel safe sharing with you? Self-Orientation: are you focused on yourself or on them? The denominator is the most powerful — if someone feels you genuinely care about them (low self-orientation), trust skyrockets.',
      ),
      LessonSection(
        heading: 'Objections are Requests',
        content:
            'When a customer says "It\'s too expensive," they\'re not rejecting you — they\'re saying "I don\'t yet understand the value." When they say "I need to think about it," they\'re saying "I have an unresolved concern." Reframe objections as requests for more information. Your job is not to argue; it\'s to understand and address the underlying concern.',
      ),
      LessonSection(
        heading: 'The Permission-Based Approach',
        content:
            'Ethical selling is permission-based. You don\'t pressure; you educate. You don\'t manipulate; you illuminate. Your goal is to help the prospect make the best decision for themselves — even if that decision is "not now" or "not with you." Paradoxically, this low-pressure approach builds so much trust that people often choose you anyway. When you stop chasing, you start attracting.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Practice the Trust Formula: have a conversation today where you focus entirely on understanding the other person (low self-orientation).',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Write down 5 common objections someone might have to buying your (future) product. For each, write the underlying concern and how you\'d address it.',
        type: 'thought',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Watch one video or read one article by a sales expert (suggestion: "The Psychology of Selling" by Brian Tracy summary).',
        type: 'skill',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What negative beliefs do you hold about "selling"? Where did those beliefs come from? How could you reframe selling as "helping people make good decisions"?',
    actionStep:
        'Adopt the mantra: "I don\'t sell. I help people buy what they already need."',
  ),

  // DAY 11 — Negotiation
  DailyLesson(
    day: 11,
    title: 'Negotiation for Entrepreneurs',
    theme: 'Getting to yes without burning bridges',
    category: 'skill',
    quote:
        'In business, you don\'t get what you deserve. You get what you negotiate.',
    quoteAuthor: 'Chester L. Karrass',
    mindsetLesson:
        'Every entrepreneur negotiates constantly — with suppliers, customers, partners, investors, and even themselves. Negotiation is not about "winning" at the other person\'s expense; it\'s about finding agreements that create maximum value for both sides. Today you\'ll learn the core principles of effective negotiation that you can apply immediately.',
    skillName: 'Win-Win Negotiation',
    skillDescription:
        'The ability to reach agreements that satisfy both parties\' core interests while building long-term relationships.',
    xpReward: 100,
    chapterTitle: 'Chapter XI — The Connector',
    weekTheme: 'The Craft',
    teaserQuote: 'Price is what you pay. Value is what you get. — Warren Buffett',
    teaserHook: 'Price is a story. Tomorrow, you learn to tell the one your customer wants to hear.',
    quiz: [
      QuizQuestion(
        question: 'The most valuable network quality is...',
        options: ['Number of contacts', 'Depth of trust', 'Job titles', 'Geographic spread'],
        correctIndex: 1,
        explanation: 'One trusted ally beats a thousand weak ties.',
      ),
      QuizQuestion(
        question: 'The best first move in networking is to...',
        options: ['Ask for a job', 'Offer value, no strings attached', 'Pitch your product', 'Send a long bio'],
        correctIndex: 1,
        explanation: 'Give first. The asymmetry compounds.',
      ),
      QuizQuestion(
        question: 'Follow-up after meeting someone is most powerful when it is...',
        options: ['Generic', 'Specific to something they said', 'Aggressive', 'Salesy'],
        correctIndex: 1,
        explanation: 'Reference a specific thing they said. That detail is what makes you unforgettable.',
      ),
      QuizQuestion(
        question: "'Relational capital' is built primarily through...",
        options: ['Volume of messages', 'Consistency over time', 'Flattery', 'Status'],
        correctIndex: 1,
        explanation: 'Time, repeated. The most boring answer; the most true.',
      ),
      QuizQuestion(
        question: 'The single best networking habit is...',
        options: ['Collecting business cards', 'Following up once a month for a year', 'Posting often on social', 'Attending events'],
        correctIndex: 1,
        explanation: '30-second follow-ups, monthly, for a year. Watch what happens.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'How to Build a Powerful Network',
        speaker: 'Keith Ferrazzi',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 9,
        whyWatch: 'The author of Never Eat Alone on relational capital.',
      ),
      VideoResource(
        title: 'The Art of Small Talk',
        speaker: 'Leil Lowndes',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 5,
        whyWatch: 'How to convert strangers into allies.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Positions vs. Interests',
        content:
            'The most common negotiation mistake is fighting over positions ("I want \$1000," "I can only pay \$500") instead of exploring interests (WHY do they want that price? What are they really trying to achieve?). When you understand interests, you can often find creative solutions that satisfy both parties. Always ask "Why is that important to you?" before making counter-offers.',
      ),
      LessonSection(
        heading: 'BATNA: Your Walk-Away Power',
        content:
            'BATNA = Best Alternative To a Negotiated Agreement. This is your plan B — what you\'ll do if you can\'t reach a deal. The party with the stronger BATNA has more negotiating power. Before any negotiation, improve your BATNA. If you\'re negotiating a job offer, having another offer in hand dramatically strengthens your position. Always know your walk-away option.',
      ),
      LessonSection(
        heading: 'The Anchoring Effect',
        content:
            'The first number mentioned in a negotiation becomes the "anchor" that all subsequent discussion revolves around. This is why you should make the first offer when you\'re knowledgeable about the market. Make it ambitious but defensible. If the other party anchors first, consciously reset the anchor: "That\'s an interesting starting point. Let me share some market data that suggests a different range."',
      ),
      LessonSection(
        heading: 'The Flinch and The Silence',
        content:
            'Two powerful techniques: (1) The Flinch — when you hear a price or offer, visibly react with surprise (even if it\'s fair). This often causes the other party to immediately improve their offer. (2) The Silence — after making your offer, shut up. The next person to speak loses. Silence creates discomfort that the other party often fills with concessions. Practice being comfortable with silence.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Negotiate something small today — a discount, a later deadline, an upgrade. Practice the techniques.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Identify your BATNA for one upcoming negotiation in your life (salary, contract, purchase). Write it down.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Practice "The Silence" — in a conversation today, after asking a question, stay silent and let the other person fill the space.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'Think of a past negotiation where you felt you got less than you deserved. What would you do differently now, knowing these principles?',
    actionStep:
        'Before your next negotiation, write down: (1) Your ideal outcome, (2) Your BATNA, (3) Their likely interests, (4) Your first offer anchor.',
  ),

  // DAY 12 — Pricing
  DailyLesson(
    day: 12,
    title: 'The Psychology of Pricing',
    theme: 'Charging what you\'re worth without apology',
    category: 'skill',
    quote:
        'Price is what you pay. Value is what you get.',
    quoteAuthor: 'Warren Buffett',
    mindsetLesson:
        'Most first-time entrepreneurs undercharge — sometimes dramatically. They price based on what they\'d personally pay, or what competitors charge, or (worst of all) what they think people "can afford." Professional pricing is based on VALUE delivered, not cost incurred. Today you\'ll learn to price confidently and understand the psychology that makes certain prices more attractive than others.',
    skillName: 'Value-Based Pricing',
    skillDescription:
        'The ability to set prices based on the value delivered to the customer rather than the cost of production or competitor benchmarks.',
    xpReward: 100,
    chapterTitle: 'Chapter XII — The Pricer',
    weekTheme: 'The Craft',
    teaserQuote: 'Make it simple. Make it memorable. Make it inviting to look at. — Leo Burnett',
    teaserHook: 'Marketing is the science of being found by the people who already need you. Tomorrow, you build the signal.',
    quiz: [
      QuizQuestion(
        question: 'Price is, in the end,...',
        options: ['A number', 'A story the buyer is telling themselves', 'A reflection of cost', 'Whatever competitors charge'],
        correctIndex: 1,
        explanation: 'Price is a narrative artifact. The story drives the number.',
      ),
      QuizQuestion(
        question: 'The most common pricing mistake is to price based on...',
        options: ['Value delivered', 'Cost plus a margin', 'Market demand', 'Brand positioning'],
        correctIndex: 1,
        explanation: 'Cost-plus leaves money on the table when value is high.',
      ),
      QuizQuestion(
        question: 'Anchoring in pricing means...',
        options: ['Showing the highest tier first', 'Hiding prices', 'Discounting aggressively', 'Asking what the buyer wants to pay'],
        correctIndex: 0,
        explanation: 'Anchors set the reference point. Always lead with the tier you want to sell.',
      ),
      QuizQuestion(
        question: 'If your price is too low, you usually...',
        options: ['Sell more', 'Attract the wrong buyers and burn out', 'Look professional', 'Save the world'],
        correctIndex: 1,
        explanation: 'Cheap attracts the most demanding, least loyal customers.',
      ),
      QuizQuestion(
        question: 'A premium price is most defensible when it reflects...',
        options: ['Higher cost', 'A unique, measurable outcome for the buyer', 'Snobbery', 'Marketing'],
        correctIndex: 1,
        explanation: 'Premium survives only when the outcome is provable and unique.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Psychology of Price',
        speaker: 'Leigh Caldwell',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 6,
        whyWatch: 'Why price is a story, not a number.',
      ),
      VideoResource(
        title: "Charge What You're Worth",
        speaker: 'Tara Swart',
        youtubeId: 'QoqohmccTSc',
        durationMinutes: 8,
        whyWatch: 'Neuroscience-backed pricing confidence.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Cost-Plus vs. Value-Based',
        content:
            'Cost-plus pricing: "It costs me \$10 to make, so I\'ll charge \$20." This leaves massive money on the table. Value-based pricing: "This saves my customer \$500 per month, so charging \$200/month is a bargain." The customer doesn\'t care about your costs — they care about their outcome. Price relative to the value you create, not the cost you incur.',
      ),
      LessonSection(
        heading: 'The Anchoring Menu',
        content:
            'Always offer multiple price points. A \$97/\$197/\$497 pricing structure does two things: (1) The high price makes the middle price seem reasonable (anchoring). (2) Different customers have different budgets and needs — you capture all of them. The middle option typically gets the most sales. Make sure each tier offers genuinely increasing value.',
      ),
      LessonSection(
        heading: 'Price Objection Handling',
        content:
            'When someone says "It\'s too expensive," they\'re really saying "I don\'t yet see the value." Don\'t drop your price immediately. Instead: (1) Acknowledge: "I understand it\'s an investment." (2) Re-anchor to value: "Let\'s look at what this delivers..." (3) Compare to alternatives: "Compared to hiring a full-time person at \$60K/year, this \$2K solution..." (4) Offer a smaller entry point if appropriate.',
      ),
      LessonSection(
        heading: 'The Confidence Factor',
        content:
            'Your pricing communicates your confidence. If you price too low, you signal "I\'m not sure this is valuable." If you price confidently (with genuine value to back it up), you signal "This is worth it, and I know it." Many entrepreneurs undercharge because they\'re projecting their own money scarcity onto their customers. Your customers may happily pay more than you\'d personally spend.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Research 3 businesses in your target industry. Analyze their pricing structure. What value do they deliver at each price point?',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Design a 3-tier pricing structure for a hypothetical product you could offer. Include specific features at each tier.',
        type: 'creative',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Calculate the ROI of one product/service you use: what does it cost vs. what value (time, money, results) does it deliver?',
        type: 'thought',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'If you were to charge based on the VALUE you create (not the time you spend), how would your pricing change? What\'s stopping you from charging that?',
    actionStep:
        'For your next offer, calculate the monetary value it delivers to the customer. Price at 10-25% of that value. This is your "value-based price."',
  ),

  // DAY 13 — Marketing Fundamentals
  DailyLesson(
    day: 13,
    title: 'Marketing That Works',
    theme: 'Getting attention without being annoying',
    category: 'skill',
    quote:
        'The best marketing doesn\'t feel like marketing.',
    quoteAuthor: 'Tom Fishburne',
    mindsetLesson:
        'You can build the best product in the world, but if nobody knows about it, you don\'t have a business. Marketing is not about tricking people — it\'s about connecting people who have a problem with your solution to that problem. Today you\'ll learn the fundamental marketing frameworks that work across every industry and platform.',
    skillName: 'Strategic Marketing',
    skillDescription:
        'The ability to attract, engage, and convert the right audience through clear messaging and targeted distribution.',
    xpReward: 100,
    chapterTitle: 'Chapter XIII — The Voice',
    weekTheme: 'The Craft',
    teaserQuote: "People don't buy what you do; they buy why you do it. — Simon Sinek",
    teaserHook: "Empathy is not a soft skill. It's the most profitable skill you can have. Tomorrow, you see through your customer's eyes.",
    quiz: [
      QuizQuestion(
        question: "Seth Godin's definition of marketing is closest to:",
        options: ['Advertising', 'Choosing who you will serve and how you will matter to them', 'Posting on social', 'Logo design'],
        correctIndex: 1,
        explanation: "Marketing is the choice of who, what, and why — before the 'how' of tactics.",
      ),
      QuizQuestion(
        question: 'A great marketing message is best when it is...',
        options: ['Broad enough to reach everyone', "Specific enough that the right people feel 'that's me'", 'Loud', 'Full of jargon'],
        correctIndex: 1,
        explanation: 'Specificity is reach for the right people. Vague is reach for no one.',
      ),
      QuizQuestion(
        question: "The 1-Page Marketing Plan's first step is...",
        options: ['Choose a target', 'Set a budget', 'Buy ads', 'Pick a logo'],
        correctIndex: 0,
        explanation: 'Target before tactics. Always target before tactics.',
      ),
      QuizQuestion(
        question: 'The cheapest, most underused marketing channel is...',
        options: ['TikTok ads', "Your existing customers' word of mouth", 'Billboards', 'Email blasts'],
        correctIndex: 1,
        explanation: 'Referrals are the highest-converting, lowest-cost channel in existence.',
      ),
      QuizQuestion(
        question: "'Content marketing' works because it...",
        options: ['Is cheap', 'Earns trust by being useful first', 'Goes viral', 'Is mandatory'],
        correctIndex: 1,
        explanation: 'Useful first. Trust first. Sale second. Always that order.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'This Is Marketing',
        speaker: 'Seth Godin',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 19,
        whyWatch: 'A masterclass in marketing as a long game of trust.',
      ),
      VideoResource(
        title: 'The 1-Page Marketing Plan',
        speaker: 'Allan Dib',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 11,
        whyWatch: 'A clear, structured framework for marketing a new venture.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Marketing Equation',
        content:
            'Marketing success = Right Message × Right Audience × Right Channel × Right Timing. Most failed marketing is not "bad marketing" — it\'s good marketing to the wrong audience, or right audience with the wrong message. Before spending money on ads or content, get crystal clear on: Who exactly are you talking to? What specific problem do they have? How does your solution uniquely solve it?',
      ),
      LessonSection(
        heading: 'The 3-Step Customer Journey',
        content:
            'Every customer goes through: (1) Awareness — they realize they have a problem. (2) Consideration — they explore solutions. (3) Decision — they choose a provider. Your marketing must meet them at each stage. Awareness-stage content: "Here\'s why [problem] matters." Consideration-stage: "Here are ways to solve [problem]." Decision-stage: "Here\'s why our solution is the best fit for you."',
      ),
      LessonSection(
        heading: 'The Rule of One',
        content:
            'The most effective marketing focuses on ONE thing: one target customer, one core problem, one primary solution, one key differentiator, one main channel. When you try to appeal to everyone, you appeal to no one. Narrow focus beats broad appeal every time. You can expand later, after you\'ve dominated one niche.',
      ),
      LessonSection(
        heading: 'Content as Asset',
        content:
            'Paid advertising stops when you stop paying. Content (articles, videos, podcasts, social media posts) is an asset that compounds over time. A blog post written today can attract customers for years. Start building your content library now — before you even have a product to sell. Share what you\'re learning. Document your journey. Teach what you know. This builds an audience that will be ready when you launch.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Define your "Rule of One": write down one specific target customer, their one core problem, and your one unique solution.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Create one piece of content today (social post, short video, or note) that teaches something valuable to your target audience.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Analyze the marketing of one successful company. Identify their target audience, core message, and primary channels.',
        type: 'thought',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'If you had to get your first 10 customers without spending any money on ads, how would you do it? Be specific.',
    actionStep:
        'Write your "One-Sentence Marketing Message": "I help [specific person] solve [specific problem] so they can [specific outcome]."',
  ),

  // DAY 14 — Customer Empathy
  DailyLesson(
    day: 14,
    title: 'Deep Customer Empathy',
    theme: 'Becoming obsessed with the people you serve',
    category: 'skill',
    quote:
        'Your most unhappy customers are your greatest source of learning.',
    quoteAuthor: 'Bill Gates',
    mindsetLesson:
        'The best entrepreneurs are not obsessed with their product — they\'re obsessed with their customer. They know their customer\'s fears, dreams, daily frustrations, and secret desires better than the customer knows themselves. This deep empathy is what separates good products from great ones. Today you\'ll learn to develop customer empathy as your entrepreneurial superpower.',
    skillName: 'Customer Empathy',
    skillDescription:
        'The ability to deeply understand your customer\'s world — their pains, desires, context, and motivations — and use that understanding to serve them better.',
    xpReward: 150,
    chapterTitle: 'Chapter XIV — The Empath',
    weekTheme: 'The Craft',
    teaserQuote: "If you are not embarrassed by the first version of your product, you've launched too late. — Reid Hoffman",
    teaserHook: 'Perfection is the enemy of the lean. Tomorrow, you build a real thing that real people can use — this week.',
    quiz: [
      QuizQuestion(
        question: 'Customer empathy is best developed by...',
        options: ['Surveys', 'Watching real customers struggle with the problem', 'Focus groups', 'Demographics'],
        correctIndex: 1,
        explanation: "Watch. Listen. Don't ask. Watch them in the wild.",
      ),
      QuizQuestion(
        question: "An 'empathy map' has four quadrants:",
        options: ['Cost / Quality / Speed / Brand', 'Says / Thinks / Does / Feels', 'A / B / C / D', 'Awareness / Interest / Desire / Action'],
        correctIndex: 1,
        explanation: 'Says/Thinks/Does/Feels. Simple, brutal, clarifying.',
      ),
      QuizQuestion(
        question: 'Empathy for the customer is most valuable when it leads to...',
        options: ['Sympathy', 'Better product decisions', 'Discounts', 'Longer copy'],
        correctIndex: 1,
        explanation: 'Empathy is not the goal. Better decisions are the goal.',
      ),
      QuizQuestion(
        question: 'The opposite of customer empathy is...',
        options: ['Indifference', 'Building for yourself', 'Market research', 'Sales'],
        correctIndex: 1,
        explanation: 'Most failed products are mirrors. They reflect the founder, not the buyer.',
      ),
      QuizQuestion(
        question: 'Empathy deepens most reliably through...',
        options: ['Reading about personas', 'Repetition: many real conversations, over time', 'Watching a documentary', 'Hiring a research firm'],
        correctIndex: 1,
        explanation: 'Volume of contact, over time, with real humans.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Power of Empathy',
        speaker: 'Brené Brown',
        youtubeId: '1Evwgu369Jw',
        durationMinutes: 4,
        whyWatch: 'Three minutes that rewire how you see other people.',
      ),
      VideoResource(
        title: 'How to Build a Customer Empathy Map',
        speaker: 'NN/g',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 8,
        whyWatch: 'Practical tool to understand your buyer deeply.',
      ),
    ],
    unlockBadge: 'money_master',
    sections: [
      LessonSection(
        heading: 'The Empathy Gap',
        content:
            'Most entrepreneurs suffer from the "curse of knowledge" — they know so much about their solution that they can\'t imagine what it\'s like to NOT know it. This creates an empathy gap. Your marketing talks about features they don\'t understand. Your onboarding assumes knowledge they don\'t have. Bridge this gap by constantly asking: "What does my customer know, feel, and believe RIGHT NOW?"',
      ),
      LessonSection(
        heading: 'The Day-in-the-Life Exercise',
        content:
            'To build empathy, do a "day in the life" exercise: Write out your ideal customer\'s entire day, hour by hour. When do they wake up? What stresses them out? What do they do for fun? Where do they spend time online? What do they complain about? What do they aspire to? The more detailed, the better. This exercise reveals opportunities you\'d never find through traditional "market research."',
      ),
      LessonSection(
        heading: 'Talk to Customers (Before You Have Any)',
        content:
            'The single highest-ROI activity for any entrepreneur: have conversations with potential customers. Not sales calls — genuine curiosity conversations. Ask: "What\'s the hardest part about [problem area]?" "What have you tried?" "What worked and what didn\'t?" "What would a perfect solution look like?" These conversations are gold mines of insight.',
      ),
      LessonSection(
        heading: 'The Feedback Loop',
        content:
            'Build a systematic feedback loop: (1) Ask customers what\'s working and what\'s not. (2) Listen without defending. (3) Identify patterns across multiple customers. (4) Make improvements based on those patterns. (5) Tell customers what you changed based on their feedback. This loop not only improves your product — it builds fierce customer loyalty because people feel heard and valued.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Do the "Day-in-the-Life" exercise: write out a detailed daily timeline for your ideal customer.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Have a genuine curiosity conversation with one potential customer today. Ask about their problems, not your solution.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Write down 5 assumptions you\'ve made about your customers. For each, ask: "How do I know this is true?"',
        type: 'thought',
        points: 25,
      ),
    ],
    reflectionPrompt:
        'If you were your own customer, what would frustrate you about the experience of buying and using your product? How can you eliminate those frustrations?',
    actionStep:
        'Create a "Customer Empathy Map" with 6 sections: What do they SEE, HEAR, THINK & FEEL, SAY & DO, their PAINS, and their GAINS.',
  ),

  // ============================================================
  // WEEK 3: BUSINESS BUILDING (Days 15-21)
  // ============================================================

  // DAY 15 — Lean Startup
  DailyLesson(
    day: 15,
    title: 'The Lean Startup Method',
    theme: 'Build-Measure-Learn your way to success',
    category: 'action',
    quote:
        'The only way to win is to learn faster than anyone else.',
    quoteAuthor: 'Eric Ries',
    mindsetLesson:
        'The old way of building a business: write a 50-page business plan, raise money, build the product in secret for 2 years, launch with a big bang, and hope people buy it. This fails ~75% of the time. The lean startup way: build a minimum version quickly, get it in front of real customers immediately, measure their actual behavior (not their opinions), and learn what to improve. Today you\'ll learn the lean methodology that modern startups use to reduce risk and accelerate success.',
    skillName: 'Lean Methodology',
    skillDescription:
        'The systematic approach to building a business under conditions of extreme uncertainty through rapid experimentation.',
    xpReward: 100,
    chapterTitle: 'Chapter XV — The Builder',
    weekTheme: 'The Execution',
    teaserQuote: 'Build something 100 people love, not something 1 million people kind of like. — Brian Chesky',
    teaserHook: "An MVP is not a small product. It's a maximum-learning vehicle. Tomorrow, you ship.",
    quiz: [
      QuizQuestion(
        question: "The Lean Startup's central discipline is...",
        options: ['Shipping fast', 'Validated learning through build-measure-learn', 'Cutting cost', 'Being first to market'],
        correctIndex: 1,
        explanation: 'Build to learn. Not build to launch.',
      ),
      QuizQuestion(
        question: "A 'pivot' in lean terms is...",
        options: ['Giving up', 'Changing course based on evidence', 'Marketing shift', 'Spending less'],
        correctIndex: 1,
        explanation: 'Pivot = course correction, not surrender.',
      ),
      QuizQuestion(
        question: 'Lean startup is most useful for...',
        options: ['Mature companies', 'New ventures operating under deep uncertainty', 'Nonprofits only', 'Hardware only'],
        correctIndex: 1,
        explanation: 'Lean thrives under uncertainty. Mature companies can rely on data.',
      ),
      QuizQuestion(
        question: 'The biggest anti-lean mistake is to...',
        options: ['Talk to users', 'Scale before finding product-market fit', 'Run small tests', 'Charge too much'],
        correctIndex: 1,
        explanation: 'Premature scaling kills startups. Be lean until PMF; then scale.',
      ),
      QuizQuestion(
        question: 'Validated learning means...',
        options: ['Knowing your idea is good', 'Knowing your idea is real because users proved it', 'Having surveys', 'Pricing well'],
        correctIndex: 1,
        explanation: 'Proof, not opinion. Real money, real retention.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Lean Startup',
        speaker: 'Eric Ries',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 11,
        whyWatch: 'The seminal talk on validated learning.',
      ),
      VideoResource(
        title: 'Why Lean Is the Only Way to Build',
        speaker: 'Ash Maurya',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 9,
        whyWatch: 'Practical lessons on running lean experiments.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'MVP: Minimum Viable Product',
        content:
            'An MVP is not a crappy product — it\'s the smallest version of your product that can still deliver value and generate validated learning. Dropbox\'s MVP was a 3-minute video demonstrating how the product WOULD work. Zappos\' MVP was the founder taking photos of shoes at a local store and buying them at retail price when someone ordered online. What\'s the fastest, cheapest way to test whether people actually want what you\'re building?',
      ),
      LessonSection(
        heading: 'The Build-Measure-Learn Loop',
        content:
            'The engine of lean startup: (1) Build — create your MVP or experiment. (2) Measure — collect data on how real customers behave. (3) Learn — extract insights: was your hypothesis correct? Should you persevere with your current strategy or pivot to a new one? The goal is to minimize the total time through this loop. Speed of learning is your competitive advantage.',
      ),
      LessonSection(
        heading: 'Validated Learning',
        content:
            'Validated learning is not "we got some good feedback." It\'s empirical data that proves a specific hypothesis. Example hypothesis: "Small business owners will pay \$50/month for automated expense tracking." To validate: create a landing page describing the product with a \$50/month pre-order button. Measure: how many visitors click "pre-order"? If 5% do, you have validated learning. If 0% do, you\'ve learned something equally valuable.',
      ),
      LessonSection(
        heading: 'The Pivot',
        content:
            'A pivot is a structured course correction designed to test a new fundamental hypothesis. Types of pivots: Customer Segment Pivot (same product, different audience), Problem Pivot (different problem for same audience), Platform Pivot (app → web or vice versa), Revenue Model Pivot (subscription → one-time or vice versa). Pivoting is not failure — it\'s the lean startup working as designed.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Design an MVP for your business idea that you could build and test in under 2 weeks. What\'s the absolute minimum version?',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Write a specific, testable hypothesis about your business idea: "I believe [target customer] will [specific behavior] because [reason]."',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Research one famous pivot story (Slack, Twitter, Instagram started as something else). What did they learn that caused the pivot?',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'What is the riskiest assumption in your business idea? What\'s the fastest, cheapest experiment you could run to test whether that assumption is true?',
    actionStep:
        'Commit to launching something within 30 days — not a perfect product, but a testable version that real people can interact with.',
  ),

  // DAY 16 — MVP Creation
  DailyLesson(
    day: 16,
    title: 'Build Your First MVP',
    theme: 'From idea to tangible prototype in record time',
    category: 'action',
    quote:
        'If you are not embarrassed by the first version of your product, you\'ve launched too late.',
    quoteAuthor: 'Reid Hoffman',
    mindsetLesson:
        'Yesterday you learned the theory of MVPs. Today is about execution: actually building something. The biggest barrier to MVP creation is perfectionism — the voice that says "it\'s not ready yet." Successful entrepreneurs ship imperfect versions, get real feedback, and iterate. Today you\'ll learn practical approaches to building your first MVP with minimal time and zero budget.',
    skillName: 'Rapid Prototyping',
    skillDescription:
        'The ability to quickly create functional, testable versions of a product idea using available tools and resources.',
    xpReward: 100,
    chapterTitle: 'Chapter XVI — The Shipper',
    weekTheme: 'The Execution',
    teaserQuote: "Without data, you're just another person with an opinion. — W. Edwards Deming",
    teaserHook: 'Systems beat willpower, every single time. Tomorrow, you build the engine.',
    quiz: [
      QuizQuestion(
        question: 'MVP stands for...',
        options: ['Most Valuable Player', 'Minimum Viable Product', 'Marketing Value Proposition', 'Minimum Viable Plan'],
        correctIndex: 1,
        explanation: 'Minimum — not small. Viable — not finished. Product — not a slide.',
      ),
      QuizQuestion(
        question: "The MVP's purpose is to...",
        options: ['Make money on day one', 'Maximize learning per dollar of effort', 'Look finished', 'Win awards'],
        correctIndex: 1,
        explanation: 'Learn the most for the least. Always that, before revenue.',
      ),
      QuizQuestion(
        question: 'A great MVP often feels...',
        options: ['Embarrassing', 'Polished', 'Like a real product', 'Enterprise-grade'],
        correctIndex: 0,
        explanation: "If it doesn't embarrass you, you waited too long.",
      ),
      QuizQuestion(
        question: 'The MVP should test...',
        options: ['The most expensive hypothesis', 'The riskiest assumption, cheaply', 'The design', 'The team'],
        correctIndex: 1,
        explanation: 'Test the riskiest unknown first. Everything else is decoration.',
      ),
      QuizQuestion(
        question: 'After launching an MVP, the next step is to...',
        options: ['Celebrate', 'Measure and learn — then iterate or pivot', 'Pivot immediately', "Quit if it's not perfect"],
        correctIndex: 1,
        explanation: 'Measure. Learn. Decide. Iterate or pivot. Repeat.',
      ),
    ],
    videos: [
      VideoResource(
        title: "Why the MVP Is the Smartest Thing You'll Ever Build",
        speaker: 'Reid Hoffman',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 2,
        whyWatch: 'The LinkedIn founder on shipping before you feel ready.',
      ),
      VideoResource(
        title: 'How to Build an MVP in 30 Days',
        speaker: 'Hatch',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 7,
        whyWatch: 'A pragmatic walkthrough.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'MVP Types You Can Build This Week',
        content:
            '(1) Landing Page MVP: a single web page describing your product with an email signup. Tools: Carrd, Notion, or Google Sites. (2) Concierge MVP: you manually deliver the service yourself before automating it. (3) Wizard of Oz MVP: customers think it\'s automated, but you\'re doing the work behind the scenes. (4) Piecemeal MVP: using existing tools (Google Forms + Zapier + Airtable) glued together. (5) Video MVP: a demo video showing how the product would work.',
      ),
      LessonSection(
        heading: 'The 48-Hour MVP Challenge',
        content:
            'Can you build a testable version of your idea in 48 hours? Most people overestimate what\'s needed. A consulting business MVP: a LinkedIn profile describing your service + one free strategy session offer. A product MVP: a Notion template or Google Sheet that delivers value manually. A content business MVP: one article or video testing if anyone cares about the topic. Set a 48-hour timer and ship something.',
      ),
      LessonSection(
        heading: 'No-Code Tools Arsenal',
        content:
            'You don\'t need to code to build an MVP. Tools: Carrd/Notion (landing pages), Typeform/Google Forms (surveys and data collection), Airtable/Google Sheets (databases), Zapier/Make (automation), Canva (design), Gumroad/Lemon Squeezy (selling digital products), Calendly (scheduling). With these tools alone, you can build and sell a functional product this weekend.',
      ),
      LessonSection(
        heading: 'The Shipping Mindset',
        content:
            'Perfectionism is fear in disguise. "It\'s not ready" usually means "I\'m afraid of what people will think." The antidote: set a hard deadline (48 hours, 1 week max) and ship whatever you have. Tell yourself: "This is Version 0.1. I will improve it based on feedback." The first version of anything great was mediocre. Amazon started as a crappy online bookstore. Ship now, improve later.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Choose one MVP type from today\'s lesson and outline exactly how you\'d build it for your idea using specific tools.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Set a 48-hour timer (or this weekend) and commit to shipping one tiny version of something — a page, a post, a prototype.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Explore one no-code tool today (Carrd, Notion, Airtable, or Gumroad) and create a simple test project with it.',
        type: 'skill',
        points: 25,
      ),
    ],
    reflectionPrompt:
        'What is the SIMPLEST possible version of your idea that could still deliver real value to one person? Could you build that in 48 hours?',
    actionStep:
        'Write your "MVP Spec" on one page: What is it? Who is it for? What\'s the one core feature? How will you know if it\'s working?',
  ),

  // DAY 17 — Systems Thinking
  DailyLesson(
    day: 17,
    title: 'Systems Over Hustle',
    theme: 'Building the machine that builds the business',
    category: 'action',
    quote:
        'You do not rise to the level of your goals. You fall to the level of your systems.',
    quoteAuthor: 'James Clear',
    mindsetLesson:
        'Hustle culture glorifies working 80-hour weeks and grinding yourself to exhaustion. But the entrepreneurs who build lasting, scalable businesses think differently: they build SYSTEMS. A system is a repeatable process that produces consistent results regardless of who executes it. Today you\'ll learn to shift from "I\'ll just work harder" to "I\'ll build a better system."',
    skillName: 'Systems Design',
    skillDescription:
        'The ability to create repeatable processes and workflows that produce consistent, scalable results.',
    xpReward: 100,
    chapterTitle: 'Chapter XVII — The Architect',
    weekTheme: 'The Execution',
    teaserQuote: 'The art of leadership is saying no, not yes. — Tony Blair',
    teaserHook: "Delegation is not losing control. It's multiplying yourself. Tomorrow, you let go — and grow.",
    quiz: [
      QuizQuestion(
        question: 'The E-Myth thesis is that most businesses fail because they are...',
        options: ['Undercapitalized', "Designed around the founder's skills, not systems", 'Run by amateurs', 'In bad markets'],
        correctIndex: 1,
        explanation: 'Founder-dependent. Owner-absent. System-free.',
      ),
      QuizQuestion(
        question: "A 'system' is best defined as...",
        options: ['A list of rules', 'A repeatable process that runs without you', 'A software tool', 'An org chart'],
        correctIndex: 1,
        explanation: 'Repeatable. Documented. Runnable without you.',
      ),
      QuizQuestion(
        question: 'The biggest reason to build systems is...',
        options: ['To control people', 'To free yourself to work on the highest-value work', 'To reduce headcount', 'To look professional'],
        correctIndex: 1,
        explanation: 'Systems = leverage. They let you stop being the bottleneck.',
      ),
      QuizQuestion(
        question: 'The first system to build is usually the one that...',
        options: ['Looks impressive', 'Is run by the founder most often', 'Is most expensive', 'Is most complex'],
        correctIndex: 1,
        explanation: 'Find the bottleneck job. Systematize that. Repeat.',
      ),
      QuizQuestion(
        question: 'Systems thinking requires you to...',
        options: ['Hire managers', 'See the business as a set of interlocking processes', 'Buy software', 'Outsource'],
        correctIndex: 1,
        explanation: 'Process mindset first. Tools second. Always.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'E-Myth Revisited',
        speaker: 'Michael Gerber',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 10,
        whyWatch: 'The classic on working ON your business, not IN it.',
      ),
      VideoResource(
        title: 'Build Systems, Not Goals',
        speaker: 'James Clear',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 3,
        whyWatch: 'The atomic-habits author on systemic change.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Entrepreneurial Trap',
        content:
            'Most solo entrepreneurs become the bottleneck in their own business. They do everything themselves — sales, delivery, admin, marketing. This works at small scale but creates a prison: the business can\'t run without you, and you can\'t take a day off without everything stopping. The escape is systems: documented processes that can be followed by anyone (including a future employee or contractor).',
      ),
      LessonSection(
        heading: 'The 3 Core Business Systems',
        content:
            'Every business needs three systems: (1) Attraction System — how ideal customers find you (content, referrals, ads, partnerships). (2) Conversion System — how interested people become paying customers (discovery call → proposal → payment → onboarding). (3) Delivery System — how you fulfill what you promised (workflow, quality checks, client communication, offboarding). Document each system as a checklist or SOP (Standard Operating Procedure).',
      ),
      LessonSection(
        heading: 'The SOP Mindset',
        content:
            'An SOP is a written document that says: "To accomplish X, follow these exact steps in this exact order." Start creating SOPs for everything you do repeatedly. Client onboarding SOP. Content creation SOP. Invoice sending SOP. The act of writing the SOP forces you to think through the process and eliminate inefficiencies. Plus, when you\'re ready to hire help, the SOP is their training manual.',
      ),
      LessonSection(
        heading: 'Automate Before You Delegate',
        content:
            'Before hiring someone to do a task, ask: "Can this be automated?" Tools like Zapier, Make, Calendly, and email autoresponders can handle repetitive tasks for pennies. Automation is cheaper, faster, and never calls in sick. Rule of thumb: Automate first, then delegate what can\'t be automated, then do yourself only what requires your unique genius.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Document one repeatable task you do as an SOP: write down every step in order. Time yourself doing it.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Identify one task in your life/business that could be automated. Research a tool that could do it.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Map out your (future) business\'s 3 core systems: Attraction, Conversion, and Delivery. One paragraph each.',
        type: 'thought',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What tasks do you currently do that someone else (or something else) could do if you had proper systems documented? How much time would that free up?',
    actionStep:
        'Create your first SOP today — pick one task you do regularly and write down the exact steps. Store it where you can find it later.',
  ),

  // DAY 18 — Delegation
  DailyLesson(
    day: 18,
    title: 'The Art of Delegation',
    theme: 'Letting go to grow bigger',
    category: 'action',
    quote:
        'If you want to go fast, go alone. If you want to go far, go together.',
    quoteAuthor: 'African Proverb',
    mindsetLesson:
        'Many entrepreneurs struggle with delegation because they believe "nobody can do it as well as I can." This belief caps their growth at what one person can personally do. Delegation is not about finding someone better than you — it\'s about freeing your time for the work that ONLY you can do. Today you\'ll learn to delegate effectively and overcome the psychological barriers that keep you stuck doing everything.',
    skillName: 'Effective Delegation',
    skillDescription:
        'The ability to transfer responsibility for tasks to others while maintaining quality and freeing your time for higher-leverage work.',
    xpReward: 100,
    chapterTitle: 'Chapter XVIII — The Delegator',
    weekTheme: 'The Execution',
    teaserQuote: 'Accounting is the language of business. — unknown',
    teaserHook: 'Revenue is vanity. Profit is sanity. Cash is king. Tomorrow, you master the language of money.',
    quiz: [
      QuizQuestion(
        question: 'Delegation is, fundamentally,...',
        options: ['Losing control', 'Multiplying your impact through other people', 'Lazy', 'Optional'],
        correctIndex: 1,
        explanation: 'Delegation is the only way to scale yourself.',
      ),
      QuizQuestion(
        question: 'A common founder trap is...',
        options: ['Hiring too fast', 'Holding on to tasks they could delegate', 'Outsourcing', 'Documenting'],
        correctIndex: 1,
        explanation: 'Founder-as-bottleneck is the most common reason growth stalls.',
      ),
      QuizQuestion(
        question: 'The first task to delegate is...',
        options: ['The most strategic', 'The one that drains you and someone else can do', 'The one you enjoy', "The one that's hardest"],
        correctIndex: 1,
        explanation: 'Drain first. Joy second. Strategy never.',
      ),
      QuizQuestion(
        question: 'Good delegation requires...',
        options: ['Daily check-ins', 'Clear outcomes, not micromanaged methods', 'Trust without verification', 'A contract'],
        correctIndex: 1,
        explanation: 'Outcomes over methods. Inspect outcomes. Trust methods.',
      ),
      QuizQuestion(
        question: "'Letting go' is a discipline because...",
        options: ["It's easy", "The founder's identity is often tied to control", 'You must do it once', 'It is optional'],
        correctIndex: 1,
        explanation: 'Identity is the lock. Releasing it is the work.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Art of Delegation',
        speaker: 'Gretchen Rubin',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 6,
        whyWatch: 'Why delegating is a discipline, not a one-off.',
      ),
      VideoResource(
        title: 'Delegate or Die',
        speaker: 'Andy Frisella',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 4,
        whyWatch: 'Hard truths about the cost of doing it all yourself.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The \$10/\$100/\$1000 Rule',
        content:
            'Categorize all your tasks by hourly value: \$10/hour tasks (admin, data entry, scheduling), \$100/hour tasks (client work, content creation, sales calls), \$1000/hour tasks (strategy, vision, relationship building, product innovation). Your goal: delegate all \$10 tasks immediately, systematically delegate \$100 tasks over time, and focus your personal energy on \$1000 tasks. Every hour you spend on a \$10 task costs you \$990 in lost potential.',
      ),
      LessonSection(
        heading: 'The 70% Rule',
        content:
            'The biggest delegation mistake: waiting until you find someone who can do the task as well as you (100%). Instead, if someone can do it 70% as well as you, delegate it. The 30% quality gap is the price you pay for leverage. Over time, with practice and feedback, they\'ll reach 80%, then 90%. Meanwhile, you\'ve freed hundreds of hours for high-leverage work that only you can do.',
      ),
      LessonSection(
        heading: 'Delegation = SOP + Check-in',
        content:
            'Effective delegation requires two things: (1) A clear SOP (Standard Operating Procedure) — the exact steps, standards, and examples they need. (2) A check-in rhythm — not micromanaging, but scheduled moments to review work, give feedback, and answer questions. Start with daily check-ins, then move to weekly as competence grows. Never delegate and disappear — that\'s abdication, not delegation.',
      ),
      LessonSection(
        heading: 'Start Small, Build Trust',
        content:
            'Don\'t delegate your most critical task first. Start with something low-stakes. Delegate one \$10 task with a clear SOP. See how it goes. Give feedback. Build trust incrementally. As your confidence in their ability grows, delegate progressively more important tasks. This gradual approach protects your business while steadily freeing your time.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'List every task you did today. Categorize each as \$10, \$100, or \$1000/hour. How many \$10 tasks did you do?',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Identify one \$10 task you can delegate this week. Write the SOP for it and find someone (even a friend or freelancer) to do it.',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Practice the 70% Rule: let someone do something today that you\'d normally do yourself, even if they don\'t do it perfectly.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What is the highest-leverage activity in your business — the thing that ONLY you can do that creates the most value? How much more of that could you do if you delegated everything else?',
    actionStep:
        'Identify your top 3 \$10/hour tasks. For each, write one sentence describing who could do it and what the SOP would need.',
  ),

  // DAY 19 — Financial Literacy
  DailyLesson(
    day: 19,
    title: 'Cash Flow Mastery',
    theme: 'The #1 skill that keeps businesses alive',
    category: 'action',
    quote:
        'Revenue is vanity, profit is sanity, cash is reality.',
    quoteAuthor: 'Unknown',
    mindsetLesson:
        'The #1 reason businesses die is not bad products or weak marketing — it\'s running out of cash. You can be profitable on paper and still go bankrupt. Cash flow is the blood of your business: when it stops flowing, everything dies. Today you\'ll learn not just financial concepts but the specific weekly rituals, account structures, and rules that keep cash flowing and growing from Day 1.',
    skillName: 'Financial Fluency',
    skillDescription:
        'The ability to track, manage, and grow your cash flow through disciplined weekly rituals, the Profit First system, and ruthless expense management.',
    xpReward: 100,
    chapterTitle: 'Chapter XIX — The Steward',
    weekTheme: 'The Execution',
    teaserQuote: "A good pitch is not a monologue. It's a conversation's first move. — unknown",
    teaserHook: "A pitch is not a deck. It's a story that makes the future inevitable. Tomorrow, you craft yours.",
    quiz: [
      QuizQuestion(
        question: 'The #1 reason businesses die is...',
        options: ['Bad product', 'Running out of cash', 'No marketing', 'Wrong timing'],
        correctIndex: 1,
        explanation: 'Cash is oxygen. Everything else is a symptom of running out.',
      ),
      QuizQuestion(
        question: 'Profit First means...',
        options: ['Profit is the goal', 'Take your profit BEFORE paying expenses, then run the business on what remains', 'Charge more', 'Cut all costs'],
        correctIndex: 1,
        explanation: 'Revenue - Profit = Expenses. Not Revenue - Expenses = (hopefully) Profit.',
      ),
      QuizQuestion(
        question: 'A healthy business should review its cash flow...',
        options: ['Yearly at tax time', 'Every week — it is a non-negotiable ritual', 'Monthly', 'Only when worried'],
        correctIndex: 1,
        explanation: 'Weekly. 15 minutes. Every single week. Non-negotiable.',
      ),
      QuizQuestion(
        question: 'The "3-Month Runway Rule" means...',
        options: ['Plan 3 months ahead', 'Always have 3 months of operating expenses in reserve cash', 'Launch in 3 months', 'Quit in 3 months'],
        correctIndex: 1,
        explanation: '3 months of expenses in a separate account. Touch it only in emergencies.',
      ),
      QuizQuestion(
        question: 'Separating personal and business finances is important because...',
        options: ['The bank requires it', 'It gives clear visibility into business performance and makes taxes simple', 'It looks professional', 'It is free'],
        correctIndex: 1,
        explanation: 'Clarity. Taxes. Legitimacy. Open that account today.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Profit First Explained',
        speaker: 'Mike Michalowicz',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 10,
        whyWatch: 'The system that guarantees you pay yourself.',
      ),
      VideoResource(
        title: 'Accounting for Entrepreneurs',
        speaker: 'Accounting Stuff',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 14,
        whyWatch: 'P&L, balance sheet, cash flow — the language you need.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Weekly Cash Flow Ritual',
        content:
            'Every Sunday, 15 minutes. This single habit separates surviving businesses from dead ones. Here\'s the ritual: (1) Open your business account and note the current balance. (2) List every payment coming IN this week (invoices due, expected sales). (3) List every payment going OUT this week (rent, subscriptions, contractor payments). (4) Calculate: Balance + Inflows - Outflows = End-of-week cash. (5) If that number is negative or uncomfortably low, take action BEFORE the week starts — send invoices early, pause a subscription, delay a non-essential purchase. This ritual takes 15 minutes but prevents 90% of cash crises.',
      ),
      LessonSection(
        heading: 'The Profit First System (Detailed)',
        content:
            'Mike Michalowicz\'s system, made specific: Open 5 bank accounts (or sub-accounts): (1) INCOME — all revenue lands here first. (2) PROFIT (5-15%) — your reward. Don\'t touch it. (3) OWNER\'S PAY (50%) — your salary. (4) TAX (15%) — set aside for taxes. Never spend this. (5) OPERATING EXPENSES (30%) — everything else. Twice a month, on the 10th and 25th, transfer percentages from INCOME to the other 4 accounts. Start with small percentages and increase them quarterly. The forcing function: when expenses exceed the 30%, you must find ways to reduce them — not increase the allocation.',
      ),
      LessonSection(
        heading: 'The 3-Month Emergency Runway',
        content:
            'Before you spend a single rupee on marketing, tools, or "growth," build a 3-month cash runway: 3 months of your total operating expenses (including your own salary) sitting in a separate account you DO NOT touch unless the business faces a genuine emergency. This runway buys you the most valuable thing in entrepreneurship: time. Time to pivot, time to recover from a bad month, time to find your next big client. Without this runway, one slow month can kill an otherwise healthy business.',
      ),
      LessonSection(
        heading: 'The 5 Numbers Dashboard',
        content:
            'Track these 5 numbers weekly — write them on a sticky note on your monitor: (1) Cash in bank (not revenue — CASH). (2) Accounts receivable (money owed to you — chase it). (3) Monthly burn rate (total expenses ÷ 1 month). (4) Runway (Cash ÷ Monthly burn = months until zero). (5) Gross margin per sale (Revenue - Direct Cost per unit). If runway drops below 3 months, stop all non-essential spending immediately. If gross margin is below 50%, your pricing is wrong or your costs are too high. These 5 numbers are your cockpit instruments.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Open a separate bank account (or sub-account) for your business TODAY. Even if there\'s no money in it yet. Name it "Business Operating."',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Calculate your personal burn rate: add up every monthly expense (rent, food, subscriptions, transport). How many months of runway do you have in savings?',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Set up a simple spreadsheet with the 5 Numbers Dashboard. Fill it in with today\'s real numbers — even if most are zero.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'What is your current relationship with money and numbers? Do you avoid looking at your finances? What belief about money might be holding you back from building real wealth?',
    actionStep:
        'Do your first Weekly Cash Flow Ritual right now. Open your bank account, list what\'s coming in and going out this week, and write down the number. This 15-minute habit starts today.',
  ),

  // DAY 20 — Pitching
  DailyLesson(
    day: 20,
    title: 'Copywriting & The Art of Persuasion',
    theme: 'The #1 skill that turns words into money',
    category: 'action',
    quote:
        'The pen is mightier than the sword — and far more profitable.',
    quoteAuthor: 'Gary Halbert (adapted)',
    mindsetLesson:
        'Copywriting is the single most valuable skill any entrepreneur can learn. Every email you send, every ad you write, every landing page, every DM, every social media caption, every pitch deck, every product description — all of it is copywriting. Great copy turns strangers into customers. Bad copy turns customers into ghosts. Today you will learn the frameworks that professional copywriters use to generate millions in revenue — and you will practice them immediately.',
    skillName: 'Persuasive Communication',
    skillDescription:
        'The ability to write words that capture attention, build desire, and drive action — across emails, ads, landing pages, DMs, and every other medium.',
    xpReward: 100,
    chapterTitle: 'Chapter XX — The Pitch',
    weekTheme: 'The Execution',
    teaserQuote: 'Time is the most valuable thing a man can spend. — Theophrastus',
    teaserHook: "Time is the only asset you can't earn back. Tomorrow, you master it.",
    quiz: [
      QuizQuestion(
        question: 'The AIDA framework stands for...',
        options: ['Action, Interest, Desire, Attention', 'Attention, Interest, Desire, Action', 'Awareness, Insight, Decision, Agreement', 'Appeal, Intrigue, Deal, Acceptance'],
        correctIndex: 1,
        explanation: 'Attention → Interest → Desire → Action. The oldest and most reliable persuasion sequence.',
      ),
      QuizQuestion(
        question: 'The PAS formula works because it...',
        options: ['Is short', 'Names the Pain, Agitates it to make it urgent, then presents the Solution', 'Uses big words', 'Avoids selling'],
        correctIndex: 1,
        explanation: 'Pain → Agitate → Solve. People buy to escape pain faster than they buy to gain pleasure.',
      ),
      QuizQuestion(
        question: 'A great headline must...',
        options: ['Be clever', 'Make a specific promise to a specific person', 'Use all caps', 'Be long'],
        correctIndex: 1,
        explanation: 'Specific promise to a specific person. Cleverness without clarity is invisible.',
      ),
      QuizQuestion(
        question: 'The most powerful word in copywriting is...',
        options: ['Free', 'You', 'Amazing', 'Guaranteed'],
        correctIndex: 1,
        explanation: '"You" — because great copy is always about the reader, never about the writer.',
      ),
      QuizQuestion(
        question: 'Every piece of copy should end with...',
        options: ['A thank you', 'One clear call to action (CTA) telling the reader exactly what to do next', 'A signature', 'A disclaimer'],
        correctIndex: 1,
        explanation: 'One CTA. Not three. Not "learn more." One specific action: "Click here to start your free trial."',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Copywriting for Beginners',
        speaker: 'Alex Cattoni',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 12,
        whyWatch: 'The clearest intro to copywriting frameworks on YouTube.',
      ),
      VideoResource(
        title: 'How to Write Copy That Sells',
        speaker: 'Jim Edwards',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 13,
        whyWatch: 'Practical templates you can use today.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The AIDA Framework',
        content:
            'The most battle-tested persuasion structure in history: (1) ATTENTION — Stop the scroll. Use a bold headline, a surprising stat, or a provocative question. "97% of businesses fail because of this one mistake." (2) INTEREST — Hook them with relevance. "If you\'ve ever launched something and heard crickets, this is why." (3) DESIRE — Paint the transformation. "Imagine waking up to 10 new customer inquiries every morning — without running a single ad." (4) ACTION — Tell them exactly what to do. "Click here to download the free template." Use AIDA for emails, landing pages, social posts, ads, and pitch decks.',
      ),
      LessonSection(
        heading: 'The PAS Formula (Pain-Agitate-Solve)',
        content:
            'When you need to write fast and persuasively, use PAS: (1) PAIN — Name the exact problem. "You spend 3 hours every day on admin tasks that make zero money." (2) AGITATE — Make the pain worse. "That\'s 1,095 hours a year — 45 full days — spent on work that a ₹500/month tool could handle. Meanwhile your competitors are spending those hours closing deals." (3) SOLVE — Present your solution as the obvious answer. "Our automation toolkit handles all of it in 10 minutes/day. Here\'s what to do next." PAS works because people are 2x more motivated to avoid pain than to gain pleasure.',
      ),
      LessonSection(
        heading: 'Headlines: The 80/20 of Copy',
        content:
            '80% of people read the headline. Only 20% read the rest. Your headline IS the ad. Rules for headlines that convert: (1) Be SPECIFIC — "How I Made ₹47,000 in 30 Days" beats "How to Make Money." (2) Include a NUMBER — numbers create credibility and specificity. (3) Promise a BENEFIT — what will the reader GET? Not what will they learn, but what outcome will they achieve? (4) Create URGENCY — why should they read this NOW? (5) Use POWER WORDS — free, proven, secret, simple, fast, guaranteed, new. Test: read your headline and ask "Would I click on this?" If no, rewrite it.',
      ),
      LessonSection(
        heading: 'The CTA: Where Money Is Made',
        content:
            'A Call To Action must be: (1) SPECIFIC — "Download the free PDF now" not "Learn more." (2) URGENT — "Only 50 spots available" or "Offer ends Friday." (3) LOW-RISK — "Try free for 14 days, cancel anytime." (4) VISIBLE — one CTA per page/email. Never bury it. Never give 3 options. Common CTAs ranked by conversion: "Start my free trial" > "Get instant access" > "Download now" > "Sign up" > "Learn more." The difference between "Learn more" and "Start my free trial" can be a 300% conversion increase. Words matter. Every word.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write 3 different headlines for your product/service using the headline rules. Test them by asking 3 people: "Which one would make you click?"',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Write a complete PAS email for your product/service: 3 sentences of Pain, 2 sentences of Agitate, 3 sentences of Solve, 1 clear CTA.',
        type: 'creative',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Rewrite one existing piece of your copy (bio, social post, or product description) using the AIDA framework. Compare before and after.',
        type: 'skill',
        points: 25,
      ),
    ],
    reflectionPrompt:
        'Look at the last 5 emails or messages you sent to potential customers. How many had a clear, specific call to action? How many led with the customer\'s problem instead of your credentials?',
    actionStep:
        'Write your "Core Sales Email" using PAS + a strong CTA. Save it as a template. You will use this email hundreds of times — it is the single most valuable document in your business.',
  ),

  // DAY 21 — Networking
  DailyLesson(
    day: 21,
    title: 'Strategic Networking',
    theme: 'Building relationships that build your business',
    category: 'action',
    quote:
        'Your network is your net worth.',
    quoteAuthor: 'Porter Gale',
    mindsetLesson:
        'Many people think networking is about collecting business cards and sending LinkedIn requests. Real networking is about building genuine relationships with people who can help you — and whom you can help in return. The best networkers are not the most extroverted; they\'re the most genuinely curious about others. Today you\'ll learn to build a powerful network authentically.',
    skillName: 'Relationship Building',
    skillDescription:
        'The ability to initiate, nurture, and leverage professional relationships that create mutual value over time.',
    xpReward: 150,
    chapterTitle: 'Chapter XXI — The Master',
    weekTheme: 'The Execution',
    teaserQuote: "If you can't describe what you are doing as a process, you don't know what you're doing. — W. Edwards Deming",
    teaserHook: 'Automation is the gap between working IN your business and ON it. Tomorrow, you cross it.',
    quiz: [
      QuizQuestion(
        question: 'The 80/20 rule in time management says...',
        options: ['80% of results come from 20% of effort', 'Spend 80% of time on 20% of tasks', 'Work 80 hours, get 20% more', 'None of these'],
        correctIndex: 0,
        explanation: 'Vital few vs. trivial many. Find the vital few.',
      ),
      QuizQuestion(
        question: "'Deep work' is best described as...",
        options: ['Working long hours', 'Focused, undistracted work on hard problems', 'Multitasking', 'Email'],
        correctIndex: 1,
        explanation: 'Unbroken. Cognitively demanding. Rare. Valuable.',
      ),
      QuizQuestion(
        question: 'The biggest time leak for most entrepreneurs is...',
        options: ['Sleep', 'Meetings and shallow work', 'Reading', 'Family time'],
        correctIndex: 1,
        explanation: 'Calendar fragmentation. Reclaim mornings. Block focus.',
      ),
      QuizQuestion(
        question: 'An effective daily ritual typically includes...',
        options: ['Every possible task', 'A small set of non-negotiables', 'Long to-dos', 'Many meetings'],
        correctIndex: 1,
        explanation: 'Three non-negotiables per day. Three. Less is more.',
      ),
      QuizQuestion(
        question: "'Time blocking' works because...",
        options: ['It feels structured', 'It defends time before urgency steals it', 'It looks productive', 'It impresses others'],
        correctIndex: 1,
        explanation: 'Block first. Urgency second. The block wins.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Deep Work',
        speaker: 'Cal Newport',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 7,
        whyWatch: 'The author on focused, high-value work.',
      ),
      VideoResource(
        title: 'The 4-Hour Workweek Talk',
        speaker: 'Tim Ferriss',
        youtubeId: 'QoqohmccTSc',
        durationMinutes: 15,
        whyWatch: 'Batching, automation, and the 80/20 in action.',
      ),
    ],
    unlockBadge: 'business_builder',
    sections: [
      LessonSection(
        heading: 'Networking is Giving First',
        content:
            'The biggest networking mistake: approaching people with "What can you do for me?" The best approach: "What can I do for you?" Before asking for anything, find a way to give — share an article they\'d find interesting, make an introduction that benefits them, offer genuine praise for their work. Giving first creates a reciprocity dynamic and, more importantly, makes you memorable as someone who adds value, not extracts it.',
      ),
      LessonSection(
        heading: 'The Weak Tie Advantage',
        content:
            'Research by sociologist Mark Granovetter found that most job opportunities come from "weak ties" — acquaintances, not close friends. Close friends know the same people and opportunities you do. Weak ties move in different circles and have access to opportunities you\'d never hear about otherwise. This means: don\'t just network within your industry. Build relationships across industries, at conferences, in online communities, anywhere interesting people gather.',
      ),
      LessonSection(
        heading: 'The Follow-Up Formula',
        content:
            'Meeting someone is worthless without follow-up. The 24-hour rule: within 24 hours of meeting someone, send a personalized follow-up. Reference something specific you discussed. Offer something of value (an article, a connection, a thought). Suggest a next step if appropriate ("Would you be open to a 15-minute call next week?"). Most people never follow up — doing so consistently puts you in the top 1% of networkers.',
      ),
      LessonSection(
        heading: 'Building Your Personal Board of Advisors',
        content:
            'Every entrepreneur needs a "personal board" — 3-5 experienced people who care about your success and will give you honest feedback. These are not formal relationships; they\'re mentors, experienced friends, or industry veterans you\'ve built genuine relationships with. Cultivate these relationships intentionally. Meet with each quarterly. Share your challenges openly. Ask for specific advice. Thank them genuinely and keep them updated on your progress.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Reach out to one person in your network today with a genuine offer of help — no ask attached.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Identify 3 people you\'d want on your "personal board of advisors." What value could you offer THEM first?',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Attend or join one networking event or online community today (virtual event, LinkedIn group, Twitter/X space, local meetup).',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'Think about the 5 most valuable professional relationships in your life. How did they start? What made them deepen? How can you replicate that pattern?',
    actionStep:
        'Create a "Relationship Tracker" — a simple list of key professional relationships with notes on: last contact date, what they care about, how you can help them, and when to reach out next.',
  ),

  // ============================================================
  // WEEK 4: SCALING & MASTERY (Days 22-28)
  // ============================================================

  // DAY 22 — Automation
  DailyLesson(
    day: 22,
    title: 'Automate to Scale',
    theme: 'Using technology to multiply your impact',
    category: 'monetization',
    quote:
        'The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency.',
    quoteAuthor: 'Bill Gates',
    mindsetLesson:
        'Automation is the entrepreneur\'s force multiplier. It allows one person to do the work of ten, frees your mind from repetitive tasks, and ensures consistency as you scale. Today you\'ll learn to identify automation opportunities and implement them using accessible tools — no coding required.',
    skillName: 'Automation Engineering',
    skillDescription:
        'The ability to identify repetitive tasks and implement technological solutions that execute them reliably without human intervention.',
    xpReward: 100,
    chapterTitle: 'Chapter XXII — The Automator',
    weekTheme: 'The Mastery',
    teaserQuote: 'Culture eats strategy for breakfast. — Peter Drucker',
    teaserHook: "A team is not a group of people. It's a culture with skin on. Tomorrow, you build the culture.",
    quiz: [
      QuizQuestion(
        question: 'Automation is best applied to...',
        options: ['Things you love doing', 'Things you do repeatedly and predictably', 'Creative work', 'Strategy'],
        correctIndex: 1,
        explanation: 'Repetition + predictability = automation. Always that.',
      ),
      QuizQuestion(
        question: 'The first process to automate is usually...',
        options: ['The most complex', 'The most frequent, low-judgment one', 'Customer support', 'Hiring'],
        correctIndex: 1,
        explanation: 'Frequency first. Judgment last. Always.',
      ),
      QuizQuestion(
        question: "Automation's biggest hidden risk is...",
        options: ['Cost', 'Removing yourself from learning what the process really is', 'Slowness', 'Bugs'],
        correctIndex: 1,
        explanation: 'Automate too early and you freeze in your own ignorance.',
      ),
      QuizQuestion(
        question: 'Good automation tools include...',
        options: ['Only AI', 'Zapier, n8n, native integrations, custom code', 'Just spreadsheets', 'Only email'],
        correctIndex: 1,
        explanation: "Use the lightest tool that solves the job. Don't over-engineer.",
      ),
      QuizQuestion(
        question: "'Automated revenue' is the result of...",
        options: ['Marketing', 'Systems that turn attention into customers without your involvement', 'Sales', 'Pricing'],
        correctIndex: 1,
        explanation: 'Funnels, nurture, fulfillment — the full system runs without you.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Automate Your Business',
        speaker: 'Nick Loper',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 9,
        whyWatch: "A founder's primer on what to automate first.",
      ),
      VideoResource(
        title: 'Zapier and the No-Code Revolution',
        speaker: 'Zapier',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 6,
        whyWatch: 'Practical tools to remove yourself from operations.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Automation Audit',
        content:
            'For one week, track every task you do. For each, ask: (1) Is this repetitive? (2) Does it follow clear rules? (3) Does it happen at least weekly? If yes to all three, it\'s an automation candidate. Common candidates: email responses, social media posting, invoice generation, data entry, appointment scheduling, lead follow-ups, report generation.',
      ),
      LessonSection(
        heading: 'The Automation Stack',
        content:
            'Build your automation stack with these tools: Zapier or Make (connect apps and automate workflows), Calendly (automated scheduling), Mailchimp/ConvertKit (automated email sequences), Hootsuite/Buffer (automated social posting), QuickBooks/Wave (automated invoicing and accounting), ChatGPT/Claude API (automated content drafting and customer support). Most have free tiers sufficient for early-stage businesses.',
      ),
      LessonSection(
        heading: 'The 80/20 of Automation',
        content:
            'Don\'t try to automate everything. Focus on the 20% of tasks that consume 80% of your repetitive time. For most entrepreneurs, these are: email management, scheduling, social media posting, invoicing, and lead follow-up. Automating just these five categories can reclaim 10-20 hours per week.',
      ),
      LessonSection(
        heading: 'The Human Touch Rule',
        content:
            'Automate processes, not relationships. Never automate: first contact with a new relationship, apology or complaint handling, personalized thank-yous, or anything where the recipient would feel devalued if they knew it was automated. The rule: if a human would feel insulted to learn a bot did it, don\'t automate it.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Do an Automation Audit: track every task you do today. Identify at least 3 automation candidates.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Set up one automation today using a free tool (e.g., auto-responder for a common email, scheduled social post, or Zapier workflow).',
        type: 'action',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Map out your ideal "Automation Stack" — which tools would handle which parts of your business?',
        type: 'creative',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'How many hours per week do you spend on tasks that could be automated? If you reclaimed those hours, what high-leverage work would you do instead?',
    actionStep:
        'Pick ONE repetitive task you do at least weekly. Research one tool that could automate it. Implement it this week.',
  ),

  // DAY 23 — Team Building
  DailyLesson(
    day: 23,
    title: 'Building Your A-Team',
    theme: 'Hiring, inspiring, and retaining great people',
    category: 'monetization',
    quote:
        'A players hire A players. B players hire C players.',
    quoteAuthor: 'Steve Jobs',
    mindsetLesson:
        'You can\'t build a significant business alone. At some point, you need a team. But hiring is terrifying for many entrepreneurs — it costs money, it requires trust, and bad hires are painful. Today you\'ll learn the principles of building a great team, starting from your very first hire.',
    skillName: 'Team Leadership',
    skillDescription:
        'The ability to attract, select, develop, and lead talented people who collectively achieve more than any individual could.',
    xpReward: 100,
    chapterTitle: 'Chapter XXIII — The Cultivator',
    weekTheme: 'The Mastery',
    teaserQuote: "A brand is what people say about you when you're not in the room. — Jeff Bezos",
    teaserHook: "A brand is not a logo. It's a promise kept a thousand times. Tomorrow, you make yours unforgettable.",
    quiz: [
      QuizQuestion(
        question: "A 'high-performance team' is best defined by...",
        options: ['Stars in every seat', 'Trust, clarity, and shared standards', 'Long hours', 'Big salaries'],
        correctIndex: 1,
        explanation: 'Three things. The rest follows.',
      ),
      QuizQuestion(
        question: "Hiring's biggest variable is...",
        options: ['Resume', 'Trajectory and judgment', 'School', 'Years of experience'],
        correctIndex: 1,
        explanation: "Where they've been going, and how they think. Both beat pedigree.",
      ),
      QuizQuestion(
        question: 'The first job of a new manager is to...',
        options: ['Set policies', "Define what 'great' looks like in every role", 'Hold 1:1s', 'Restructure'],
        correctIndex: 1,
        explanation: 'Define the bar. Then recruit to it. Then develop toward it.',
      ),
      QuizQuestion(
        question: 'Culture is best thought of as...',
        options: ['Perks', 'What people do when no one is watching', 'Office design', 'Mission statement'],
        correctIndex: 1,
        explanation: "Behavior under no observation. That's the actual culture.",
      ),
      QuizQuestion(
        question: 'The most common team failure is...',
        options: ['Lack of talent', 'Lack of clarity about outcomes', 'Low pay', 'Bad tools'],
        correctIndex: 1,
        explanation: 'Clarity is the cheapest performance multiplier in existence.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'What Makes a Great Team',
        speaker: 'Will Larson',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 9,
        whyWatch: 'Lessons from a Silicon Valley engineering VP.',
      ),
      VideoResource(
        title: 'Culture Is the Operating System',
        speaker: 'Hubert Joly',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 12,
        whyWatch: 'Why culture beats strategy every time.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Hire for Trajectory, Not Just Resume',
        content:
            'The best hires are not always the most experienced — they\'re the ones with the steepest growth trajectory. Look for: (1) Rate of learning — how fast do they pick up new skills? (2) Initiative — do they solve problems before being asked? (3) Values alignment — do they care about the same things you care about? Past experience matters, but trajectory matters more. A hungry learner with 1 year of experience often outperforms a comfortable veteran with 10.',
      ),
      LessonSection(
        heading: 'The First Hire Decision',
        content:
            'Your first hire should free you from your biggest time drain. Not necessarily the hardest task — the task that consumes the MOST hours. For most entrepreneurs, this is administrative work (scheduling, email, data entry) or a specific delivery task that doesn\'t require your unique expertise. Hire a virtual assistant (VA) before hiring a specialist. A great VA at \$15-25/hour can reclaim 20+ hours of your week.',
      ),
      LessonSection(
        heading: 'Culture is What You Tolerate',
        content:
            'Company culture is not the values on your wall — it\'s the behaviors you tolerate. If you tolerate lateness, your culture is "deadlines are suggestions." If you tolerate blaming customers, your culture is "customers are the enemy." Define 3-5 non-negotiable values. Model them relentlessly. Address violations immediately and privately. What you walk past, you endorse.',
      ),
      LessonSection(
        heading: 'The Feedback Rhythm',
        content:
            'Great teams run on clear, consistent feedback. Implement: (1) Weekly 1:1s — 30 minutes, structured: what went well, what\'s stuck, what\'s next. (2) Monthly reviews — look at metrics, goals, and development. (3) Quarterly deep-dives — bigger picture: are they in the right role? What skills are they building? What\'s their next growth step? Feedback is not criticism — it\'s the information people need to succeed.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write a job description for your first ideal hire. Be specific about tasks, not just qualifications.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Define your 3-5 non-negotiable values for your future team. For each, write one sentence about what "living this value" looks like.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Practice giving constructive feedback today — to a colleague, friend, or family member. Use the SBI model: Situation, Behavior, Impact.',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'What kind of leader would YOU want to work for? Are you becoming that kind of leader? What\'s the gap?',
    actionStep:
        'Write your "Leadership Philosophy" in 3 bullet points. Example: "1. I hire people smarter than me and get out of their way. 2. I give clear expectations and honest feedback. 3. I celebrate wins publicly and address problems privately."',
  ),

  // DAY 24 — Brand Building
  DailyLesson(
    day: 24,
    title: 'Personal Brand & Online Presence',
    theme: 'Building an audience from zero — the modern entrepreneur\'s moat',
    category: 'monetization',
    quote:
        'A brand is no longer what we tell the consumer it is — it is what consumers tell each other it is.',
    quoteAuthor: 'Scott Cook',
    mindsetLesson:
        'In 2024+, your personal brand IS your business. Before anyone buys your product, they Google you. Before they hire your agency, they check your LinkedIn. Before they trust your advice, they see your Twitter/X. Your online presence is your resume, your portfolio, your trust signal, and your distribution channel — all at once. Today you\'ll learn the specific, tactical systems for building a personal brand from zero followers to a monetizable audience.',
    skillName: 'Brand Strategy',
    skillDescription:
        'The ability to build, grow, and monetize a personal brand through consistent content creation, platform strategy, and audience engagement — from zero to a following that trusts and buys from you.',
    xpReward: 100,
    chapterTitle: 'Chapter XXIV — The Brand',
    weekTheme: 'The Mastery',
    teaserQuote: 'In God we trust. All others must bring data. — W. Edwards Deming',
    teaserHook: "Data is not a report. It's a compass. Tomorrow, you learn to read the terrain.",
    quiz: [
      QuizQuestion(
        question: 'The #1 purpose of a personal brand is...',
        options: ['Fame', 'Trust — people buy from people they trust', 'Followers', 'Vanity'],
        correctIndex: 1,
        explanation: 'Trust is the currency. Followers are the scoreboard. Trust comes first.',
      ),
      QuizQuestion(
        question: 'Content pillars are...',
        options: ['Types of posts', '3-5 core topics you ALWAYS post about so your audience knows what to expect from you', 'Popular hashtags', 'Trends to follow'],
        correctIndex: 1,
        explanation: 'Pillars = predictability. Predictability = trust. Trust = sales.',
      ),
      QuizQuestion(
        question: 'The best posting frequency for a new creator is...',
        options: ['Once a month', 'Daily or near-daily — consistency beats quality at first', 'Only when inspired', 'Twice a year'],
        correctIndex: 1,
        explanation: 'Volume first. Refinement second. You can\'t optimize what doesn\'t exist.',
      ),
      QuizQuestion(
        question: 'The "1000 True Fans" concept means...',
        options: ['Get 1000 followers', 'You only need 1000 people who trust you enough to buy everything you make', 'Post 1000 times', 'Follow 1000 people'],
        correctIndex: 1,
        explanation: '1000 people × ₹8,000/year each = ₹80 lakh/year. That\'s a great business.',
      ),
      QuizQuestion(
        question: 'The fastest way to grow from 0 to 1000 followers is...',
        options: ['Paid ads', 'Consistently posting valuable content and engaging genuinely in communities where your audience already hangs out', 'Buying followers', 'Going viral once'],
        correctIndex: 1,
        explanation: 'Show up where they already are. Add value. Do it daily. Growth follows.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Building a Brand That Lasts',
        speaker: 'Emily Heyward',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 11,
        whyWatch: 'How to design a brand people remember.',
      ),
      VideoResource(
        title: 'Personal Branding for Founders',
        speaker: 'Dorie Clark',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 9,
        whyWatch: 'Your story is your most under-priced asset.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Content Pillar System',
        content:
            'Pick 3-5 topics you will ALWAYS post about. These are your content pillars. Example for an entrepreneur: (1) Lessons from building my business (behind-the-scenes). (2) Actionable tips in my niche (teach what you know). (3) Personal stories that shaped my worldview (vulnerability builds connection). (4) Book/podcast takeaways (curate knowledge for your audience). (5) Hot takes on industry trends (opinions build identity). Every post should fit one pillar. If it doesn\'t fit, don\'t post it. Pillars make you KNOWN FOR something — and being known for something is the foundation of monetization.',
      ),
      LessonSection(
        heading: 'The 30-Day Audience Growth Playbook',
        content:
            'From 0 to your first 1000 followers: Days 1-7: Post daily. Focus on quality hooks (first line must stop the scroll). Engage with 20 accounts in your niche daily — leave thoughtful comments, not "great post!" Days 8-14: Find 3 creators bigger than you and add genuine value in their comments. Their audience discovers you. Days 15-21: DM 5 people per day who engage with your content. Build real relationships. Offer to collaborate. Days 22-30: Create one "pillar piece" — a thread, carousel, or long post that synthesizes your best thinking. This becomes your signature piece that people share. The math: 20 daily engagements × 30 days = 600 touchpoints. Even a 5% follow rate = 30 new followers/day = 900 in 30 days.',
      ),
      LessonSection(
        heading: 'Platform Selection Strategy',
        content:
            'Don\'t be everywhere. Pick ONE primary platform and dominate it: LinkedIn — if you sell to businesses (B2B), professionals, or corporate clients. Twitter/X — if you sell knowledge, courses, or digital products. Instagram — if your business is visual (design, food, fashion, fitness, travel). YouTube — if you can teach on camera (long-term SEO play; videos compound). Start with ONE. Build to 1000 engaged followers. Only then add a second platform by repurposing your best-performing content. Repurposing > creating new. A great LinkedIn post becomes a Twitter thread, an Instagram carousel, a YouTube Short, and a newsletter.',
      ),
      LessonSection(
        heading: 'The Monetization Ladder',
        content:
            'Your audience monetization follows a ladder: (1) 0-500 followers: You monetize through direct outreach. Your content builds credibility. Leads come from DMs. (2) 500-2,000: You can sell a low-ticket digital product (₹500-2,000 ebook/template). (3) 2,000-10,000: You can launch a course, community, or coaching program (₹5,000-25,000). (4) 10,000+: Sponsorships, high-ticket offers, and speaking gigs become possible. Key insight: you don\'t need a huge audience to make money. 500 followers who trust you > 50,000 who scroll past you. Depth of relationship > breadth of reach.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Define your 3-5 content pillars. Write one sentence per pillar explaining what you\'ll post about and why your audience cares.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Post ONE piece of content today on your chosen platform. Use a hook in the first line. Don\'t overthink it — publish is better than perfect.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Engage with 20 accounts in your niche: leave thoughtful, value-adding comments (not "nice post!"). Track which ones respond.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'If someone Googled your name right now, what would they find? Does it represent the entrepreneur you want to become? What\'s the gap between your current online presence and your ideal one?',
    actionStep:
        'Choose your ONE primary platform. Update your bio with your value statement from Day 9. Post your first piece of content today. The clock starts now.',
  ),

  // DAY 25 — Data-Driven Decisions
  DailyLesson(
    day: 25,
    title: 'Data-Driven Entrepreneurship',
    theme: 'Using numbers instead of gut feelings',
    category: 'monetization',
    quote:
        'In God we trust. All others must bring data.',
    quoteAuthor: 'W. Edwards Deming',
    mindsetLesson:
        'Intuition is valuable, but intuition alone is unreliable. The best entrepreneurs combine intuition with data — using numbers to validate gut feelings, spot problems before they become crises, and identify opportunities that intuition would miss. Today you\'ll learn to build a data-driven decision-making habit without becoming a data scientist.',
    skillName: 'Analytical Thinking',
    skillDescription:
        'The ability to collect, interpret, and act on quantitative data to make better business decisions.',
    xpReward: 100,
    chapterTitle: 'Chapter XXV — The Cartographer',
    weekTheme: 'The Mastery',
    teaserQuote: 'Never depend on a single income. Make an investment. — Mark Twain',
    teaserHook: 'One stream is a job. Multiple streams is a business. Tomorrow, you diversify the river.',
    quiz: [
      QuizQuestion(
        question: "'One metric that matters' (OMTM) is the discipline of...",
        options: ['Tracking everything', 'Picking the single number that captures progress', 'Ignoring data', 'Choosing vanity metrics'],
        correctIndex: 1,
        explanation: 'One number, at a time, sharpens the entire team.',
      ),
      QuizQuestion(
        question: "A 'vanity metric' is...",
        options: ['Important', "A number that feels good but doesn't drive decisions", 'A forecast', 'Revenue'],
        correctIndex: 1,
        explanation: 'Likes, signups, downloads. Look great. Decide nothing.',
      ),
      QuizQuestion(
        question: 'Cohort analysis is most useful for...',
        options: ['Total counts', 'Behavior of a group over time', 'Marketing', 'SEO'],
        correctIndex: 1,
        explanation: 'Groups, over time, reveal truth. Total counts hide it.',
      ),
      QuizQuestion(
        question: 'A/B tests are best when they...',
        options: ['Are huge in scope', 'Test one variable, decisively', 'Run forever', 'Are qualitative'],
        correctIndex: 1,
        explanation: 'One variable. Decisive sample. Clear winner. Repeat.',
      ),
      QuizQuestion(
        question: 'Data without action is...',
        options: ['Useful', 'A report', 'Expensive theater', 'A moat'],
        correctIndex: 2,
        explanation: "If it doesn't change a decision, it didn't earn its keep.",
      ),
    ],
    videos: [
      VideoResource(
        title: 'How to Make Better Decisions with Data',
        speaker: "Cathy O'Neil",
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 10,
        whyWatch: 'The Weapons of Math Destruction author on signal vs. noise.',
      ),
      VideoResource(
        title: 'Lean Analytics',
        speaker: 'Alistair Croll',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 13,
        whyWatch: 'A framework for picking the one metric that matters.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The One Metric That Matters (OMTM)',
        content:
            'At any given stage of your business, there is ONE metric that matters most. For a brand-new business: "Are people signing up?" (conversion rate). For a growing business: "Are they sticking around?" (retention/churn). For a scaling business: "What\'s it cost to get a customer vs. what they\'re worth?" (LTV:CAC). Identify your OMTM. Track it obsessively. Ignore vanity metrics (total followers, total downloads) that feel good but don\'t drive decisions.',
      ),
      LessonSection(
        heading: 'Leading vs. Lagging Indicators',
        content:
            'Lagging indicators tell you what happened (revenue last month, customers lost). Leading indicators predict what will happen (proposals sent this week, new leads generated, customer satisfaction scores). Most entrepreneurs only track lagging indicators — which is like driving by looking only in the rearview mirror. Build a dashboard that includes leading indicators so you can steer proactively.',
      ),
      LessonSection(
        heading: 'The Weekly Metrics Review',
        content:
            'Set a 30-minute recurring appointment every Monday morning: your Weekly Metrics Review. Review 5-7 key numbers. Compare to last week and to your targets. Ask: "What story do these numbers tell? What should I do differently this week based on this data?" This single habit, maintained consistently, will put you ahead of 90% of small business owners who never look at their numbers.',
      ),
      LessonSection(
        heading: 'Data-Informed, Not Data-Enslaved',
        content:
            'Data tells you WHAT is happening. It rarely tells you WHY. For the why, you need qualitative input: customer conversations, team observations, your own intuition. Use data to ASK better questions, not to dictate answers. When data and intuition conflict, investigate — don\'t automatically trust either. The best decisions come from the dialogue between numbers and human insight.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Identify your OMTM (One Metric That Matters) for your current stage. Define exactly how you\'ll measure it.',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Create a simple "Weekly Metrics Dashboard" — a spreadsheet or doc with 5-7 key numbers you\'ll track every Monday.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Find one "vanity metric" you\'ve been paying attention to (followers, likes, downloads) and replace your focus with a metric that actually drives decisions.',
        type: 'thought',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'What decisions have you made in the past month based purely on gut feeling? Which of those could have benefited from even a small amount of data?',
    actionStep:
        'Schedule your first Weekly Metrics Review for next Monday morning. Set a recurring calendar event. Even if most numbers are \$0, start the habit.',
  ),

  // DAY 26 — Multiple Income Streams
  DailyLesson(
    day: 26,
    title: 'Monetization Models Masterclass',
    theme: 'The exact business models that make money — and how to start each one this week',
    category: 'monetization',
    quote:
        'Never depend on a single income. Make investments to create a second source.',
    quoteAuthor: 'Warren Buffett',
    mindsetLesson:
        'Most aspiring entrepreneurs fail not because they lack skills, but because they don\'t know WHICH business model to use. Today is the most tactical day of the entire codex. You will learn 6 proven monetization models, see the exact steps to launch each one, and understand which model fits YOUR skills and situation. By tonight, you will know exactly which model to start with and have the first 3 steps written down.',
    skillName: 'Revenue Diversification',
    skillDescription:
        'The ability to choose, launch, and grow the right monetization model for your skills and market — from freelancing to digital products to scalable businesses.',
    xpReward: 100,
    chapterTitle: 'Chapter XXVI — The Stream',
    weekTheme: 'The Mastery',
    teaserQuote: 'A leader is one who knows the way, goes the way, and shows the way. — John C. Maxwell',
    teaserHook: "Leadership is not a title. It's a discipline. Tomorrow, you step into the version of you that others follow.",
    quiz: [
      QuizQuestion(
        question: 'The fastest path to your first ₹10,000 online is usually...',
        options: ['Building a SaaS', 'Freelancing or consulting — selling a skill you already have', 'Creating a course', 'Dropshipping'],
        correctIndex: 1,
        explanation: 'Freelancing requires zero startup capital and leverages existing skills. Start there.',
      ),
      QuizQuestion(
        question: 'A digital product is powerful because...',
        options: ['It is trendy', 'You create it once and sell it infinitely with near-zero marginal cost', 'It is easy', 'Everyone buys digital'],
        correctIndex: 1,
        explanation: 'Build once. Sell forever. That is the digital product equation.',
      ),
      QuizQuestion(
        question: 'The "productized service" model works by...',
        options: ['Discounting your service', 'Packaging your service as a fixed-scope, fixed-price product that can be delivered systematically', 'Hiring more people', 'Automating everything'],
        correctIndex: 1,
        explanation: 'Fixed scope + fixed price + documented process = scalable service. That is productization.',
      ),
      QuizQuestion(
        question: 'Before launching multiple income streams, you should...',
        options: ['Start all at once for safety', 'Get ONE stream to consistent revenue first, then add others', 'Wait for the perfect idea', 'Build a team'],
        correctIndex: 1,
        explanation: 'One stream. Consistent revenue. Then diversify. Premature diversification kills focus.',
      ),
      QuizQuestion(
        question: 'The best business model for a beginner with no audience is...',
        options: ['Course creation', 'Service-based (freelancing, consulting, agency) — because it requires zero audience', 'SaaS', 'Affiliate marketing'],
        correctIndex: 1,
        explanation: 'Services need clients, not audiences. You find clients through outreach, not content.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Millionaire Fastlane',
        speaker: 'MJ DeMarco',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 14,
        whyWatch: 'Why the slow lane is a lie.',
      ),
      VideoResource(
        title: 'Building Multiple Income Streams',
        speaker: 'Pat Flynn',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 12,
        whyWatch: 'Practical diversification playbook.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'Model 1: Freelancing (Start This Week)',
        content:
            'The fastest path to entrepreneurial income. Steps: (1) Pick ONE skill you already have (writing, design, coding, video editing, social media, data analysis, tutoring). (2) Create a profile on Upwork, Fiverr, or Freelancer. (3) Set your rate at 70% of market rate to win your first 3 clients. (4) Deliver exceptional work. Get 5-star reviews. (5) Raise your rate by 20% after every 5 clients. Timeline: First client in 1-2 weeks. ₹10,000-50,000/month within 2-3 months. The exit: freelancing teaches you what businesses actually need. Use that knowledge to build Model 2 or Model 3.',
      ),
      LessonSection(
        heading: 'Model 2: Digital Products (₹0 Startup Cost)',
        content:
            'Create once, sell forever. Best digital products for beginners: (1) Templates (Notion, Canva, spreadsheets) — ₹200-2,000 each. Sell on Gumroad. (2) Ebooks/guides — ₹500-5,000 each. Solve one specific problem in 20-50 pages. (3) Mini-courses — ₹2,000-10,000. Teach what you know in 5-10 video lessons. Steps to launch: Pick a problem your audience has → Create a solution in 1-2 weeks → Set up a Gumroad page (free) → Use your Day 20 copywriting skills to write the sales page → Drive traffic through Day 24 content strategy. Target: ₹10,000-1,00,000/month with 3-5 products.',
      ),
      LessonSection(
        heading: 'Model 3: Productized Agency (Scalable Services)',
        content:
            'The bridge between freelancing and a real business. How it works: (1) Take the service you freelance → package it as a fixed-scope, fixed-price offer. Example: "5 social media posts per week for ₹25,000/month." (2) Document your process into an SOP (Day 17). (3) Hire a junior freelancer to do the delivery at 30-40% of what you charge. (4) You manage the client relationship and quality control. (5) Add more clients. Scale by hiring more delivery people. Revenue math: 5 clients × ₹25,000/month = ₹1,25,000/month. Delivery cost: ₹50,000. Your profit: ₹75,000/month — working 10-15 hours/week on management.',
      ),
      LessonSection(
        heading: 'Model 4-6: Advanced Models (Build Toward These)',
        content:
            'After mastering Models 1-3, level up: Model 4 — Coaching/Consulting (₹5,000-50,000/session): Package your expertise as 1-on-1 or group coaching. Requires: proven results + testimonials. Model 5 — SaaS/App (recurring revenue): Build software that solves a problem. Requires: technical skills or a technical co-founder + validated demand. Model 6 — Content Monetization (audience-based): Build an audience → monetize through sponsorships, premium content, and community. Requires: 5,000+ engaged followers. The progression: Freelancing → Digital Products → Agency → Coaching → SaaS → Content Empire. Each step builds on the last.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Choose your FIRST monetization model from the 6 options. Write down: (1) Which model. (2) What specific skill/service/product. (3) Who your first 5 customers will be. (4) Your price.',
        type: 'creative',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Take the FIRST action on your chosen model TODAY. If freelancing: create your profile. If digital products: outline your first product. If agency: write your offer.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Calculate: how many clients/sales at what price would you need to replace your current income? Write the specific math.',
        type: 'thought',
        points: 25,
      ),
    ],
    reflectionPrompt:
        'If your primary income source disappeared overnight, which of the 6 models could you launch FASTEST? What skills do you already have that are monetizable right now?',
    actionStep:
        'Write your "First Revenue Plan": Model chosen, specific offer, price, and the first 3 steps to get your first paying customer within 14 days. Post this plan somewhere visible.',
  ),

  // DAY 27 — Scale Mindset
  DailyLesson(
    day: 27,
    title: 'Thinking at Scale',
    theme: 'Expanding from solo to enterprise mindset',
    category: 'monetization',
    quote:
        'If your business depends on you, you don\'t have a business — you have a job.',
    quoteAuthor: 'Michael Gerber',
    mindsetLesson:
        'There\'s a fundamental difference between a job (you do the work, you get paid) and a business (systems and people do the work, you own the enterprise). Scaling is the process of crossing that chasm. It requires a different way of thinking — from "I am the business" to "I am the architect of the business." Today you\'ll learn to adopt the scale mindset.',
    skillName: 'Scale Thinking',
    skillDescription:
        'The ability to design business models, systems, and teams that can grow revenue without proportional growth in your personal time.',
    xpReward: 100,
    chapterTitle: 'Chapter XXVII — The Leader',
    weekTheme: 'The Mastery',
    teaserQuote: 'Wealth consists not in having great possessions, but in having few wants. — Epictetus',
    teaserHook: 'Legacy is built in the choices nobody sees. Tomorrow, you design yours.',
    quiz: [
      QuizQuestion(
        question: 'Leadership is best defined as...',
        options: ['A title', 'The discipline of producing outcomes through others', 'Charisma', 'Authority'],
        correctIndex: 1,
        explanation: 'Title is a noun. Leadership is a verb.',
      ),
      QuizQuestion(
        question: 'The first job of a leader is to...',
        options: ['Hire well', 'Set the direction and the bar', 'Run meetings', 'Be popular'],
        correctIndex: 1,
        explanation: 'Direction. Standard. Both before any of the rest.',
      ),
      QuizQuestion(
        question: "'Servant leadership' is the practice of...",
        options: ['Being subservient', 'Removing obstacles for the team to do their best work', 'Avoiding decisions', 'Following polls'],
        correctIndex: 1,
        explanation: 'Your job is to make the team look great. The rest follows.',
      ),
      QuizQuestion(
        question: 'The most difficult leadership moment is...',
        options: ['Firing someone', "Saying no to a good idea that doesn't fit", 'Hiring', 'Public speaking'],
        correctIndex: 1,
        explanation: "Saying no to good ideas that don't fit. That is the real test.",
      ),
      QuizQuestion(
        question: 'Trust is built primarily through...',
        options: ['Words', 'Repeated small behaviors', 'Charisma', 'Tenure'],
        correctIndex: 1,
        explanation: 'Trust is a thousand small deposits. Spend it carefully.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Lead with Vision',
        speaker: 'Dustin Garis',
        youtubeId: '3AkjzDHuWKM',
        durationMinutes: 8,
        whyWatch: 'The leadership styles that scale.',
      ),
      VideoResource(
        title: 'The 7 Habits of Highly Effective People',
        speaker: 'Stephen Covey',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 19,
        whyWatch: 'The timeless primer on principled leadership.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The E-Myth Insight',
        content:
            'Michael Gerber\'s "The E-Myth" explains why most small businesses fail: the owner works IN the business (as the technician doing the work) instead of ON the business (as the entrepreneur designing the system). The solution: build your business as if you were going to franchise it — even if you never plan to. Document every process so clearly that someone with reasonable intelligence could follow it and produce consistent results.',
      ),
      LessonSection(
        heading: 'The 3 Roles You Must Play',
        content:
            'As an entrepreneur, you wear three hats: (1) Technician — does the actual work (builds product, serves clients). (2) Manager — ensures work gets done reliably (plans, organizes, solves problems). (3) Entrepreneur — envisions the future and designs the system (strategy, innovation, culture). Most founders spend 80%+ as Technician. To scale, you must progressively shift time toward Manager and Entrepreneur roles.',
      ),
      LessonSection(
        heading: 'The Leverage Ladder',
        content:
            'How to scale your impact: Level 1: You do the work (1:1 leverage — one hour of your time = one hour of output). Level 2: You teach others to do the work (1:N leverage — one hour of your training = many hours of their output). Level 3: You build a system that does the work (1:∞ leverage — one hour of system design = unlimited output). Level 4: You build a brand that attracts work to you (pull leverage — opportunities come to you). Each level up the ladder multiplies your impact exponentially.',
      ),
      LessonSection(
        heading: 'The Exit Mindset (Even If You Never Exit)',
        content:
            'Build your business as if you plan to sell it one day — even if you never will. This forces you to: (1) Document everything (a buyer needs to see how it works). (2) Make yourself replaceable (a buyer won\'t buy a business that depends entirely on you). (3) Build recurring, predictable revenue (a buyer values certainty). (4) Create a strong brand independent of your personality. These same actions make the business more valuable, more enjoyable to run, and more scalable — regardless of whether you ever sell.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Track your time for one full day. Categorize each hour as Technician, Manager, or Entrepreneur work. What\'s the ratio?',
        type: 'thought',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Document one core process in your business as if you were creating a franchise operations manual.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Identify one task you currently do as Technician that could be moved to someone else (or automated) within 30 days.',
        type: 'action',
        points: 35,
      ),
    ],
    reflectionPrompt:
        'If you took a 3-month vacation with no phone or email, would your business survive? If not, what specifically would break first?',
    actionStep:
        'Schedule a weekly "ON the business" time block — minimum 2 hours where you work as Entrepreneur, not Technician. Protect this time ruthlessly.',
  ),

  // DAY 28 — Leadership
  DailyLesson(
    day: 28,
    title: 'Entrepreneurial Leadership',
    theme: 'Becoming the leader your vision requires',
    category: 'monetization',
    quote:
        'Leadership is not about being in charge. It is about taking care of those in your charge.',
    quoteAuthor: 'Simon Sinek',
    mindsetLesson:
        'As your business grows, your role shifts from "doer" to "leader." This is a difficult transition for many entrepreneurs because the skills that made you successful as a doer (individual execution, personal expertise) are different from the skills that make you successful as a leader (inspiring others, making tough decisions, building culture). Today you\'ll learn the foundations of entrepreneurial leadership.',
    skillName: 'Leadership',
    skillDescription:
        'The ability to create a compelling vision, align people around it, and inspire them to achieve more than they thought possible.',
    xpReward: 150,
    chapterTitle: 'Chapter XXVIII — The Architect of Legacy',
    weekTheme: 'The Mastery',
    teaserQuote: 'The whole is greater than the sum of its parts. — Aristotle',
    teaserHook: "You've collected 28 chapters. Tomorrow, you tie them into one operating system.",
    quiz: [
      QuizQuestion(
        question: "Designing a 'legacy' is most useful when done...",
        options: ['At the end of life', 'Now, before habits calcify', 'Once a decade', 'Never'],
        correctIndex: 1,
        explanation: 'Now. Decades are made of years, made of weeks, made of days.',
      ),
      QuizQuestion(
        question: 'Legacy is best measured by...',
        options: ['Net worth', 'Lives affected, problems solved, things taught', 'Awards', 'Headlines'],
        correctIndex: 1,
        explanation: 'Effect, not applause. Effect, not net worth.',
      ),
      QuizQuestion(
        question: "'Time horizon' thinking requires asking:",
        options: ["What's due tomorrow?", 'What would I want to be true in 20 years?', "What's trending?", "What's easy now?"],
        correctIndex: 1,
        explanation: "20-year questions change today's decisions.",
      ),
      QuizQuestion(
        question: 'The most leveraged legacy asset is...',
        options: ['Money', 'Knowledge that can be taught', 'Real estate', 'A famous name'],
        correctIndex: 1,
        explanation: "Knowledge transfers. It's the only asset that doubles when given away.",
      ),
      QuizQuestion(
        question: 'A useful legacy question is:',
        options: ["'What do I want?'", "'Who do I want to have become because of me?'", "'How do I get rich?'", "'What's my exit?'"],
        correctIndex: 1,
        explanation: 'People-first. Wealth follows people-first decisions.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Designing Your Life',
        speaker: 'Bill Burnett',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 11,
        whyWatch: "Stanford's design-thinking approach to a life that matters.",
      ),
      VideoResource(
        title: 'The Long Game',
        speaker: 'Dorie Clark',
        youtubeId: '2IMx6Pe6h4I',
        durationMinutes: 9,
        whyWatch: 'How to think on the timescale of decades.',
      ),
    ],
    unlockBadge: 'scale_master',
    sections: [
      LessonSection(
        heading: 'Leadership is a Decision, Not a Title',
        content:
            'You don\'t become a leader when you hire your first employee. You become a leader the moment you decide to take responsibility for outcomes beyond your personal output. Leadership starts with: (1) Taking full responsibility — no blaming circumstances, customers, or team members. (2) Going first — modeling the behavior, work ethic, and values you expect. (3) Making the call — when there\'s ambiguity, the leader provides clarity, even if the decision isn\'t perfect.',
      ),
      LessonSection(
        heading: 'The 3 Leadership Conversations',
        content:
            'Great leaders have three types of conversations consistently: (1) Direction Conversations — "Here\'s where we\'re going and why it matters." (2) Feedback Conversations — "Here\'s what\'s working and what needs to change." (3) Development Conversations — "Here\'s how you can grow, and here\'s how I\'ll support you." Most leaders only do #1. The best leaders spend equal time on all three.',
      ),
      LessonSection(
        heading: 'The Vulnerability-Strength Paradox',
        content:
            'Old-school leadership says: never show weakness. Modern leadership research says the opposite: leaders who admit mistakes, acknowledge uncertainty, and share personal challenges are MORE trusted, not less. This is because vulnerability signals confidence — only someone truly secure can admit imperfection. The key: be vulnerable about your own challenges, but remain strong about the mission. "I struggled with this decision" builds trust. "I\'m not sure we\'ll make it" destroys morale.',
      ),
      LessonSection(
        heading: 'Decision-Making Under Uncertainty',
        content:
            'Entrepreneurial leadership means making decisions with incomplete information — constantly. Framework for tough calls: (1) What\'s the reversible vs. irreversible part of this decision? (2) What\'s the cost of being wrong vs. the cost of being slow? (3) What would I decide if I had to decide in 5 minutes? Most decisions are reversible and the cost of delay exceeds the cost of error. When in doubt, decide faster. You can course-correct later.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Have one "Direction Conversation" today — share your vision with someone in a way that makes them feel excited to be part of it.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Make one decision today in under 5 minutes that you\'d normally agonize over. Apply the reversible/irreversible framework.',
        type: 'action',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Practice vulnerability: share one genuine challenge or mistake with someone today. Notice how it affects the relationship.',
        type: 'action',
        points: 30,
      ),
    ],
    reflectionPrompt:
        'Think of the best leader you\'ve ever worked with or observed. What specifically did they DO that made them great? How many of those behaviors do you currently practice?',
    actionStep:
        'Write your "Leadership Commitments" — 3 specific behaviors you will practice consistently as a leader. Example: "1. I will give clear expectations in writing. 2. I will give feedback within 24 hours, not weeks later. 3. I will admit when I\'m wrong, quickly and publicly."',
  ),

  // ============================================================
  // WEEK 5: INTEGRATION & LAUNCH (Days 29-30)
  // ============================================================

  // DAY 29 — Synthesis
  DailyLesson(
    day: 29,
    title: 'The Synthesis: Everything Connects',
    theme: 'Weaving 28 days of learning into one integrated framework',
    category: 'reflection',
    quote:
        'The whole is greater than the sum of its parts.',
    quoteAuthor: 'Aristotle',
    mindsetLesson:
        'Over the past 28 days, you\'ve built a complete entrepreneurial foundation: mindset mastery, money skills, business building tactics, and scaling strategies. But knowledge in isolation is just trivia. Today is about synthesis — connecting everything into one integrated operating system for your entrepreneurial journey. You\'ll see how each piece reinforces the others and create your personal framework.',
    skillName: 'Strategic Integration',
    skillDescription:
        'The ability to synthesize diverse knowledge, skills, and experiences into a coherent, actionable personal strategy.',
    xpReward: 200,
    chapterTitle: 'Chapter XXIX — The Synthesis',
    weekTheme: 'The Mastery',
    teaserQuote: 'The cave you fear to enter holds the treasure you seek. — Joseph Campbell',
    teaserHook: 'Tomorrow, the journey completes. But the real beginning is yours.',
    quiz: [
      QuizQuestion(
        question: 'Synthesis is best described as...',
        options: ['Adding more knowledge', 'Connecting what you know into something new', 'Reducing ideas', 'Choosing one idea'],
        correctIndex: 1,
        explanation: "Synthesis > accumulation. The map > the territory's footnotes.",
      ),
      QuizQuestion(
        question: 'The most valuable thing to synthesize is...',
        options: ['Trends', 'Your 30 chapters into a personal operating system', 'Books', 'Theories'],
        correctIndex: 1,
        explanation: 'Your chapters. Now. That synthesis is the prize of the 30 days.',
      ),
      QuizQuestion(
        question: 'Synthesis requires...',
        options: ['More data', 'Time and reflection', 'Faster reading', 'More tools'],
        correctIndex: 1,
        explanation: 'Time. Reflection. Distance. Those are the inputs.',
      ),
      QuizQuestion(
        question: "A 'personal operating system' should define...",
        options: ['Daily tasks', 'How you make decisions, prioritize, and act under pressure', 'Your schedule', 'Your tools'],
        correctIndex: 1,
        explanation: 'Decision rules. Priorities. Pressure-tested defaults.',
      ),
      QuizQuestion(
        question: 'The risk of a good synthesis is...',
        options: ['Being too specific', 'Compressing 30 days into 30 words and missing the nuance', 'Too many examples', 'Too many tools'],
        correctIndex: 1,
        explanation: 'Compression is dangerous if it loses the operational details.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'The Power of Synthesis',
        speaker: 'Manfred Kets de Vries',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 9,
        whyWatch: 'How great minds connect dots across disciplines.',
      ),
      VideoResource(
        title: 'Second-Order Thinking',
        speaker: 'Howard Marks',
        youtubeId: 'h-KHWUq3B7I',
        durationMinutes: 7,
        whyWatch: 'Thinking past the first consequence.',
      ),
    ],
    unlockBadge: '',
    sections: [
      LessonSection(
        heading: 'The Entrepreneurial OS',
        content:
            'Think of everything you\'ve learned as an operating system with four layers: Layer 1 (Mindset) — your internal engine. Without abundance thinking, failure resilience, and growth mindset, everything else breaks down. Layer 2 (Skills) — your tools. Opportunity spotting, sales, negotiation, pricing, marketing, customer empathy. Layer 3 (Execution) — your action layer. Lean startup, MVP creation, systems, delegation, financial literacy. Layer 4 (Scale) — your amplification layer. Automation, team building, brand, data, multiple streams, leadership. Each layer depends on the one below it.',
      ),
      LessonSection(
        heading: 'Your Top 5 Insights',
        content:
            'Review your journal entries from the past 28 days. Identify the 5 insights that resonated most deeply — the ones that shifted your thinking or sparked the strongest emotional response. These are your "keystone insights." They represent the areas where you have the most leverage for change. Write them down. These 5 insights will form the core of your 90-day plan.',
      ),
      LessonSection(
        heading: 'The Interconnection Map',
        content:
            'Draw connections between the major themes: How does abundance mindset (Day 1) enable better opportunity spotting (Day 8)? How does failure resilience (Day 2) support the lean startup Build-Measure-Learn loop (Day 15)? How does discipline (Day 4) enable the systems thinking (Day 17)? How does customer empathy (Day 14) improve your pricing (Day 12) and marketing (Day 13)? Seeing these connections transforms isolated lessons into an integrated worldview.',
      ),
      LessonSection(
        heading: 'Your Entrepreneurial Identity',
        content:
            'After 28 days of intensive learning and practice, your entrepreneurial identity has begun to solidify. Answer these questions honestly: Who are you as an entrepreneur? What do you stand for? What kind of business do you want to build? What kind of leader do you want to be? What impact do you want to have? Your answers form your entrepreneurial identity — the foundation upon which all your future decisions will rest.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Review all 28 journal entries. Extract your Top 5 Insights — the lessons that hit hardest. Write them on one page.',
        type: 'thought',
        points: 40,
      ),
      DailyChallenge(
        description:
            'Create your "Interconnection Map" — draw lines connecting at least 10 different days\' lessons that reinforce each other.',
        type: 'creative',
        points: 35,
      ),
      DailyChallenge(
        description:
            'Write your "Entrepreneurial Identity Statement" — one paragraph answering: Who am I as an entrepreneur? What do I stand for?',
        type: 'creative',
        points: 25,
      ),
    ],
    reflectionPrompt:
        'Looking back at the past 28 days, what is the SINGLE most important shift that has happened in your thinking? If you could only keep one lesson from this entire program, which would it be and why?',
    actionStep:
        'Create your "Personal Entrepreneurial Framework" — a one-page document summarizing: your top 5 insights, your core values, your primary skill focus, and your vision statement.',
  ),

  // DAY 30 — 90-Day Plan & Graduation
  DailyLesson(
    day: 30,
    title: 'Your 90-Day Launch Plan',
    theme: 'From learning to doing — your first 90 days as an entrepreneur',
    category: 'reflection',
    quote:
        'The best time to plant a tree was 20 years ago. The second best time is now.',
    quoteAuthor: 'Chinese Proverb',
    mindsetLesson:
        'Knowledge without action is entertainment. The past 29 days have given you the tools, frameworks, and mindset shifts. Today is about commitment: creating a concrete 90-day plan that transforms everything you\'ve learned into real-world action. You will define your first project, set milestones, identify accountability structures, and make a public commitment to your entrepreneurial journey.',
    skillName: 'Strategic Planning',
    skillDescription:
        'The ability to translate vision and knowledge into concrete, time-bound action plans with clear milestones and accountability.',
    xpReward: 300,
    chapterTitle: 'Chapter XXX — The Graduation',
    weekTheme: 'The Mastery',
    teaserQuote: 'The journey of a thousand miles begins with a single step. — Lao Tzu',
    teaserHook: 'The codex is yours now. Tomorrow, you write chapter thirty-one.',
    quiz: [
      QuizQuestion(
        question: 'Graduation from the 30-day codex means...',
        options: ['You are done', 'You are equipped — and the real work begins', 'You are a master', 'You can stop learning'],
        correctIndex: 1,
        explanation: 'Equipment is the start. Application is the next decade.',
      ),
      QuizQuestion(
        question: 'The most important next-30-day practice is...',
        options: ['Repeat the 30 days', 'Apply one chapter, deeply, in your real work', 'Read more books', 'Find a mentor'],
        correctIndex: 1,
        explanation: 'Apply. One chapter. Deeply. The compounding is in the application.',
      ),
      QuizQuestion(
        question: "Your 'codex' is best understood as...",
        options: ['A book', 'A personal operating system you now own', 'A course', 'A certificate'],
        correctIndex: 1,
        explanation: "It's yours now. Take it into every decision for the next year.",
      ),
      QuizQuestion(
        question: "'Compound interest' on mindset work is the result of...",
        options: ['Big bursts', 'Small daily choices over years', 'Reading a few books', 'Going to events'],
        correctIndex: 1,
        explanation: "Daily. Years. That's the only formula that compounds.",
      ),
      QuizQuestion(
        question: "The Entrepreneur's Codex ends...",
        options: ['With a period', 'With a comma — the next chapter is yours to write', 'With a certificate', 'With a bow'],
        correctIndex: 1,
        explanation: 'A comma. The book is yours. Write the next chapter.',
      ),
    ],
    videos: [
      VideoResource(
        title: 'Welcome to Your New Operating System',
        speaker: 'Tom Bilyeu',
        youtubeId: 'pN34FNbOKXc',
        durationMinutes: 9,
        whyWatch: 'A send-off that reframes the entire journey as a beginning.',
      ),
      VideoResource(
        title: 'The 30-Day Challenge That Changed My Life',
        speaker: 'Ed Mylett',
        youtubeId: '3qHkcs3kG44',
        durationMinutes: 7,
        whyWatch: 'A motivational close to your 30 chapters.',
      ),
    ],
    unlockBadge: 'graduation',
    sections: [
      LessonSection(
        heading: 'The 90-Day Sprint Framework',
        content:
            '90 days is the perfect planning horizon: long enough to accomplish something meaningful, short enough to maintain urgency. Your 90-day plan has three phases: Phase 1 (Days 1-30): Foundation — define your offer, identify your first 10 customers, build your MVP. Phase 2 (Days 31-60): Momentum — get your first paying customers, gather feedback, iterate your offer. Phase 3 (Days 61-90): Growth — systematize what\'s working, increase your prices or volume, plan the next 90 days.',
      ),
      LessonSection(
        heading: 'The One-Project Rule',
        content:
            'For your first 90 days, focus on ONE project. Not three. Not "a main project and a side hustle." ONE. The biggest killer of entrepreneurial momentum is divided focus. You can always add more projects later, after the first one has traction. Choose the project that: (1) Excites you most (you\'ll need the emotional fuel). (2) Has the lowest barrier to entry (you can start immediately). (3) Can generate revenue within 90 days (early wins build confidence).',
      ),
      LessonSection(
        heading: 'The Accountability Architecture',
        content:
            'Willpower fails. Systems succeed. Build accountability: (1) Public commitment — tell at least 5 people your specific 90-day goal. (2) Weekly review — every Sunday, review progress against your plan. (3) Accountability partner — find one person (another entrepreneur ideally) and commit to a weekly 15-minute check-in call. (4) Visual tracker — put a physical calendar or chart on your wall where you mark progress daily. Visible progress is motivating; invisible progress is forgettable.',
      ),
      LessonSection(
        heading: 'The Graduation Mindset',
        content:
            'Completing this 30-day program is not the end — it\'s the beginning. You\'ve built the mindset foundation. You\'ve learned the core skills. You\'ve created your plan. Now the real work starts. But here\'s what\'s different: you\'re not starting from zero anymore. You have frameworks, tools, and a community of fellow learners. You have evidence that you can commit to something for 30 days and complete it. That evidence is more valuable than any single lesson — because it proves you are someone who finishes what they start.',
      ),
    ],
    challenges: [
      DailyChallenge(
        description:
            'Write your complete 90-Day Plan: one project, 3 phases, specific milestones for days 30, 60, and 90.',
        type: 'creative',
        points: 50,
      ),
      DailyChallenge(
        description:
            'Make a public commitment: tell at least 5 people your specific 90-day goal and ask them to hold you accountable.',
        type: 'action',
        points: 30,
      ),
      DailyChallenge(
        description:
            'Find an accountability partner — someone also building something — and schedule your first weekly check-in.',
        type: 'action',
        points: 20,
      ),
    ],
    reflectionPrompt:
        'One year from today, looking back: what would need to have happened for you to feel proud of your entrepreneurial journey? What\'s the first step toward that outcome that you can take TODAY?',
    actionStep:
        'Take your first concrete action TODAY — not tomorrow, not Monday. Send one email, make one call, create one page, have one conversation. Momentum starts with a single action. Take it now.',
  ),
];