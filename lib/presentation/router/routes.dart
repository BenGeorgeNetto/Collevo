import 'package:collevo/landing.dart';
import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/main/about_screen.dart';
import 'package:collevo/presentation/main/error_screen.dart';
import 'package:collevo/presentation/main/stats_screen.dart';
import 'package:collevo/presentation/requests/accepted_requests_screen.dart';
import 'package:collevo/presentation/requests/new_request_screen.dart';
import 'package:collevo/presentation/main/settings_screen.dart';
import 'package:collevo/presentation/main/usage_instructions_screen.dart';
import 'package:collevo/presentation/main/user_details_screen.dart';
import 'package:collevo/presentation/requests/pending_requests_screen.dart';
import 'package:collevo/presentation/requests/rejected_requests_screen.dart';
import 'package:collevo/presentation/requests/view_requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';


class AppRouter {
  static final router = FluroRouter();

  static void defineRoutes() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const Landing();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/settings',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const Settings();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/view_requests',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const ViewRequests();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/pending_requests',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const PendingRequests();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/accepted_requests',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const AcceptedRequests();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/rejected_requests',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const RejectedRequests();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/signin',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const SignIn();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/new_request',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const NewRequest();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/user_details',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const UserDetails();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/usage_instructions',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const UsageInstructions();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/about',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const AboutScreen();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/stats',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
          return const StatsScreen();
        },
      ),
      transitionType: TransitionType.fadeIn,
    );
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return const ErrorScreen();
      },
    );
  }

}