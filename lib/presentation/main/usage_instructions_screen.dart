import 'package:flutter/material.dart';

class UsageInstructions extends StatelessWidget {
  const UsageInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Usage Instructions"),
        ),
        body: Container(),
      ),
    );
  }
}
