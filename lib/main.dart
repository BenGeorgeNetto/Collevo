import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/cubit/bottom_nav_bar_cubit.dart';
import 'package:collevo/firebase_options.dart';
import 'package:collevo/presentation/main/error_screen.dart';
import 'package:collevo/presentation/router/routes.dart';
import 'package:collevo/services/app_update/bloc/app_update_bloc.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:collevo/services/auth/firebase_auth_provider.dart';
import 'package:collevo/services/updation/version_check_service.dart';
import 'package:collevo/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final versionCheckService = VersionCheckService(FirebaseFirestore.instance);
  runApp(MyApp(versionCheckService: versionCheckService));
}

class MyApp extends StatefulWidget {
  final VersionCheckService versionCheckService;

  const MyApp({Key? key, required this.versionCheckService}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppRouter.defineRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FirebaseAuthProvider()),
        ),
        BlocProvider<AppUpdateBloc>(
          create: (context) => AppUpdateBloc(
            versionCheckService: widget.versionCheckService,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Collevo',
        theme: CustomTheme.getThemeData(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.router.generator,
        onUnknownRoute: (unknownRoutes) {
          return MaterialPageRoute(
            builder: (context) => const ErrorScreen(),
          );
        },
      ),
    );
  }
}
