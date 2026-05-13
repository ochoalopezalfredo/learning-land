import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Duolingo-style primary colors
  static const Color primary = Color(0xFF58CC02); // Verde Duolingo
  static const Color primaryDark = Color(0xFF4BA700);
  static const Color primaryLight = Color(0xFF7BDF1F);

  // Secondary colors
  static const Color purple = Color(0xFF8854D0); // Morado Duolingo
  static const Color purpleLight = Color(0xFF9B72D6);
  static const Color purpleDark = Color(0xFF6A43A8);

  // Accent colors
  static const Color yellow = Color(0xFFFFD800); // Amarillo Duolingo
  static const Color orange = Color(0xFFFF7849); // Naranja Duolingo
  static const Color red = Color(0xFFFF4B4B); // Rojo (equivocado)
  static const Color blue = Color(0xFF1CB0F6); // Azul

  // Background colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF3C3C3C);
  static const Color textSecondary = Color(0xFF777777);
  static const Color textLight = Color(0xFFFFFFFF);

  // Gamification colors
  static const Color xpGold = Color(0xFFFFD700);
  static const Color streakFire = Color(0xFFFF6B35);
  static const Color levelPurple = Color(0xFF8854D0);
  static const Color correctGreen = Color(0xFF58CC02);
  static const Color incorrectRed = Color(0xFFFF4B4B);

  // Reading level colors (progresive)
  static const List<Color> levelColors = [
    Color(0xFF58CC02), // Verde
    Color(0xFF1CB0F6), // Azul
    Color(0xFF8854D0), // Morado
    Color(0xFFFF7849), // Naranja
    Color(0xFFFF4B4B), // Rojo
    Color(0xFFFFD800), // Amarillo
    Color(0xFF1DD9A3), // Teal
    Color(0xFFFF69B4), // Rosa
  ];

  // Avatar colors
  static const List<Color> avatarColors = [
    Color(0xFF58CC02),
    Color(0xFF1CB0F6),
    Color(0xFF8854D0),
    Color(0xFFFF7849),
    Color(0xFFFF4B4B),
    Color(0xFFFFD800),
    Color(0xFF1DD9A3),
    Color(0xFFFF69B4),
  ];
}