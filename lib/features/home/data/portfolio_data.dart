import 'package:portfolio/features/home/domain/models.dart';

class PortfolioData {
  PortfolioData._();

  static const List<Project> projects = [
    Project(
      id: 'cita',
      title: 'Cita AI',
      role: 'Lead Flutter Developer',
      description:
          'AI-powered language learning app with real-time conversation, '
          'speech recognition, and offline-first sync. '
          'Shipped to App Store & Google Play with zero-downtime CI/CD.',
      techStack: [
        'Flutter',
        'Riverpod',
        'Firebase',
        'Brick ORM',
        'WebSocket',
        'STT/TTS',
        'Codemagic',
      ],
      url: 'https://citaspeak.com/',
      impact: '28+ Languages  ·  Live on App Store & Google Play',
      vaporwaveTagline: 'THE PULSE OF GLOBAL COMMUNICATION',
      isFeatured: true,
    ),
    Project(
      id: 'burning',
      title: 'Burning Bros',
      role: 'Mobile Developer',
      description:
          'Enterprise outsourcing projects using Flutter Web, Supabase, '
          'and Firebase AI. Delivering production-grade multi-platform apps '
          'for international clients.',
      techStack: ['Flutter Web', 'Supabase', 'Firebase AI', 'Dart'],
      url: 'https://masothue.com/0316840598-cong-ty-tnhh-burning-bros',
      impact: 'Enterprise Scale  ·  Multiple Production Apps',
      vaporwaveTagline: 'ENGINEERED AT WARP SPEED',
    ),
    Project(
      id: 'yeong',
      title: 'Yeong Coffee',
      role: 'UI/UX Designer & Lead Developer',
      description:
          'Modern coffee ordering experience designed entirely with Figma AI '
          'for rapid prototyping, then delivered with Flutter Web '
          'for seamless cross-device access.',
      techStack: ['Flutter Web', 'Figma AI', 'Supabase'],
      url: 'https://yeongcoffee.com/',
      impact: 'AI-Designed UI  ·  Cross-device Experience',
      vaporwaveTagline: 'THE DIGITAL CAFFEINE RUSH',
    ),
    Project(
      id: 'dicamon',
      title: 'Dicamon',
      role: 'Flutter Developer',
      description:
          'Educational platform with 5M+ total downloads. '
          'Built a viral word-catching mini-game that accumulated '
          '50 000+ active participants within its first month.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'Laravel 8'],
      url: 'https://dicamon.vn/',
      impact: '5M+ Downloads  ·  50k+ Active Users Month 1',
      vaporwaveTagline: 'EDUCATION AT WARP SPEED',
    ),
  ];

  static const List<SkillGroup> skillGroups = [
    SkillGroup(
      title: 'MOBILE & WEB ENGINEERING',
      skills: [
        'Flutter (Expert — Mobile & Web)',
        'Dart (Advanced)',
        'Riverpod / BLoC / Provider',
        'Clean Architecture',
        'Feature-First Modularization',
        'Material 3 & Custom Design Systems',
        'Unit / Widget / Integration Testing',
        'Sentry  ·  Wiredash',
      ],
    ),
    SkillGroup(
      title: 'DATA & REAL-TIME SYSTEMS',
      skills: [
        'Offline-First (Brick ORM)',
        'Isar / Hive / SQLite',
        'Firebase (Auth, Firestore, AI)',
        'Supabase (PostgreSQL, Storage)',
        'WebSockets  ·  Realtime DB',
        'STT / TTS  ·  AI Audio Processing',
        'Firebase Functions',
      ],
    ),
    SkillGroup(
      title: 'PRODUCT GROWTH & DEVOPS',
      skills: [
        'Codemagic CI/CD',
        'App Store  ·  Google Play Deployment',
        'RevenueCat (IAP / Subscriptions)',
        'Mixpanel  ·  Firebase Analytics',
        'Cursor IDE  ·  Gemini  ·  Figma AI',
        'Git  ·  Linear  ·  Slack',
        'Laravel 8 (Backend)',
      ],
    ),
  ];

  static const List<TimelineEntry> timeline = [
    TimelineEntry(
      period: '2025 — PRESENT',
      role: 'Mobile Developer',
      company: 'Burning Bros',
      url: 'https://burningbros.com/',
      description:
          'Building enterprise outsourcing products using Flutter Web, '
          'Supabase, and Firebase AI. Delivering production-grade apps '
          'for international clients across multiple industries.',
      isHighlighted: true,
    ),
    TimelineEntry(
      period: '2023 — PRESENT',
      role: 'Lead Flutter Developer',
      company: 'Cita AI (Startup)',
      url: 'https://citaspeak.com/',
      description:
          'Architected and shipped an AI-powered language learning app '
          'to App Store & Google Play. Built 15+ feature modules '
          'including real-time AI conversation, offline-first sync, '
          'RevenueCat monetization, and a Codemagic CI/CD pipeline.',
    ),
    TimelineEntry(
      period: '2023 — 2024',
      role: 'Flutter Developer',
      company: 'TIASA (Dicamon)',
      url: 'https://dicamon.vn/',
      description:
          'Developed features for an educational platform with 5M+ downloads. '
          'Built a viral word-catching game that reached 50 000+ active users '
          'within its first month of release.',
    ),
    TimelineEntry(
      period: '2019 — 2023',
      role: "Bachelor's Degree in IT",
      company: 'Industrial University of Ho Chi Minh City',
      url: '#',
      description:
          'GPA: 3.29 / 4.0. Self-taught Flutter development alongside '
          'academic studies, building foundational mobile engineering skills '
          'and launching first personal projects.',
    ),
  ];

  static const Map<String, String> stats = {
    '4+': 'YEARS PRODUCTION EXP.',
    '5M+': 'APP DOWNLOADS',
    '28+': 'LANGUAGES SUPPORTED',
    '15+': 'FEATURE MODULES SHIPPED',
  };

  static const String githubUrl = 'https://github.com/';
  static const String linkedinUrl = 'https://linkedin.com/in/';
  static const String email = 'mailto:abc@gmail.com';
}
