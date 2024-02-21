import 'package:collevo/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:collevo/colors.dart';

class CustomTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      // primaryColor: CustomColors.manga,
      appBarTheme: AppBarTheme(
        color: darkColorScheme.scrim,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
      textTheme: const CustomTextTheme(),
      // scaffoldBackgroundColor: CustomColors.voidColor,
      scaffoldBackgroundColor: darkColorScheme.background,
      cardTheme: CardTheme(
        // color: CustomColors.blueGray,
        color: darkColorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColorScheme.scrim,
        // backgroundColor: CustomColors.voidColor,
        // selectedItemColor: CustomColors.psybeam,
        selectedItemColor: darkColorScheme.surfaceTint,
        // unselectedItemColor: CustomColors.manga,
        unselectedItemColor: darkColorScheme.onBackground,
        elevation: 2,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // backgroundColor: CustomColors.buttonBlue,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.2),
          ),
          textStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            // foregroundColor: CustomColors.surf,
            textStyle: const TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        )),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // foregroundColor: CustomColors.buttonBlue,
          // backgroundColor: CustomColors.voidColor,
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      // colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      //   backgroundColor: CustomColors.voidColor,
      // ).copyWith(surface: CustomColors.blueGray),
      colorScheme: darkColorScheme,
      dialogTheme: DialogTheme(
        // backgroundColor: CustomColors.blueGray,
        backgroundColor: darkColorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
      dividerColor: darkColorScheme.onSurfaceVariant,
    );
  }
}
