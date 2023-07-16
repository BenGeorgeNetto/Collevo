import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/main/about_screen.dart';
import 'package:collevo/presentation/main/error_screen.dart';
import 'package:collevo/presentation/main/home_screen.dart';
import 'package:collevo/presentation/requests/accepted_requests_screen.dart';
import 'package:collevo/presentation/requests/new_request_screen.dart';
import 'package:collevo/presentation/main/settings_screen.dart';
import 'package:collevo/presentation/main/usage_instructions_screen.dart';
import 'package:collevo/presentation/main/user_details_screen.dart';
import 'package:collevo/presentation/requests/pending_requests_screen.dart';
import 'package:collevo/presentation/requests/rejected_requests_screen.dart';
import 'package:collevo/presentation/requests/view_requests_screen.dart';
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
      case '/pending_requests':
        return MaterialPageRoute(
          builder: (context) => const PendingRequests(),
        );
      case '/accepted_requests':
        return MaterialPageRoute(
          builder: (context) => const AcceptedRequests(),
        );
      case '/rejected_requests':
        return MaterialPageRoute(
          builder: (context) => const RejectedRequests(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
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
      case '/about':
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }

  void dispose() {}
}
