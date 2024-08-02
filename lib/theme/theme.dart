import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4CEF8A), // Основной цвет #4CEF8A
      brightness: Brightness.light,
      primary: const Color(0xFF4CEF8A), // Второй цвет #9F7BF4
      onPrimary: Colors.white, // Текст на основном цвете - белый
      secondary: const Color(0xFF9F7BF4), // Основной цвет #4CEF8A
      onSecondary: Colors.white, // Текст на втором цвете - белый
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    useMaterial3: true,
    // Добавьте стиль для кнопок
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Белый цвет,
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white)), // Белый текст
      ),
    ),
  );
}
