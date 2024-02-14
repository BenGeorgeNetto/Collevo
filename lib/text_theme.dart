import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  const CustomTextTheme()
      : super(
          displayLarge: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          displayMedium: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          displaySmall: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          titleLarge: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          titleMedium: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 24,
          ),
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'FiraCode',
          ),
          bodySmall: const TextStyle(
            fontFamily: 'FiraCode',
          ),
          headlineLarge: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: const TextStyle(fontFamily: 'FiraCode', fontSize: 24),
          labelMedium: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 18,
          ),
          labelSmall: const TextStyle(
            fontFamily: 'FiraCode',
            fontSize: 14,
          ),
        );
}
