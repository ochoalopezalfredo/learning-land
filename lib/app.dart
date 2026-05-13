import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/reading/presentation/reading_screen.dart';
import 'features/math/presentation/math_screen.dart';
import 'features/profile/presentation/profile_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/reading/:level',
      builder: (context, state) {
        final level = int.tryParse(state.pathParameters['level'] ?? '1') ?? 1;
        return ReadingScreen(level: level);
      },
    ),
    GoRoute(
      path: '/math/:level',
      builder: (context, state) {
        final level = int.tryParse(state.pathParameters['level'] ?? '1') ?? 1;
        return MathScreen(level: level);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

class LearniaApp extends ConsumerWidget {
  const LearniaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Learnia',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}