import 'package:collevo/colors.dart';
import 'package:flutter/material.dart';

void showGenericSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: darkColorScheme.background,
          fontSize: 16,
        ),
      ),
      backgroundColor: CustomColors.surf, // Customize the background color here
      duration: const Duration(
          seconds: 2), // Control the duration the snackbar is visible
    ),
  );
}
