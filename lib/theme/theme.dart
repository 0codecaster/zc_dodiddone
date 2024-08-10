import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFB22222), // Основной цвет #000000
      brightness: Brightness.light,
      primary: const Color(0xFF0000FF), // Второй цвет #F4A460
      onPrimary: Colors.white, // Текст на основном цвете - белый
      secondary: const Color(0xFF8A2BE2), // Основной цвет #000000
      onSecondary: Colors.white, // Текст на втором цвете - белый
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    useMaterial3: true,
    // Добавьте стиль для кнопок
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
            const Color(0xFF8A2BE2)), // Цвет фона кнопки,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Белый цвет,
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white)), // Белый текст
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: const Color(0xFF0000FF), // Цвет выбранной иконки
      unselectedItemColor:
          const Color(0xFFB22222).withOpacity(0.5), // Цвет невыбранной иконки
      backgroundColor: Colors.transparent, // Прозрачный фон
      // Убираем тень
    ),
  );
}
