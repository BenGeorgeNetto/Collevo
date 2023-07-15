import 'package:collevo/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool?> showUploadRequestDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Upload Request',
    content: 'Are you sure you want to upload the request',
    optionsBuilder: () {
      return {
        'Yes': true,
        'No': false,
      };
    },
  );
}
