import 'package:flutter/material.dart';

class Pal {
  final Color bg, surface, card, border, text, text2, muted;
  final Color accent, accent2, success, glow;

  const Pal({
    required this.bg,
    required this.surface,
    required this.card,
    required this.border,
    required this.text,
    required this.text2,
    required this.muted,
    required this.accent,
    required this.accent2,
    required this.success,
    required this.glow,
  });

  static const dark = Pal(
    bg: Color(0xFF080C14),
    surface: Color(0xFF0B1220),
    card: Color(0xFF111E35),
    border: Color(0x991E3A5F),
    text: Colors.white,
    text2: Color(0xFF94A3B8),
    muted: Color(0xFF64748B),
    accent: Color(0xFF4F8EF7),
    accent2: Color(0xFF00D9FF),
    success: Color(0xFF34D399),
    glow: Color(0x734F8EF7),
  );

  static const light = Pal(
    bg: Color(0xFFF0F4FF),
    surface: Color(0xFFE8EEFF),
    card: Colors.white,
    border: Color(0xCCBFD7FF),
    text: Color(0xFF0F172A),
    text2: Color(0xFF475569),
    muted: Color(0xFF94A3B8),
    accent: Color(0xFF2563EB),
    accent2: Color(0xFF0284C7),
    success: Color(0xFF059669),
    glow: Color(0x472563EB),
  );

  LinearGradient get gradient => LinearGradient(colors: [accent, accent2]);

  static Pal of(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark ? dark : light;
}
