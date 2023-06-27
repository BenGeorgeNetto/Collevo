import 'package:collevo/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showInvalidEmailDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'Invalid Email Entered',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
