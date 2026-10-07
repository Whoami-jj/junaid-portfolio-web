import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/utils/launch.dart';
import '../../../core/widgets/app_button.dart';
import '../../../data/profile.dart';
import '../../../data/site_config.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final wide = MediaQuery.sizeOf(context).width > 768;
    const stats = <(num, String, String)>[
      (2.5, '+', 'Years Experience'),
      (2, '', 'Apps on the Stores'),
      (2, 'M+', 'Customers Served'),
      (10, '+', 'Projects'),
    ];

    return Stack(
      children: [
        const Positioned.fill(child: HeroBackdrop()),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: wide ? 640 : 560),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: wide ? 96 : 56,
          ),
          alignment: Alignment.center,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            builder: (_, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, (1 - v) * 20),
                child: child,
              ),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 860),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const StatusBadge(),
                  const SizedBox(height: 28),
                  Text(
                    Profile.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: wide ? 68 : 42,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      letterSpacing: -1.8,
                      color: p.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ShaderMask(
                    shaderCallback: (b) => p.gradient.createShader(b),
                    child: Text(
                      Profile.role,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: wide ? 34 : 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextRotator(
                    lines: taglines,
                    style: TextStyle(
                      fontSize: wide ? 18 : 15,
                      fontWeight: FontWeight.w500,
                      color: p.text,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'I build production-ready mobile and web experiences with Flutter, '
                    'focused on clean architecture, scalable state management, '
                    'Firebase integrations and polished user experiences.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.7, color: p.text2),
                  ),
                  const SizedBox(height: 36),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      AppButton(
                        label: 'Contact Me',
                        icon: Icons.email_rounded,
                        filled: true,
                        onTap: () => openUrl('mailto:${Profile.email}'),
                      ),
                      AppButton(
                        label: 'Download CV',
                        icon: Icons.download_rounded,
                        onTap: openCv,
                      ),
                      AppButton(
                        label: 'GitHub',
                        icon: Icons.code_rounded,
                        onTap: () => openUrl(Profile.github),
                      ),
                      AppButton(
                        label: 'LinkedIn',
                        icon: Icons.work_rounded,
                        onTap: () => openUrl(Profile.linkedin),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 18,
                    runSpacing: 16,
                    children: [
                      for (final s in stats)
                        CountStat(value: s.$1, suffix: s.$2, label: s.$3),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeroBackdrop extends StatefulWidget {
  const HeroBackdrop({super.key});

  @override
  State<HeroBackdrop> createState() => _BackdropState();
}

class _BackdropState extends State<HeroBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 14),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _c.stop();
    } else if (!_c.isAnimating) {
      _c.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Widget _orb(Color c, double size) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [c.withValues(alpha: 0.22), c.withValues(alpha: 0)],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return IgnorePointer(
      child: RepaintBoundary(
        child: ClipRect(
          child: AnimatedBuilder(
            animation: _c,
            builder: (_, __) {
              final t = Curves.easeInOut.transform(_c.value);
              return Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.9 + 0.5 * t, -0.8 + 0.3 * t),
                    child: _orb(p.accent, 420),
                  ),
                  Align(
                    alignment: Alignment(0.9 - 0.5 * t, 0.7 - 0.3 * t),
                    child: _orb(p.accent2, 340),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class TextRotator extends StatefulWidget {
  final List<String> lines;
  final TextStyle style;

  const TextRotator({super.key, required this.lines, required this.style});

  @override
  State<TextRotator> createState() => _RotatorState();
}

class _RotatorState extends State<TextRotator> {
  int _i = 0;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _t = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) setState(() => _i = (_i + 1) % widget.lines.length);
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, anim) => FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.4),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        ),
        child: Text(
          widget.lines[_i],
          key: ValueKey(_i),
          textAlign: TextAlign.center,
          style: widget.style,
        ),
      ),
    );
  }
}

class CountStat extends StatelessWidget {
  final num value;
  final String suffix, label;

  const CountStat({
    super.key,
    required this.value,
    required this.suffix,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final decimals = value % 1 == 0 ? 0 : 1;
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: p.card.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: p.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value.toDouble()),
            duration: const Duration(milliseconds: 1400),
            curve: Curves.easeOutCubic,
            builder: (_, v, __) => ShaderMask(
              shaderCallback: (b) => p.gradient.createShader(b),
              child: Text(
                '${v.toStringAsFixed(decimals)}$suffix',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: p.muted),
          ),
        ],
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Pal.of(context).success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: c.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 4, backgroundColor: c),
          const SizedBox(width: 8),
          Text(
            'Available for opportunities',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: c,
            ),
          ),
        ],
      ),
    );
  }
}
