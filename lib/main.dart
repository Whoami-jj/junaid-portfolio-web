import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PortfolioApp());

class Profile {
  static const name = 'Junaid Akram';
  static const role = 'Flutter Developer';
  static const email = 'devjunaidakr@gmail.com';
  static const github = 'https://github.com/Whoami-jj';
  static const linkedin = 'https://linkedin.com/in/junaid-akram-1873a11a9/';
}

Future<void> openUrl(String url) async {
  final ok = await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  if (!ok) debugPrint('Could not launch $url');
}

Future<void> openCv() => openUrl(
  'https://drive.google.com/file/d/15qlRGyn42KdqdYmzDCjV_XU7fYS5Qkge/view?usp=drive_link',
);

class Pal {
  final Color bg, surface, card, border, text, text2, muted, accent, accent2;

  const Pal({
    required this.bg,
    required this.surface,
    required this.card,
    required this.border,
    required this.text,
    required this.text2,
    required this.muted,
    required this.accent,
    required this.accent2,
  });

  static const dark = Pal(
    bg: Color(0xFF080C14),
    surface: Color(0xFF0B1220),
    card: Color(0xFF111E35),
    border: Color(0x991E3A5F),
    text: Colors.white,
    text2: Color(0xFF94A3B8),
    muted: Color(0xFF64748B),
    accent: Color(0xFF4F8EF7),
    accent2: Color(0xFF00D9FF),
  );

  static const light = Pal(
    bg: Color(0xFFF0F4FF),
    surface: Color(0xFFE8EEFF),
    card: Colors.white,
    border: Color(0xCCBFD7FF),
    text: Color(0xFF0F172A),
    text2: Color(0xFF475569),
    muted: Color(0xFF94A3B8),
    accent: Color(0xFF2563EB),
    accent2: Color(0xFF0284C7),
  );

  static Pal of(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark ? dark : light;
}

final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

ThemeData _theme(Brightness b) {
  final p = b == Brightness.dark ? Pal.dark : Pal.light;
  return ThemeData(
    useMaterial3: true,
    brightness: b,
    scaffoldBackgroundColor: p.bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: p.accent,
      brightness: b,
    ).copyWith(primary: p.accent, secondary: p.accent2, surface: p.surface),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (_, mode, __) => MaterialApp(
        title: '${Profile.name} — ${Profile.role}',
        debugShowCheckedModeBanner: false,
        themeMode: mode,
        theme: _theme(Brightness.light),
        darkTheme: _theme(Brightness.dark),
        home: const HomePage(),
      ),
    );
  }
}

class Job {
  final String role, company, period, location;
  final Color color;
  final List<String> points;

  const Job(
    this.role,
    this.company,
    this.period,
    this.location,
    this.color,
    this.points,
  );
}

class Project {
  final String title, category, description;
  final List<String> tech, highlights;
  final Color color;
  final String? url, linkLabel, note;

  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.tech,
    required this.highlights,
    required this.color,
    this.url,
    this.linkLabel,
    this.note,
  });
}

class StoreApp {
  final String title, description, ios, android;
  final IconData icon;
  final Color color;

  const StoreApp(
    this.title,
    this.description,
    this.icon,
    this.color,
    this.ios,
    this.android,
  );
}

const _jobs = <Job>[
  Job(
    'Flutter Developer',
    'Inspire Uplift IT Solutions',
    'Mar 2024 – Present',
    'Faisalabad, PK',
    Color(0xFF2563EB),
    [
      'Developed and optimized the Marketplace and Seller Central apps (2M+ users)',
      'Implemented state management for smooth performance',
      'Integrated REST APIs and Firebase Firestore for real-time updates',
      'Automated seller onboarding workflows, improving efficiency',
      'Led development of interactive analytics dashboards',
      'Ran A/B tests to improve UX metrics',
      'Fixed performance bottlenecks, reducing crash rates',
      'Built a troubleshooting protocol that reduced support tickets',
    ],
  ),
  Job(
    'Flutter Developer',
    'Hexamile',
    'Dec 2023 – Feb 2024',
    'Faisalabad, PK',
    Color(0xFF0EA5E9),
    [
      'Built core features of Sonata, a live streaming and social platform',
      'Implemented real-time chat, audio and video calls',
      'Integrated a payment gateway for secure transactions',
      'Built an in-app customer support ticket system',
      'Implemented secure auth (sign-up, login, OTP)',
      'Real-time posts and comments via Firebase Firestore',
    ],
  ),
];

const _projects = <Project>[
  Project(
    title: 'Inspire Uplift Marketplace & Seller Central',
    category: 'E-Commerce',
    description:
        'Enterprise apps for marketplace and seller management with real-time analytics and automated workflows.',
    tech: ['Flutter', 'Firebase', 'REST API', 'Bloc'],
    highlights: [
      'Real-time analytics dashboard',
      'Automated seller onboarding',
      'Real-time order tracking',
      'Optimized for 2M+ users',
    ],
    color: Color(0xFF2563EB),
    url:
        'https://play.google.com/store/apps/details?id=com.inspireuplift.sellercentral.iu_seller_central',
    linkLabel: 'View on Google Play',
  ),
  Project(
    title: 'Live Streaming & Social Platform',
    category: 'Live Streaming',
    description:
        'Real-time social engagement platform with live streaming, chat, audio/video calls, and integrated payments.',
    tech: ['Flutter', 'WebSocket', 'Firebase', 'REST API', 'Payment Gateway'],
    highlights: [
      'Real-time chat, audio & video interactions',
      'Live streaming with audience participation',
      'Secure payment gateway integration',
      'In-app customer support ticket system',
    ],
    color: Color(0xFFE11D48),
    note: 'Company project — source not public',
  ),
  Project(
    title: 'Sonata Social Media App',
    category: 'Social Platform',
    description:
        'Full-featured social platform with real-time posting, commenting, and engagement features.',
    tech: ['Flutter', 'Firebase Firestore', 'Auth'],
    highlights: [
      'Secure OTP authentication',
      'Real-time updates',
      'Enhanced security',
    ],
    color: Color(0xFF7C3AED),
    note: 'Company project — source not public',
  ),
  Project(
    title: 'Meal Match (FYP)',
    category: 'Health & Fitness',
    description:
        'AI-powered nutritionist app that tracks food habits and gives personalized diet recommendations.',
    tech: ['Flutter', 'AI Integration', 'Firebase'],
    highlights: [
      'AI consultation features',
      'Calorie calculator and food log',
      'Dietitian consultation',
    ],
    color: Color(0xFF059669),
    url: 'https://github.com/Whoami-jj/new-meal-match',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'PocketAI',
    category: 'AI Agent',
    description:
        'Gemini-powered agent app that calls tools (weather, calculator) to answer questions.',
    tech: ['Flutter', 'Gemini API', 'Tool Calling'],
    highlights: ['LLM tool / function calling', 'Weather and calculator tools'],
    color: Color(0xFFDB2777),
    url: 'https://github.com/Whoami-jj/pocket-ai',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Pocket Tools',
    category: 'Utilities',
    description: 'Multi-tool app with 20+ everyday utilities in one place.',
    tech: ['Flutter', 'QR Scanner', 'Local Storage'],
    highlights: [
      'QR generator and scanner',
      'Password generator',
      'Unit converter + 17 more tools',
    ],
    color: Color(0xFF0891B2),
    note: 'Personal project',
  ),
  Project(
    title: 'Sneaker Shop',
    category: 'E-Commerce',
    description:
        'E-commerce app for sneaker fans with curated Nike and Jordan collections.',
    tech: ['Flutter', 'Stripe', 'REST API'],
    highlights: ['Modern UI/UX', 'Size selection', 'Coupon integration'],
    color: Color(0xFFD97706),
    url: 'https://github.com/Whoami-jj/SneakerShop',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Portfolio App',
    category: 'Mobile App',
    description:
    'Cross-platform portfolio app with light and dark themes, Riverpod state management and go_router navigation, released as an APK through an automated pipeline.',
    tech: ['Flutter', 'Riverpod', 'go_router', 'GitHub Actions'],
    highlights: [
      'Material 3 design with theme toggle',
      'Tag-triggered APK releases',
      'Open source on GitHub',
    ],
    color: Color(0xFF0B6E6B),
    url: 'https://github.com/Whoami-jj/portfolio-app',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Portfolio Website',
    category: 'Web',
    description:
    'Responsive Flutter web showcase of my work, with light and dark themes, deployed automatically to Netlify.',
    tech: ['Flutter Web', 'GitHub Actions', 'Netlify'],
    highlights: [
      'Auto-deploys on every push to main',
      'Light and dark themes',
      'Responsive for phone and desktop',
    ],
    color: Color(0xFF6366F1),
    url: 'https://github.com/Whoami-jj/junaid-portfolio-web',
    linkLabel: 'View on GitHub',
  ),
];

const _storeApps = <StoreApp>[
  StoreApp(
    'Inspire Uplift Marketplace',
    'E-commerce app with 20M+ products, 55,000+ sellers and 2M+ customers worldwide.',
    Icons.store_rounded,
    Color(0xFF2563EB),
    'https://apps.apple.com/pk/app/inspire-uplift/id1595782662',
    'https://play.google.com/store/apps/details?id=com.inspireuplift.storefront',
  ),
  StoreApp(
    'Inspire Uplift Seller Central',
    'Seller app for inventory, orders, analytics and onboarding workflows.',
    Icons.dashboard_rounded,
    Color(0xFF0EA5E9),
    'https://apps.apple.com/pk/app/inspire-uplift-seller-central/id6449862576',
    'https://play.google.com/store/apps/details?id=com.inspireuplift.sellercentral.iu_seller_central',
  ),
];

const _skills = <String, List<String>>{
  'Languages': ['Flutter / Dart', 'Python', 'JavaScript (ES6+)', 'TypeScript'],
  'State Management': ['Bloc', 'Riverpod', 'GetX / MVVM', 'Provider'],
  'Backend & Data': [
    'Firebase',
    'Firestore',
    'Supabase',
    'REST API',
    'GraphQL',
    'WebSocket',
    'FCM',
  ],
  'Auth & Payments': [
    'Firebase Auth',
    'Google Sign-In',
    'Facebook Login',
    'Stripe',
  ],
  'Tools': [
    'Android Studio',
    'VS Code',
    'Postman',
    'Git',
    'GitHub',
    'GitLab',
    'Bitbucket',
    'Trello',
  ],
  'Design': ['UI/UX', 'Responsive Layouts', 'A/B Testing'],
};

const _sections = [
  'Home',
  'About',
  'Experience',
  'Projects',
  'Apps',
  'Contact',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  final _active = ValueNotifier<String>('Home');
  final _keys = {for (final s in _sections) s: GlobalKey()};
  final _navKeys = {for (final s in _sections) s: GlobalKey()};

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _active.addListener(_syncNav);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _active.removeListener(_syncNav);
    _scroll.dispose();
    _active.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scroll.hasClients) return;
    final pos = _scroll.position;
    if (pos.pixels >= pos.maxScrollExtent - 40) {
      _active.value = _sections.last;
      return;
    }
    final h = MediaQuery.sizeOf(context).height;
    var current = _sections.first;
    for (final s in _sections) {
      final box = _keys[s]!.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= h * 0.4) current = s;
    }
    _active.value = current;
  }

  void _syncNav() {
    final c = _navKeys[_active.value]?.currentContext;
    if (c != null) {
      Scrollable.ensureVisible(
        c,
        alignment: 0.5,
        duration: const Duration(milliseconds: 250),
      );
    }
  }

  void _goTo(String section) {
    if (section == 'Home') {
      _scroll.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      return;
    }
    final ctx = _keys[section]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return Scaffold(
      backgroundColor: p.bg,
      appBar: _nav(context, p),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Column(
          children: [
            _hero(context, p),
            _Section(
              key: _keys['About'],
              eyebrow: 'Background & skills',
              title: 'About Me',
              tinted: true,
              child: _about(p),
            ),
            _Section(
              key: _keys['Experience'],
              eyebrow: 'Professional journey',
              title: 'Work Experience',
              child: Column(
                children: [for (final j in _jobs) _JobCard(job: j)],
              ),
            ),
            _Section(
              key: _keys['Projects'],
              eyebrow: 'What I\'ve built',
              title: 'Featured Projects',
              tinted: true,
              child: LayoutBuilder(
                builder: (_, c) => _grid(c, [
                  for (final pr in _projects) _ProjectCard(project: pr),
                ]),
              ),
            ),
            _Section(
              key: _keys['Apps'],
              eyebrow: 'Live on App Store & Google Play',
              title: 'Published Apps',
              child: LayoutBuilder(
                builder: (_, c) => _grid(c, [
                  for (final a in _storeApps) _StoreAppCard(app: a),
                ]),
              ),
            ),
            _Section(
              key: _keys['Contact'],
              eyebrow: 'Open to opportunities',
              title: 'Let\'s Work Together',
              tinted: true,
              child: _contact(p),
            ),
            _footer(p),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _nav(BuildContext context, Pal p) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: p.bg,
          border: Border(bottom: BorderSide(color: p.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [p.accent, p.accent2]),
              ),
              child: const Text(
                'JA',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ValueListenableBuilder<String>(
                  valueListenable: _active,
                  builder: (_, active, __) => Row(
                    children: [
                      for (final s in _sections)
                        _NavItem(
                          key: _navKeys[s],
                          label: s,
                          active: s == active,
                          onTap: () => _goTo(s),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              tooltip: isDark ? 'Light mode' : 'Dark mode',
              onPressed: () =>
                  themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark,
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: p.text2,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hero(BuildContext context, Pal p) {
    final wide = MediaQuery.sizeOf(context).width > 768;
    const stats = [
      ('3+', 'Years Experience'),
      ('2', 'Apps on the Stores'),
      ('2M+', 'Customers Served'),
      ('8', 'Projects'),
    ];

    return Container(
      key: _keys['Home'],
      width: double.infinity,
      constraints: BoxConstraints(minHeight: wide ? 620 : 540),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: wide ? 96 : 56),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.8, -1),
          radius: 1.3,
          colors: [p.accent.withValues(alpha: 0.14), Colors.transparent],
        ),
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (_, v, child) => Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, (1 - v) * 18),
            child: child,
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _StatusBadge(),
              const SizedBox(height: 26),
              Text(
                Profile.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: wide ? 64 : 40,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: -1.5,
                  color: p.text,
                ),
              ),
              const SizedBox(height: 10),
              ShaderMask(
                shaderCallback: (b) => LinearGradient(
                  colors: [p.accent, p.accent2],
                ).createShader(b),
                child: Text(
                  Profile.role,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: wide ? 32 : 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'I build fast, scalable cross-platform apps with Flutter, '
                'Firebase and clean architecture — including two live apps '
                'serving 2M+ customers.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, height: 1.7, color: p.text2),
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _Btn(
                    label: 'Contact Me',
                    icon: Icons.email_rounded,
                    filled: true,
                    onTap: () => openUrl('mailto:${Profile.email}'),
                  ),
                  _Btn(
                    label: 'Download CV',
                    icon: Icons.download_rounded,
                    onTap: openCv,
                  ),
                  _Btn(
                    label: 'GitHub',
                    icon: Icons.code_rounded,
                    onTap: () => openUrl(Profile.github),
                  ),
                  _Btn(
                    label: 'LinkedIn',
                    icon: Icons.work_rounded,
                    onTap: () => openUrl(Profile.linkedin),
                  ),
                ],
              ),
              const SizedBox(height: 52),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 36,
                runSpacing: 20,
                children: [
                  for (final s in stats)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          s.$1,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: p.accent,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          s.$2,
                          style: TextStyle(fontSize: 12, color: p.muted),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _about(Pal p) {
    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HoverCard(
          accent: p.accent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Self-motivated Flutter developer with a track record of shipping '
                'scalable, high-performance mobile apps to the App Store and Google Play.',
                style: TextStyle(fontSize: 15, height: 1.8, color: p.text2),
              ),
              const SizedBox(height: 14),
              Text(
                'Specialised in cross-platform development: state management, '
                'Firebase integration and intuitive UX, with a focus on clean, '
                'maintainable code.',
                style: TextStyle(fontSize: 15, height: 1.8, color: p.text2),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.location_on_rounded, size: 16, color: p.accent),
                  const SizedBox(width: 8),
                  Text(
                    'Faisalabad, Pakistan',
                    style: TextStyle(fontSize: 14, color: p.text2),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _HoverCard(
          accent: const Color(0xFF7C3AED),
          child: _IconLine(
            icon: Icons.school_rounded,
            color: const Color(0xFF7C3AED),
            title: 'BS Software Engineering',
            subtitle: 'Riphah International University · 2020 - 2024',
          ),
        ),
        const SizedBox(height: 16),
        const _HoverCard(
          accent: Color(0xFFA855F7),
          child: _IconLine(
            icon: Icons.workspace_premium_rounded,
            color: Color(0xFFA855F7),
            title: 'Flutter & Dart Development Bootcamp',
            subtitle: 'Udemy',
          ),
        ),
        const SizedBox(height: 16),
        const _HoverCard(
          accent: Color(0xFF06B6D4),
          child: _IconLine(
            icon: Icons.cloud_done_rounded,
            color: Color(0xFF06B6D4),
            title: 'Firebase & API Integration',
            subtitle: 'Online course',
          ),
        ),
      ],
    );

    final right = _HoverCard(
      accent: p.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: p.text,
            ),
          ),
          const SizedBox(height: 18),
          for (final e in _skills.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.key.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: p.muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final s in e.value) _Chip(label: s, color: p.accent),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (_, c) {
        if (c.maxWidth > 768) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: left),
              const SizedBox(width: 24),
              Expanded(child: right),
            ],
          );
        }
        return Column(children: [left, const SizedBox(height: 20), right]);
      },
    );
  }

  Widget _contact(Pal p) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 640),
      child: Column(
        children: [
          Text(
            'I\'m available for full-time roles and freelance work. '
            'The fastest way to reach me is email.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.7, color: p.text2),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _Btn(
                label: Profile.email,
                icon: Icons.email_rounded,
                filled: true,
                onTap: () => openUrl('mailto:${Profile.email}'),
              ),
              _Btn(
                label: 'Download CV',
                icon: Icons.download_rounded,
                onTap: openCv,
              ),
              _Btn(
                label: 'LinkedIn',
                icon: Icons.work_rounded,
                onTap: () => openUrl(Profile.linkedin),
              ),
              _Btn(
                label: 'GitHub',
                icon: Icons.code_rounded,
                onTap: () => openUrl(Profile.github),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footer(Pal p) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: p.border)),
      ),
      child: Text(
        '© 2026 ${Profile.name} · Built with Flutter 💙',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: p.muted),
      ),
    );
  }
}

Widget _grid(
  BoxConstraints c,
  List<Widget> items, {
  int cols = 2,
  double gap = 20,
}) {
  if (c.maxWidth < 760) cols = 1;
  final rows = <Widget>[];
  for (var i = 0; i < items.length; i += cols) {
    final slice = items.sublist(i, math.min(i + cols, items.length));
    rows.add(
      Padding(
        padding: EdgeInsets.only(bottom: gap),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < cols; j++) ...[
                if (j > 0) SizedBox(width: gap),
                Expanded(child: j < slice.length ? slice[j] : const SizedBox()),
              ],
            ],
          ),
        ),
      ),
    );
  }
  return Column(children: rows);
}

class _Section extends StatelessWidget {
  final String title, eyebrow;
  final Widget child;
  final bool tinted;

  const _Section({
    super.key,
    required this.title,
    required this.eyebrow,
    required this.child,
    this.tinted = false,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
        color: tinted ? p.surface.withValues(alpha: 0.5) : null,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: p.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: p.accent.withValues(alpha: 0.25)),
                  ),
                  child: Text(
                    eyebrow.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.4,
                      color: p.accent,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.8,
                    height: 1.1,
                    color: p.text,
                  ),
                ),
                const SizedBox(height: 44),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: active
                ? p.accent.withValues(alpha: 0.14)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: active
                  ? p.accent.withValues(alpha: 0.4)
                  : Colors.transparent,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              color: active ? p.accent : p.text2,
            ),
          ),
        ),
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  final Color accent;
  final double padding;

  const _HoverCard({
    required this.child,
    required this.accent,
    this.padding = 24,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
          color: p.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover ? widget.accent.withValues(alpha: 0.5) : p.border,
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: widget.accent.withValues(alpha: 0.12),
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}

class _IconLine extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title, subtitle;

  const _IconLine({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: p.text,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;

  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF059669).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF059669).withValues(alpha: 0.3),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 4, backgroundColor: Color(0xFF34D399)),
          SizedBox(width: 8),
          Text(
            'Available for opportunities',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF34D399),
            ),
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final Color? color;

  const _Btn({
    required this.label,
    required this.icon,
    required this.onTap,
    this.filled = false,
    this.color,
  });

  @override
  State<_Btn> createState() => _BtnState();
}

class _BtnState extends State<_Btn> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final filled = widget.filled;
    final fg = filled ? Colors.white : p.text2;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: filled && widget.color == null
                ? LinearGradient(colors: [p.accent, p.accent2])
                : null,
            color: filled
                ? widget.color
                : (_hover
                      ? p.accent.withValues(alpha: 0.08)
                      : Colors.transparent),
            border: filled ? null : Border.all(color: p.border),
            boxShadow: filled && _hover
                ? [
                    BoxShadow(
                      color: (widget.color ?? p.accent).withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: fg),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: fg,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final Job job;

  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: _HoverCard(
        accent: job.color,
        padding: 28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.role,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: p.text,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _Chip(label: job.company, color: job.color),
                _Chip(label: job.period, color: job.color),
                _Chip(label: job.location, color: p.muted),
              ],
            ),
            const SizedBox(height: 18),
            for (final a in job.points)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: job.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        a,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: p.text2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final d = project;
    return _HoverCard(
      accent: d.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Chip(label: d.category, color: d.color),
          const SizedBox(height: 12),
          Text(
            d.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: p.text,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            d.description,
            style: TextStyle(fontSize: 14, height: 1.6, color: p.text2),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final t in d.tech) _Chip(label: t, color: p.accent),
            ],
          ),
          const SizedBox(height: 14),
          for (final h in d.highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: d.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      h,
                      style: TextStyle(fontSize: 13, color: p.muted),
                    ),
                  ),
                ],
              ),
            ),
          if (d.url != null) ...[
            const SizedBox(height: 14),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => openUrl(d.url!),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.open_in_new_rounded, size: 16, color: d.color),
                    const SizedBox(width: 6),
                    Text(
                      d.linkLabel ?? 'View project',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: d.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else if (d.note != null) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                Icon(Icons.lock_outline_rounded, size: 15, color: p.muted),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    d.note!,
                    style: TextStyle(fontSize: 13, color: p.muted),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StoreAppCard extends StatelessWidget {
  final StoreApp app;

  const _StoreAppCard({required this.app});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return _HoverCard(
      accent: app.color,
      padding: 28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: app.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(app.icon, color: app.color, size: 26),
          ),
          const SizedBox(height: 16),
          Text(
            app.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: p.text,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            app.description,
            style: TextStyle(fontSize: 14, height: 1.6, color: p.text2),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _Btn(
                label: 'App Store',
                icon: Icons.apple_rounded,
                filled: true,
                color: const Color(0xFF111827),
                onTap: () => openUrl(app.ios),
              ),
              _Btn(
                label: 'Google Play',
                icon: Icons.android_rounded,
                filled: true,
                color: const Color(0xFF00A58E),
                onTap: () => openUrl(app.android),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
