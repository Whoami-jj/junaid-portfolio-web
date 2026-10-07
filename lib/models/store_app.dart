import 'package:flutter/material.dart';

class StoreApp {
  final String title, description, ios, android;
  final IconData icon;
  final Color color;

  const StoreApp(
    this.title,
    this.description,
    this.icon,
    this.color,
    this.ios,
    this.android,
  );
}
