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
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'Poppins',
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'Poppins',
          ),
        );
}
