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
      id: 'ev-driver',
      title: 'EV Driver',
      role: 'Flutter Developer @ Burning Bros',
      description:
          'Flutter mobile app for EV driver operations: real-time trip '
          'management, BLE vehicle pairing, map/location UX, and QR-based '
          'check-in. Integrated Shorebird OTA patches for zero-downtime '
          'releases and Sentry for production observability.',
      techStack: [
        'Flutter',
        'BLoC',
        'Firebase',
        'BLE',
        'Naver Maps',
        'Sentry',
        'Shorebird',
        'AutoRoute',
      ],
      url: '#',
      impact: 'OTA Updates via Shorebird  ·  BLE + GPS Operations',
      vaporwaveTagline: 'VOLTAGE ON WHEELS. DATA IN MOTION.',
    ),
    Project(
      id: 'ev-ivi',
      title: 'EV IVI',
      role: 'Android Developer @ Burning Bros',
      description:
          'Android in-vehicle infotainment app built with Kotlin & Jetpack '
          'Compose. Covers driver auth, fleet/shift selection, QR matching, '
          'BLE advertising, live vehicle telemetry, and Firebase-driven '
          'realtime match sync.',
      techStack: [
        'Kotlin',
        'Jetpack Compose',
        'Material 3',
        'Koin',
        'Firebase',
        'Kakao Navigation',
        'Arrow Core',
      ],
      url: '#',
      impact: 'Android Native IVI  ·  Feature-Based Architecture',
      vaporwaveTagline: 'THE COCKPIT GOES DIGITAL.',
    ),
    Project(
      id: 'voice-journal',
      title: 'Voice Journal',
      role: 'Flutter Developer @ Burning Bros',
      description:
          'AI-powered voice journaling app: record thoughts, visualize '
          'audio waveforms, and replay offline-persisted entries. '
          'Firebase AI processes recordings; Supabase handles auth and '
          'sync across devices.',
      techStack: [
        'Flutter',
        'Firebase AI',
        'Supabase',
        'BLoC',
        'Hive',
        'FFmpeg',
        'Clean Architecture',
      ],
      url: '#',
      impact: 'AI Audio Processing  ·  Offline-First Sync',
      vaporwaveTagline: 'YOUR THOUGHTS, IMMORTALIZED IN SOUND.',
    ),
    Project(
      id: 'yeong-delivery',
      title: 'Yeong Delivery',
      role: 'Flutter Developer @ Burning Bros',
      description:
          'Group-ordering Flutter app — a host shares one link; teammates '
          'join without installing anything, pick items, and settle the bill. '
          'Full flows: auth, menu/cart, group orders, history, addresses, '
          'payment. Supports VI / EN / KO localization.',
      techStack: [
        'Flutter',
        'BLoC/Cubit',
        'Freezed',
        'AutoRoute',
        'Dio',
        'Hive',
        'get_it',
        'i18n (3 locales)',
      ],
      url: '#',
      impact: 'Shareable-Link Orders  ·  3-Language Support',
      vaporwaveTagline: 'SQUAD ORDERS. ONE LINK. ZERO CHAOS.',
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
      url: 'https://masothue.com/0316840598-cong-ty-tnhh-burning-bros',
      description:
          'Delivering production-grade outsourcing products for international '
          'clients. Shipped an Android IVI app (Kotlin/Compose) for EV fleet '
          'operations, a Flutter EV Driver app with BLE + Shorebird OTA, an '
          'AI voice journal (Firebase AI + Supabase), and a group-ordering '
          'platform with multi-language support.',
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
    '7+': 'PRODUCTION APPS SHIPPED',
    '15+': 'FEATURE MODULES SHIPPED',
  };

  static const String githubUrl = 'https://github.com/';
  static const String linkedinUrl = 'https://linkedin.com/in/';
  static const String email = 'mailto:abc@gmail.com';
}
