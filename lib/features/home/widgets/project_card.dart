import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/utils/launch.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final d = project;
    return HoverCard(
      accent: d.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppChip(label: d.category, color: d.color),
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
              for (final t in d.tech) AppChip(label: t, color: p.accent),
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
