import 'package:collevo/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:collevo/colors.dart';

class CustomTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: CustomColors.manga,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
      textTheme: const CustomTextTheme(),
      scaffoldBackgroundColor: CustomColors.voidColor,
      cardTheme: const CardTheme(
        color: CustomColors.blueGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: CustomColors.voidColor,
        selectedItemColor: CustomColors.psybeam,
        unselectedItemColor: CustomColors.manga,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.buttonBlue,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.2),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CustomColors.surf,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        backgroundColor: CustomColors.voidColor,
      ).copyWith(surface: CustomColors.blueGray),
      dialogTheme: const DialogTheme(
        backgroundColor: CustomColors.blueGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
