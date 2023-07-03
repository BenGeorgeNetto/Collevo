import 'package:collevo/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool?> showRemoveImageDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Remove Image',
    content: 'Are you sure you want to remove the image?',
    optionsBuilder: () {
      return {
        'Remove': true,
        'Cancel': false,
      };
    },
  );
}
