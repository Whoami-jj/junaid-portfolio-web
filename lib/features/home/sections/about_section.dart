import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../core/widgets/reveal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final intro = HoverCard(
      accent: p.accent,
      padding: 28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I\'m a Flutter developer focused on building reliable, scalable '
            'and polished cross-platform applications.',
            style: TextStyle(
              fontSize: 20,
              height: 1.55,
              fontWeight: FontWeight.w700,
              color: p.text,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'My experience spans production e-commerce, social and live-streaming '
            'products, AI-powered applications and developer-focused tools. '
            'I enjoy turning product requirements into maintainable interfaces '
            'and dependable user experiences.',
            style: TextStyle(fontSize: 15, height: 1.8, color: p.text2),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppChip(label: 'Flutter', color: p.accent),
              AppChip(label: 'Dart', color: p.accent),
              AppChip(label: 'Firebase', color: p.accent2),
              AppChip(label: 'State Management', color: p.accent2),
              AppChip(label: 'Production Apps', color: p.accent2),
            ],
          ),
        ],
      ),
    );

    final education = Column(
      children: [
        HoverCard(
          accent: const Color(0xFF7C3AED),
          child: IconLine(
            icon: Icons.school_rounded,
            color: const Color(0xFF7C3AED),
            title: 'BS Software Engineering',
            subtitle: 'Riphah International University · 2020 - 2024',
          ),
        ),
        const SizedBox(height: 16),
        const HoverCard(
          accent: Color(0xFFA855F7),
          child: IconLine(
            icon: Icons.workspace_premium_rounded,
            color: Color(0xFFA855F7),
            title: 'Flutter & Dart Development Bootcamp',
            subtitle: 'Udemy',
          ),
        ),
        const SizedBox(height: 16),
        const HoverCard(
          accent: Color(0xFF06B6D4),
          child: IconLine(
            icon: Icons.cloud_done_rounded,
            color: Color(0xFF06B6D4),
            title: 'Firebase & API Integration',
            subtitle: 'Online course',
          ),
        ),
      ],
    );

    final introR = Reveal(child: intro);
    final eduR = Reveal(
      delay: const Duration(milliseconds: 200),
      from: const Offset(0.06, 0),
      child: education,
    );

    return LayoutBuilder(
      builder: (_, c) {
        if (c.maxWidth > 768) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: introR),
              const SizedBox(width: 24),
              Expanded(flex: 4, child: eduR),
            ],
          );
        }
        return Column(children: [introR, const SizedBox(height: 20), eduR]);
      },
    );
  }
}

class IconLine extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title, subtitle;

  const IconLine({
    super.key,
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
