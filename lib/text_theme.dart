import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  const CustomTextTheme()
      : super(
          displayLarge: const TextStyle(
            fontFamily: 'Poppins',
          ),
          displayMedium: const TextStyle(
            fontFamily: 'Poppins',
          ),
          displaySmall: const TextStyle(
            fontFamily: 'Poppins',
          ),
          titleLarge: const TextStyle(
            fontFamily: 'Poppins',
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Poppins',
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
          ),
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
          bodySmall: const TextStyle(
            fontFamily: 'Poppins',
          ),
          headlineLarge: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: const TextStyle(fontFamily: 'Poppins', fontSize: 24),
          labelMedium: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
          labelSmall: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        );
}
