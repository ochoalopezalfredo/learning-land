import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Roboto';

  // Headings - grandes y legibles para niños
  static const TextStyle displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Word display (palabras en modo lectura)
  static const TextStyle wordDisplay = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 4,
  );

  // Math problem display
  static const TextStyle mathDisplay = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Headlines
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Button text
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );

  // XP and stats
  static const TextStyle xpText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.xpGold,
  );

  static const TextStyle streakText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.streakFire,
  );

  // Level indicator
  static const TextStyle levelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.levelPurple,
  );
}