import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../core/utils/launch.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/hover_card.dart';
import '../../../models/store_app.dart';

class StoreAppCard extends StatelessWidget {
  final StoreApp app;

  const StoreAppCard({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
    return HoverCard(
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
              AppButton(
                label: 'App Store',
                icon: Icons.apple_rounded,
                filled: true,
                color: const Color(0xFF111827),
                onTap: () => openUrl(app.ios),
              ),
              AppButton(
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
