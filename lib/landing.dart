import 'package:collevo/helpers/loading/loading_screen.dart';
import 'package:collevo/presentation/auth/forgot_password_screen.dart';
import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/auth/signup_screen.dart';
import 'package:collevo/presentation/auth/verify_email_screen.dart';
import 'package:collevo/presentation/main/home_screen.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomeScreen();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmail();
        } else if (state is AuthStateLoggedOut) {
          return const SignIn();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPassword();
        } else if (state is AuthStateRegistering) {
          return const SignUp();
        } else {
          return const SafeArea(
            child: Scaffold(
              body: Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
