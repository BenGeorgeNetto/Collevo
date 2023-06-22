import 'package:flutter/material.dart';

class NewRequest extends StatelessWidget {
  const NewRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Request"),
        ),
        body: Container(),
      ),
    );
  }
}
