import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/main/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const Signin());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }


  void dispose() {
    
  }
}
