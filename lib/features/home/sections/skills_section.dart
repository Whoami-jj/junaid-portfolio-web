import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/skills.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return LayoutBuilder(
      builder: (_, c) {
        final entries = skillGroups.entries.toList();
        final columns = c.maxWidth >= 900 ? 2 : 1;
        final rows = <Widget>[];

        for (var i = 0; i < entries.length; i += columns) {
          final row = entries.sublist(i, math.min(i + columns, entries.length));
          rows.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var j = 0; j < columns; j++) ...[
                      if (j > 0) const SizedBox(width: 20),
                      Expanded(
                        child: j < row.length
                            ? Reveal(
                                delay: Duration(milliseconds: 120 * (i + j)),
                                child: SkillCard(
                                  title: row[j].key,
                                  skills: row[j].value,
                                  accent: p.accent,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }

        return Column(children: rows);
      },
    );
  }
}
