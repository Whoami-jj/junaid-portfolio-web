import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/utils/launch.dart';
import '../../../core/widgets/app_button.dart';
import '../../../data/profile.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 44),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              p.accent.withValues(alpha: 0.14),
              p.accent2.withValues(alpha: 0.06),
            ],
          ),
          border: Border.all(color: p.accent.withValues(alpha: 0.3)),
          boxShadow: [BoxShadow(color: p.glow, blurRadius: 40)],
        ),
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
                AppButton(
                  label: Profile.email,
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
                  label: 'LinkedIn',
                  icon: Icons.work_rounded,
                  onTap: () => openUrl(Profile.linkedin),
                ),
                AppButton(
                  label: 'GitHub',
                  icon: Icons.code_rounded,
                  onTap: () => openUrl(Profile.github),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
