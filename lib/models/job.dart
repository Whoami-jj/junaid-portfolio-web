import 'package:flutter/material.dart';

class Job {
  final String role, company, period, location;
  final Color color;
  final List<String> points;

  const Job(
    this.role,
    this.company,
    this.period,
    this.location,
    this.color,
    this.points,
  );
}
