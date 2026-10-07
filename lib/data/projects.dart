import 'package:flutter/material.dart';
import '../models/project.dart';

const projects = <Project>[
  Project(
    title: 'Live Streaming & Social Platform',
    category: 'Live Streaming',
    description:
        'Real-time social engagement platform with live streaming, chat, audio/video calls, and integrated payments.',
    tech: ['Flutter', 'WebSocket', 'Firebase', 'REST API', 'Payment Gateway'],
    highlights: [
      'Real-time chat, audio & video interactions',
      'Live streaming with audience participation',
      'Secure payment gateway integration',
      'In-app customer support ticket system',
    ],
    color: Color(0xFFE11D48),
    note: 'Company project — source not public',
  ),
  Project(
    title: 'Sonata Social Media App',
    category: 'Social Platform',
    description:
        'Full-featured social platform with real-time posting, commenting, and engagement features.',
    tech: ['Flutter', 'Firebase Firestore', 'Auth'],
    highlights: [
      'Secure OTP authentication',
      'Real-time updates',
      'Enhanced security',
    ],
    color: Color(0xFF7C3AED),
    note: 'Company project — source not public',
  ),
  Project(
    title: 'Meal Match (FYP)',
    category: 'Health & Fitness',
    description:
        'AI-powered nutritionist app that tracks food habits and gives personalized diet recommendations.',
    tech: ['Flutter', 'AI Integration', 'Firebase'],
    highlights: [
      'AI consultation features',
      'Calorie calculator and food log',
      'Dietitian consultation',
    ],
    color: Color(0xFF059669),
    url: 'https://github.com/Whoami-jj/MealMatch',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'AI Study Buddy',
    category: 'Education',
    description:
        'AI study app that turns notes, PDFs and photos into flashcards and quizzes, then schedules reviews with spaced repetition.',
    tech: ['Flutter', 'Riverpod', 'Hive', 'Gemini API', 'ML Kit OCR'],
    highlights: [
      'Flashcards and quizzes from text, PDF or photo',
      'SM-2 spaced repetition, daily goal and streaks',
      'Saved decks work offline',
    ],
    color: Color(0xFF65A30D),
    url: 'https://github.com/Whoami-jj/ai_study_buddy',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'PocketAI',
    category: 'AI Agent',
    description:
        'Gemini-powered agent app that calls tools (weather, calculator) to answer questions.',
    tech: ['Flutter', 'Gemini API', 'Tool Calling'],
    highlights: ['LLM tool / function calling', 'Weather and calculator tools'],
    color: Color(0xFFDB2777),
    url: 'https://github.com/Whoami-jj/pocket-ai',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Pocket Tools',
    category: 'Utilities',
    description: 'Multi-tool app with 20+ everyday utilities in one place.',
    tech: ['Flutter', 'QR Scanner', 'Local Storage'],
    highlights: [
      'QR generator and scanner',
      'Password generator',
      'Unit converter + 17 more tools',
    ],
    color: Color(0xFF0891B2),
    note: 'Personal project',
  ),
  Project(
    title: 'Sneaker Shop',
    category: 'E-Commerce',
    description:
        'E-commerce app for sneaker fans with curated Nike and Jordan collections.',
    tech: ['Flutter', 'Stripe', 'REST API'],
    highlights: ['Modern UI/UX', 'Size selection', 'Coupon integration'],
    color: Color(0xFFD97706),
    url: 'https://github.com/Whoami-jj/SneakerShop',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Portfolio App',
    category: 'Mobile App',
    description:
        'Cross-platform portfolio app with light and dark themes, Riverpod state management and go_router navigation, released as an APK through an automated pipeline.',
    tech: ['Flutter', 'Riverpod', 'go_router', 'GitHub Actions'],
    highlights: [
      'Material 3 design with theme toggle',
      'Tag-triggered APK releases',
      'Open source on GitHub',
    ],
    color: Color(0xFF0B6E6B),
    url: 'https://github.com/Whoami-jj/portfolio-app',
    linkLabel: 'View on GitHub',
  ),
  Project(
    title: 'Portfolio Website',
    category: 'Web',
    description:
        'Responsive Flutter web showcase of my work, with light and dark themes, deployed automatically to Netlify.',
    tech: ['Flutter Web', 'GitHub Actions', 'Netlify'],
    highlights: [
      'Auto-deploys on every push to main',
      'Light and dark themes',
      'Responsive for phone and desktop',
    ],
    color: Color(0xFF6366F1),
    url: 'https://github.com/Whoami-jj/junaid-portfolio-web',
    linkLabel: 'View on GitHub',
  ),
];
