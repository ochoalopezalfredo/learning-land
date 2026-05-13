import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with streak and XP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Streak banner
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.streakFire.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Text(
                          '5 días',
                          style: AppTypography.streakText,
                        ),
                      ],
                    ),
                  ),
                  // XP indicator
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.xpGold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.xpGold, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          '1,250 XP',
                          style: AppTypography.xpText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Welcome text
              Text(
                '¡Hola, Pequeño! 👋',
                style: AppTypography.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '¿Qué quieres aprender hoy?',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 32),

              // Reading card
              _GameModeCard(
                title: '📚 Leer',
                subtitle: 'Aprende palabras nuevas',
                color: AppColors.primary,
                level: 3,
                totalLevels: 8,
                onTap: () => context.push('/reading/1'),
              ),

              const SizedBox(height: 16),

              // Math card
              _GameModeCard(
                title: '🔢 Matemáticas',
                subtitle: 'Sumar, restar, multiplicar',
                color: AppColors.purple,
                level: 2,
                totalLevels: 9,
                onTap: () => context.push('/math/1'),
              ),

              const Spacer(),

              // Profile button
              Center(
                child: TextButton.icon(
                  onPressed: () => context.push('/profile'),
                  icon: const Icon(Icons.person, color: AppColors.textSecondary),
                  label: Text(
                    'Mi Perfil',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final int level;
  final int totalLevels;
  final VoidCallback onTap;

  const _GameModeCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.level,
    required this.totalLevels,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  title.split(' ')[0],
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.split(' ').skip(1).join(' '),
                    style: AppTypography.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  // Level progress indicator
                  Row(
                    children: [
                      Text(
                        'Nivel $level',
                        style: AppTypography.levelText.copyWith(color: color),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'de $totalLevels',
                        style: AppTypography.bodySmall,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: level / totalLevels,
                            backgroundColor: color.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation(color),
                            minHeight: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}