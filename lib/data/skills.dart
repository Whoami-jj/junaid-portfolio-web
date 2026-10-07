import 'package:flutter/material.dart';

const skillGroups = <String, List<String>>{
  'Languages': ['Flutter / Dart', 'Python', 'JavaScript (ES6+)', 'TypeScript'],
  'State Management': ['Bloc', 'Riverpod', 'GetX / MVVM', 'Provider'],
  'Backend & Data': [
    'Firebase',
    'Firestore',
    'Supabase',
    'REST API',
    'GraphQL',
    'WebSocket',
    'FCM',
  ],
  'Auth & Payments': [
    'Firebase Auth',
    'Google Sign-In',
    'Facebook Login',
    'Stripe',
    'Braintree',
  ],
  'Tools': [
    'Android Studio',
    'VS Code',
    'Postman',
    'Git',
    'GitHub',
    'GitLab',
    'Bitbucket',
    'Trello',
  ],
  'Design': ['UI/UX', 'Responsive Layouts', 'A/B Testing'],
};

const skillIcons = <String, IconData>{
  'Languages': Icons.code_rounded,
  'State Management': Icons.account_tree_rounded,
  'Backend & Data': Icons.storage_rounded,
  'Auth & Payments': Icons.lock_rounded,
  'Tools': Icons.build_rounded,
  'Design': Icons.brush_rounded,
};
