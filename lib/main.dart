import 'package:collevo/cubit/bottom_nav_bar_cubit.dart';
import 'package:collevo/landing.dart';
import 'package:collevo/presentation/router/app_router.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:collevo/services/auth/firebase_auth_provider.dart';
import 'package:collevo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

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
      ],
      child: MaterialApp(
        title: 'Collevo',
        theme: CustomTheme.getThemeData(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
        onUnknownRoute: _appRouter.onUnknownRoute,
        home: const Landing(),
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
