import 'package:flutter/material.dart';
import 'pal.dart';

ThemeData buildTheme(Brightness b) {
  final p = b == Brightness.dark ? Pal.dark : Pal.light;
  return ThemeData(
    useMaterial3: true,
    brightness: b,
    scaffoldBackgroundColor: p.bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: p.accent,
      brightness: b,
    ).copyWith(primary: p.accent, secondary: p.accent2, surface: p.surface),
  );
}
