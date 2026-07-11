// Long-form portfolio copy is wrapped across lines as adjacent string literals
// inside list elements (highlights); that is deliberate, not a missing comma.
// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:polymorphism/core/constants/assets.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/data/models/career_event.dart';
import 'package:polymorphism/data/models/project.dart';
import 'package:polymorphism/data/models/skill.dart';

/// The portfolio's content database.
///
/// To add or change content, edit this file only — layout and design adapt
/// automatically. See `docs/CONTENT_GUIDE.md` for a walkthrough.
class PortfolioData {
  PortfolioData._();

  // ── Projects (spotlight order — variety-first) ─────────────────────────
  //
  // Per-project colors come from each product's own design language; ROAST and
  // FE Touch use real screenshots, ELSSA/ProFund/SIGAP use imagery rendered
  // from their live prototypes, Balai is presented as an editorial art panel.

  static final List<Project> projects = [
    const Project(
      id: 'modchat',
      name: 'ModChat',
      category: 'MESSAGING PLATFORM',
      platform: ProjectPlatform.crossPlatform,
      tagline:
          'Secure messaging, reimagined. Real-time communication with AI-powered safety.',
      shortDesc:
          'A production-ready cross-platform messaging platform built with Flutter, Firebase, '
          'Firestore, Supabase, and Riverpod. Features real-time messaging, voice/video calling, '
          'group conversations, media sharing, and AI content moderation.',
      fullDesc:
          'ModChat is a complete messaging platform engineered for security, scalability, and '
          'real-time performance. Built from the ground up with Flutter and Firebase, it handles '
          'the full spectrum of modern communication: one-on-one chats, group conversations, '
          'voice and video calls, media sharing, and presence indicators — all synchronized in '
          'real-time across Android, iOS, and web. The platform integrates AI-powered content '
          'moderation to ensure safe communication, implements end-to-end message encryption, '
          "and uses Firestore's real-time listeners for instant message delivery. State management "
          'is handled through Riverpod for predictable, testable architecture. WebRTC powers the '
          'voice and video calling features, while Supabase Storage manages media with automatic '
          'compression and CDN delivery. The app supports offline message queueing, optimistic UI '
          'updates, and background notifications. Every screen is designed with dark mode first, '
          'smooth animations, and responsive layouts that adapt from phones to tablets to desktop.',
      tech: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Firebase Auth',
        'Cloud Firestore',
        'Supabase Storage',
        'WebRTC',
        'AI Moderation',
        'Push Notifications',
      ],
      images: AppAssets.modchat,
      media: ProjectMedia.framedGallery,
      dominantColor: Color(0xFF0A0E27),
      accentColor: Color(0xFF6366F1),
      metrics: [
        ProjectMetric('20+', 'Screens'),
        ProjectMetric('Real-Time', 'Sync'),
        ProjectMetric('AI', 'Moderation'),
        ProjectMetric('Voice+Video', 'Calls'),
      ],
      highlights: [
        'Real-time messaging powered by Cloud Firestore with optimistic updates and offline '
            'queueing — messages appear instantly and sync automatically when connectivity returns.',
        'WebRTC-based voice and video calling with automatic quality adjustment, call state '
            'management, and support for group calls with up to 8 participants.',
        'AI content moderation layer that scans messages and media in real-time, filtering '
            'inappropriate content while preserving user privacy.',
        'Riverpod state management architecture with repository pattern separation — business '
            'logic lives in one place, UI stays reactive and testable.',
        'Supabase Storage integration for media with automatic image compression, video '
            'transcoding, and CDN delivery for global performance.',
        'Complete authentication flow with email/password, Google Sign-In, phone authentication, '
            'and account recovery — all secured with Firebase Auth.',
        'Group conversation engine with admin controls, member management, typing indicators, '
            'read receipts, and message reactions.',
        'Push notification system with FCM integration, supporting message previews, action '
            'buttons, and deep linking to specific conversations.',
      ],
      role: 'Full Stack Developer — architecture, implementation, deployment',
      year: '2024',
      status: 'Production Ready',
      githubUrl: 'https://github.com/SyedZaynShah/modchat',
      isFeatured: true,
    ),
    const Project(
      id: 'elssa',
      name: 'ELSSA',
      category: 'SCHOOL SAAS',
      platform: ProjectPlatform.crossPlatform,
      tagline:
          'The platform that runs the school — and that parents open every morning.',
      shortDesc:
          'A school-management and parent-engagement platform for Indonesian high '
          'schools. Its wedge is the morning moment: a student taps in at the gate '
          "and the parent's phone lights up — attendance, grades, and tuition one tap away.",
      fullDesc:
          'A single school day runs on a dozen disconnected tools — announcements in '
          'WhatsApp, attendance on paper, tuition billed by hand. ELSSA is one connected '
          'platform that runs daily operations and gives every parent a live window into '
          "their child's day. It rides the systems schools already use — importing rosters "
          'from Dapodik and exporting grades to e-Rapor — so it complements government '
          'systems instead of fighting them. The signature moment is the morning hadir: '
          "when a student taps in at the gate, the parent's phone lights up, and opens "
          'into attendance, grades, the SPP balance, and announcements.',
      tech: ['Flutter', 'Firebase', 'Multi-role', 'Design System'],
      images: AppAssets.elssa,
      media: ProjectMedia.framedGallery,
      dominantColor: Color(0xFF1E4D3A),
      accentColor: Color(0xFFE8833A),
      metrics: [
        ProjectMetric('7', 'Roles'),
        ProjectMetric('4', 'Surfaces'),
        ProjectMetric('3', 'Capture methods'),
      ],
      highlights: [
        'Rides the systems schools already use — imports rosters from Dapodik, exports '
            'grades to e-Rapor (supporting both Kurikulum 2013 and Merdeka).',
        'The signature morning hadir: a gate tap-in fires an instant parent '
            'notification — the daily reassurance that earns a school its trust.',
        'Per-school isolated Firebase projects — the strongest privacy posture for '
            "children's attendance, grades, money, and biometrics.",
        'Seven roles prototyped at high fidelity, including the loading, empty, error '
            'and offline states products usually skip.',
      ],
      role: 'Solo founder — product, UX/UI, prototype, architecture',
      year: '2025–2026',
      status: 'Shipped',
      isFeatured: true,
    ),
    const Project(
      id: 'fitx',
      name: 'FitX',
      category: 'FITNESS APP',
      platform: ProjectPlatform.mobile,
      tagline:
          'Turn everyday attendance into a habit — built around a daily streak.',
      shortDesc:
          'A mobile app for a multi-branch Indonesian gym that turns attendance into a habit '
          'and brings class booking, personal training, barber & nail appointments, retail, '
          'and membership into one connected, two-sided experience.',
      fullDesc:
          'Most gym apps bolt features onto a login screen and stop at booking. The harder, '
          'more valuable problem is retention — getting members to come back. FitX is built '
          'around a daily habit loop: scan in at the gym, watch a visit streak grow, book the '
          'next session. Everything else — progress, retail, membership — is arranged as '
          'satellites around that core, so the app earns a daily open rather than an occasional '
          'one. Members and personal trainers share a single app behind role-based access, with '
          'a separate admin application, so the two sides connect directly — a trainer-assigned '
          "workout surfaces in that member's progress log.",
      tech: ['Flutter', 'Firebase', 'Repository', 'Mock-data-first'],
      images: AppAssets.fitx,
      media: ProjectMedia.mockupGallery,
      dominantColor: Color(0xFF19220C),
      accentColor: Color(0xFFC6F23C),
      metrics: [
        ProjectMetric('2', 'Sides, one app'),
        ProjectMetric('2', 'Booking engines'),
        ProjectMetric('Multi', 'Branch'),
      ],
      highlights: [
        'Two-sided, one system — members and trainers share one app behind role-based access; '
            "a trainer's bookable hours become the very slots a member sees.",
        'One booking layer, two engines — every reservation is either seat-claiming (group '
            'classes, with capacity and waitlists) or provider-reservation (PT, barber, nails).',
        'Built around a daily habit loop — scan in, watch the streak grow, book the next '
            'session; progress, retail, and membership all orbit that core.',
        'Built for the Indonesian market — per-branch barcode check-in, QRIS and bank transfer, '
            'reserve-and-collect retail, and Bahasa Indonesia throughout.',
      ],
      role:
          'Solo founder & builder — product, IA, system design, UX & art direction',
      year: '2026',
      status: 'Concept & product design',
    ),
    const Project(
      id: 'fe-touch',
      name: 'FE Touch',
      category: 'BANKING · CLIENT WORK',
      platform: ProjectPlatform.tablet,
      tagline: 'A modern teller workspace for everyday banking.',
      shortDesc:
          'A teller application built with PT Collega Inti Pratama — a fast, clean '
          'interface for everyday banking at the counter. Designed to feel effortless '
          'even during the rush-hour queue, with the rigor a banking product demands.',
      fullDesc:
          'FE Touch brings a fresh, modern interface to everyday banking tasks for bank '
          'tellers: cash transactions, account inquiry, and the daily reconciliation a '
          'teller closes their shift on. Built to feel fast, clean, and easy to use even '
          'at the counter during rush hour, it pairs a considered visual layer with the '
          'reliability and correctness a financial product depends on. This was client '
          'work — translating real banking workflows into an interface tellers reach for '
          'hundreds of times a day without friction.',
      tech: ['Flutter', 'REST APIs', 'Banking'],
      images: AppAssets.feTouch,
      media: ProjectMedia.framedGallery,
      dominantColor: Color(0xFF5E9C90),
      accentColor: Color(0xFF2F6F64),
      highlights: [
        'A teller-first workspace: cash transactions, inquiry, and end-of-shift '
            'reconciliation, all a tap or two away.',
        'A calm, modern interface layered over real banking workflows — fast to read '
            'and act on at a busy counter.',
        'Built with the correctness and reliability discipline a financial product '
            'demands, as client work for PT Collega Inti Pratama.',
      ],
      role: 'Flutter UI engineering · client work',
      year: '2022',
      status: 'Shipped',
    ),
    const Project(
      id: 'balai',
      name: 'Balai',
      category: 'AUCTION APP',
      platform: ProjectPlatform.mobile,
      tagline:
          "An auction app with a curator's eye — themed, timed drops, not an endless feed.",
      shortDesc:
          'A mobile auction platform reframed around curated drops: a curator assembles '
          'a themed sale of a few lots and runs it as a live, timed event. Auction-house '
          'proxy bidding with staggered closes and anti-snipe extensions.',
      fullDesc:
          'Most auction apps are endless marketplaces — infinite listings, no point of '
          'view. Balai is built on the opposite instinct: scarcity and taste. It centres '
          'on curated drops, where a curator assembles a themed sale of a handful of lots, '
          'sets the schedule, and the whole thing runs as a live, timed event with a real '
          'sense of occasion. Bidding follows an auction-house model — ascending proxy '
          'bidding with staggered closes and anti-snipe soft closes — and the design is '
          'editorial and image-forward, with a calm paper-toned browse and a dramatic '
          'dark "gallery spotlight" mode for the live moment.',
      tech: ['Flutter', 'Firebase', 'Cloud Functions', 'Real-time'],
      images: AppAssets.balai,
      media: ProjectMedia.mockupGallery,
      dominantColor: Color(0xFF14110F),
      accentColor: Color(0xFFC2A24E),
      metrics: [
        ProjectMetric('3', 'Roles'),
        ProjectMetric('Proxy', 'Bidding'),
        ProjectMetric('Live', 'Timed drops'),
      ],
      highlights: [
        'Reframed a generic auction concept into a curated, event-driven "drops" model '
            'built on scarcity and taste.',
        'An auction-house proxy-bidding engine with staggered closes and anti-snipe '
            'soft-close extensions.',
        'A three-role system — seller → curator → buyer — with the curator as the '
            'editorial layer that turns listings into a show.',
        'Server-side, transactional bid resolution via Cloud Functions keeps the proxy '
            'logic fair and race-condition-free.',
      ],
      role: 'Solo — product reframe, system design, visual language',
      year: '2026',
      status: 'Shipped',
    ),
  ];

  static Project? projectById(String id) {
    for (final p in projects) {
      if (p.id == id) {
        return p;
      }
    }
    return null;
  }

  // ── Career timeline (oldest → most recent) ─────────────────────────────

  static const List<CareerEvent> careerEvents = [
    CareerEvent(
      year: 2024,
      title: 'Independent Software Developer',
      company: 'Personal Projects',
      location: 'Abbottabad, Pakistan',
      period: '2024 — Present',
      description:
          'Designed, developed, and continuously improved multiple full-stack software '
          'projects as personal and portfolio work. Focused on solving real-world problems '
          'while learning modern technologies through practical implementation rather than tutorials.',
      highlights: [
        'Built ModChat, a secure real-time messaging platform with voice/video calling and AI content moderation',
        'Developed a production-ready Property Management Platform using Next.js, Prisma, PostgreSQL, and NextAuth',
        'Created a responsive Netflix-inspired frontend to demonstrate modern UI engineering',
        'Developed Laboratory Management and Showroom Management systems',
        'Built an AI-powered chatbot capable of conversational responses using Python and NLP techniques',
        'Applied clean architecture, state management, database design, authentication, and responsive UI principles',
      ],
    ),
    CareerEvent(
      year: 2025,
      title: 'Full Stack Mobile & Web Developer',
      company: 'Techno Spire Global',
      location: 'Remote',
      period: 'August 2025 — January 2026',
      description:
          'Worked as a Full Stack Developer building and maintaining production-ready '
          'mobile applications and modern web platforms for real clients. Contributed to '
          'delivering high-quality software through collaborative development.',
      highlights: [
        'Developed cross-platform Flutter applications with scalable architecture',
        'Built responsive web applications using React.js and Next.js',
        'Integrated Firebase Authentication, Cloud Firestore, and Supabase services',
        'Developed secure authentication systems using NextAuth',
        'Designed and managed PostgreSQL databases with Prisma ORM',
        'Implemented REST API integrations and backend communication',
        'Optimized application performance, responsiveness, and maintainability',
        'Collaborated with designers and developers to deliver production-ready software',
        'Participated in debugging, testing, deployment, and feature planning',
      ],
    ),
  ];

  // ── Toolkit — a visual specialist's pillars ────────────────────────────

  static const List<ToolkitPillar> toolkitPillars = [
    ToolkitPillar(
      name: 'Full Stack Flutter Development',
      tagline:
          'Production-grade Flutter applications built with scalable architecture, clean code, '
          'and real-world deployment experience. Focus on performance, maintainability, and '
          'seamless user experiences across Android, iOS, and Web.',
      level: 'PROFICIENT',
      icon: LucideIcons.smartphone,
      accent: AppColors.accentPrimary,
      skills: [
        Skill('Flutter', LucideIcons.smartphone),
        Skill('Dart', LucideIcons.code),
        Skill('Riverpod', LucideIcons.layers),
        Skill('Firebase', Icons.local_fire_department),
        Skill('Cloud Firestore', Icons.storage),
        Skill('Firebase Auth', Icons.security),
        Skill('Supabase', Icons.storage),
        Skill('REST APIs', Icons.api),
        Skill('State Management', LucideIcons.layers),
      ],
    ),
    ToolkitPillar(
      name: 'Modern Web Engineering',
      tagline:
          'Building fast, responsive, SEO-friendly web applications using modern React and '
          'Next.js ecosystems with production-ready authentication, server-side rendering, '
          'and scalable backend integrations.',
      level: 'PROFICIENT',
      icon: Icons.language,
      accent: AppColors.accentSecondary,
      skills: [
        Skill('Next.js', LucideIcons.layoutDashboard),
        Skill('React.js', Icons.web),
        Skill('JavaScript (ES6+)', LucideIcons.code),
        Skill('HTML5', LucideIcons.code),
        Skill('CSS3', LucideIcons.palette),
        Skill('Responsive Design', LucideIcons.smartphone),
        Skill('Server-Side Rendering (SSR)', Icons.cloud),
        Skill('NextAuth', Icons.security),
        Skill('Cloudinary', Icons.cloud_upload),
      ],
    ),
    ToolkitPillar(
      name: 'Backend & Database Systems',
      tagline:
          'Designing secure backend architectures, relational databases, authentication systems, '
          'and scalable data models that power modern web and mobile applications.',
      level: 'PROFICIENT',
      icon: Icons.storage,
      accent: Color(0xFF10B981),
      skills: [
        Skill('PostgreSQL', Icons.storage),
        Skill('Prisma ORM', Icons.inventory_2),
        Skill('Firebase', Icons.local_fire_department),
        Skill('Firestore', Icons.storage),
        Skill('Authentication & Authorization', Icons.lock),
        Skill('Database Design', Icons.dashboard),
        Skill('Role-Based Access Control (RBAC)', Icons.people),
        Skill('API Integration', Icons.cloud_sync),
      ],
    ),
    ToolkitPillar(
      name: 'Software Engineering & Product Development',
      tagline:
          'Shipping complete software products from concept to deployment with emphasis on '
          'clean architecture, performance optimization, version control, and collaborative development.',
      level: 'PROFICIENT',
      icon: Icons.build,
      accent: Color(0xFFF59E0B),
      skills: [
        Skill('Git & GitHub', LucideIcons.github),
        Skill('Clean Architecture', LucideIcons.layers),
        Skill('Performance Optimization', LucideIcons.gauge),
        Skill('Software Architecture', Icons.architecture),
        Skill('UI/UX Implementation', LucideIcons.layoutDashboard),
        Skill('Debugging', Icons.bug_report),
        Skill('Agile Development', Icons.replay),
        Skill('Cross-Platform Development', Icons.devices),
      ],
    ),
  ];

  // ── About stats ────────────────────────────────────────────────────────

  static const List<({String value, String label})> stats = [
    (value: '3.88', label: 'CGPA\n/ 4.00'),
    (value: '10+', label: 'Production-Level\nProjects'),
    (value: '10+', label: 'Technologies\nUsed'),
    (value: '1', label: 'Professional\nExperience'),
    (value: '100%', label: 'Commitment\nto Quality'),
  ];

  // ── Social links ───────────────────────────────────────────────────────

  static const String githubUrl = 'https://github.com/SyedZaynShah';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/zain-shah-91b419321/';
  static const String instagramUrl = 'https://www.instagram.com/sayedzaynshah';

  static const List<({String label, String url})> socials = [
    (label: 'GitHub', url: githubUrl),
    (label: 'LinkedIn', url: linkedInUrl),
    (label: 'Instagram', url: instagramUrl),
  ];
}
