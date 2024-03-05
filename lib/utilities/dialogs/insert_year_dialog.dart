import 'package:flutter/material.dart';
import 'generic_dialog.dart';

Future<void> showInsertYearDialog(BuildContext context) async {
  await showGenericDialog(
    context: context,
    title: 'Year not selected',
    content: 'Please choose the year in which the activity was done.',
    optionsBuilder: () => {'OK': null},
  );
}