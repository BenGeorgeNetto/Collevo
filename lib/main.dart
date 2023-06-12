import 'package:collevo/presentation/main/home_screen.dart';
import 'package:collevo/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getThemeData(),
      
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

