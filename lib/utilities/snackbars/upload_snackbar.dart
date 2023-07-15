import 'package:flutter/material.dart';
import 'generic_snackbar.dart';

void showUploadFailedSnackbar(BuildContext context) {
  showGenericSnackbar(context, 'Upload failed. Please try again later');
}

void showUploadSuccessSnackbar(BuildContext context) {
  showGenericSnackbar(context, 'Upload successful');
}
