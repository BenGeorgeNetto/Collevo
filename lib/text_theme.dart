import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  const CustomTextTheme()
      : super(
          displayLarge: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          displayMedium: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          displaySmall: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          titleMedium: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
          ),
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans',
          ),
          bodySmall: const TextStyle(
            fontFamily: 'OpenSans',
          ),
          headlineLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
          ),
          labelMedium: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
          ),
          labelSmall: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 14,
          ),
        );
}
