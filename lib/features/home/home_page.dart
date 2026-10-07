import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/pal.dart';
import '../../core/widgets/page_section.dart';
import '../../core/widgets/reveal.dart';
import '../../data/jobs.dart';
import '../../data/projects.dart';
import '../../data/site_config.dart';
import '../../data/store_apps.dart';
import '../../providers/theme_provider.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/skills_section.dart';
import 'widgets/job_card.dart';
import 'widgets/nav_item.dart';
import 'widgets/project_card.dart';
import 'widgets/store_app_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scroll = ScrollController();
  final _active = ValueNotifier<String>('Home');
  final _progress = ValueNotifier<double>(0);
  final _showTop = ValueNotifier<bool>(false);
  final _keys = {for (final s in sectionNames) s: GlobalKey()};
  final _navKeys = {for (final s in sectionNames) s: GlobalKey()};

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
    _progress.dispose();
    _showTop.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scroll.hasClients) return;
    final pos = _scroll.position;

    final max = pos.maxScrollExtent;
    _progress.value = max > 0 ? (pos.pixels / max).clamp(0.0, 1.0) : 0;
    _showTop.value = pos.pixels > 600;

    if (pos.pixels >= max - 40) {
      _active.value = sectionNames.last;
      return;
    }
    final h = MediaQuery.sizeOf(context).height;
    var current = sectionNames.first;
    for (final s in sectionNames) {
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
      _scrollTop();
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

  void _scrollTop() => _scroll.animateTo(
    0,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOutCubic,
  );

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return Container(
      color: p.bg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: p.bg,
          appBar: _nav(context, p),
          floatingActionButton: ValueListenableBuilder<bool>(
            valueListenable: _showTop,
            builder: (_, show, __) => AnimatedScale(
              scale: show ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: FloatingActionButton.small(
                tooltip: 'Back to top',
                backgroundColor: p.accent,
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                onPressed: _scrollTop,
                child: const Icon(Icons.keyboard_arrow_up_rounded),
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                HeroSection(key: _keys['Home']),
                PageSection(
                  key: _keys['About'],
                  eyebrow: 'Background and education',
                  title: 'About Me',
                  child: const AboutSection(),
                ),
                PageSection(
                  key: _keys['Experience'],
                  eyebrow: 'Professional journey',
                  title: 'Work Experience',
                  tinted: true,
                  child: Column(
                    children: [
                      for (var i = 0; i < jobs.length; i++)
                        Reveal(
                          delay: Duration(milliseconds: 120 * i),
                          child: JobCard(job: jobs[i]),
                        ),
                    ],
                  ),
                ),
                PageSection(
                  key: _keys['Apps'],
                  eyebrow: 'Real products in production',
                  title: 'Published Applications',
                  child: LayoutBuilder(
                    builder: (_, c) => buildGrid(c, [
                      for (final a in storeApps) StoreAppCard(app: a),
                    ]),
                  ),
                ),
                PageSection(
                  key: _keys['Projects'],
                  eyebrow: 'Company work, personal projects and AI experiments',
                  title: 'Selected Projects',
                  tinted: true,
                  child: LayoutBuilder(
                    builder: (_, c) => buildGrid(c, [
                      for (final pr in projects) ProjectCard(project: pr),
                    ]),
                  ),
                ),
                PageSection(
                  key: _keys['Skills'],
                  eyebrow: 'Tools, technologies and strengths',
                  title: 'Technical Skills',
                  child: const SkillsSection(),
                ),
                PageSection(
                  key: _keys['Contact'],
                  eyebrow: 'Have a project or opportunity?',
                  title: 'Let\'s Work Together',
                  tinted: true,
                  child: const ContactSection(),
                ),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _nav(BuildContext context, Pal p) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PreferredSize(
      preferredSize: const Size.fromHeight(62),
      child: Container(
        decoration: BoxDecoration(
          color: p.bg,
          border: Border(bottom: BorderSide(color: p.border)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: _scrollTop,
                        child: Container(
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: p.gradient,
                            boxShadow: [
                              BoxShadow(color: p.glow, blurRadius: 14),
                            ],
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
                              for (final s in sectionNames)
                                NavItem(
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
                          ref.read(themeModeProvider.notifier).toggle(isDark),
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: p.text2,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2,
              child: ValueListenableBuilder<double>(
                valueListenable: _progress,
                builder: (_, v, __) => Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: v,
                    child: Container(
                      decoration: BoxDecoration(gradient: p.gradient),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
