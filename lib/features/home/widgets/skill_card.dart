import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../data/skills.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final List<String> skills;
  final Color accent;

  const SkillCard({
    super.key,
    required this.title,
    required this.skills,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return HoverCard(
      accent: accent,
      padding: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  skillIcons[title] ?? Icons.check_rounded,
                  color: accent,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: p.text,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              for (final skill in skills) AppChip(label: skill, color: accent),
            ],
          ),
        ],
      ),
    );
  }
}
