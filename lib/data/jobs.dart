import 'package:flutter/material.dart';
import '../models/job.dart';

const jobs = <Job>[
  Job(
    'Flutter Developer',
    'Inspire Uplift IT Solutions',
    'Mar 2024 – Present',
    'Faisalabad, PK',
    Color(0xFF2563EB),
    [
      'Developed and optimized the Marketplace and Seller Central apps (2M+ users)',
      'Implemented state management for smooth performance',
      'Integrated REST APIs and Firebase Firestore for real-time updates',
      'Automated seller onboarding workflows, improving efficiency',
      'Led development of interactive analytics dashboards',
      'Ran A/B tests to improve UX metrics',
      'Fixed performance bottlenecks, reducing crash rates',
      'Built a troubleshooting protocol that reduced support tickets',
    ],
  ),
  Job(
    'Flutter Developer',
    'Hexamile',
    'Dec 2023 – Feb 2024',
    'Faisalabad, PK',
    Color(0xFF0EA5E9),
    [
      'Built core features of Sonata, a live streaming and social platform',
      'Implemented real-time chat, audio and video calls',
      'Integrated a payment gateway for secure transactions',
      'Built an in-app customer support ticket system',
      'Implemented secure auth (sign-up, login, OTP)',
      'Real-time posts and comments via Firebase Firestore',
    ],
  ),
];
