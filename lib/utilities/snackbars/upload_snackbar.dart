import 'package:flutter/material.dart';
import 'generic_snackbar.dart';

void showUploadFailedSnackbar(BuildContext context) {
  showGenericSnackbar(context,
      'Upload failed. Please check your internet connection and try again.');
}

void showUploadSuccessSnackbar(BuildContext context) {
  showGenericSnackbar(context, 'Upload successful');
}
