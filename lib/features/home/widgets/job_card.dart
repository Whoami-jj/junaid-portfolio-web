import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../models/job.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    final current = job.period.endsWith('Present');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: HoverCard(
        accent: job.color,
        padding: 28,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [job.color, job.color.withValues(alpha: 0.15)],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
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
                        AppChip(label: job.company, color: job.color),
                        AppChip(label: job.period, color: job.color),
                        AppChip(label: job.location, color: p.muted),
                        if (current)
                          AppChip(label: 'Current', color: p.success),
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
            ],
          ),
        ),
      ),
    );
  }
}
