import 'package:flutter/material.dart';

class Project {
  final String title, category, description;
  final List<String> tech, highlights;
  final Color color;
  final String? url, linkLabel, note;

  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.tech,
    required this.highlights,
    required this.color,
    this.url,
    this.linkLabel,
    this.note,
  });
}
