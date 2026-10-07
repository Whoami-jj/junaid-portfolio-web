import 'package:flutter/material.dart';
import '../../../core/theme/pal.dart';
import '../../../data/profile.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = Pal.of(context);
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
