import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/main/error_screen.dart';
import 'package:collevo/presentation/main/home_screen.dart';
import 'package:collevo/presentation/main/new_request_screen.dart';
import 'package:collevo/presentation/main/settings_screen.dart';
import 'package:collevo/presentation/main/usage_instructions_screen.dart';
import 'package:collevo/presentation/main/user_details_screen.dart';
import 'package:collevo/presentation/main/view_requests_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (context) => const Settings(),
        );
      case '/view_requests':
        return MaterialPageRoute(
          builder: (context) => const ViewRequests(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (context) => const Signin(),
        );
      case '/new_request':
        return MaterialPageRoute(
          builder: (context) => const NewRequest(),
        );
      case '/user_details':
        return MaterialPageRoute(
          builder: (context) => const UserDetails(),
        );
      case '/usage_instructions':
        return MaterialPageRoute(
          builder: (context) => const UsageInstructions(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }

// class AppRouter {
//   Route onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         );
//       case '/settings':
//         return MaterialPageRoute(
//           builder: (_) => const Settings(),
//         );
//       case '/view_requests':
//         return MaterialPageRoute(
//           builder: (_) => const ViewRequests(),
//         );
//       case '/signin':
//         return MaterialPageRoute(
//           builder: (_) => const Signin(),
//         );
//       case '/new_request':
//         return MaterialPageRoute(
//           builder: (_) => const NewRequest(),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const ErrorScreen(),
//         );
//     }
//   }

  void dispose() {}
}
