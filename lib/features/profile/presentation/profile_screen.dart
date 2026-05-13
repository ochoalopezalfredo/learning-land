import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Mi Perfil',
          style: AppTypography.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar and name
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('🦖', style: TextStyle(fontSize: 56)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pequeño Explorador',
                    style: AppTypography.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.levelPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Nivel 5',
                      style: AppTypography.levelText.copyWith(color: AppColors.levelPurple),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stats
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: '🔥',
                    value: '5',
                    label: 'Días de racha',
                    color: AppColors.streakFire,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    icon: '⭐',
                    value: '1,250',
                    label: 'XP Total',
                    color: AppColors.xpGold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: '📚',
                    value: '42',
                    label: 'Palabras',
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    icon: '🔢',
                    value: '38',
                    label: 'Problemas',
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Badges section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🏆 Mis Logros',
                    style: AppTypography.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _BadgeItem(emoji: '🎯', label: 'Primera palabra'),
                      _BadgeItem(emoji: '🔥', label: '7 días de racha'),
                      _BadgeItem(emoji: '⭐', label: '100 XP'),
                      _BadgeItem(emoji: '📚', label: 'Nivel 3 lectura'),
                      _BadgeItem(emoji: '🔢', label: 'Nivel 2 mates'),
                      _BadgeItem(emoji: '🏅', label: 'Principiante'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTypography.displaySmall.copyWith(color: color),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final String emoji;
  final String label;

  const _BadgeItem({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }
}