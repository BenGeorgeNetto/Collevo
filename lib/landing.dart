import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collevo/helpers/loading/loading_screen.dart';
import 'package:collevo/presentation/auth/forgot_password_screen.dart';
import 'package:collevo/presentation/auth/signin_screen.dart';
import 'package:collevo/presentation/auth/signup_screen.dart';
import 'package:collevo/presentation/auth/verify_email_screen.dart';
import 'package:collevo/presentation/main/home_screen.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:collevo/services/app_update/bloc/app_update_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppUpdateBloc>().add(CheckForUpdate());

    context.read<AuthBloc>().add(const AuthEventInitialize());

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
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
        ),
        BlocListener<AppUpdateBloc, AppUpdateState>(
          listener: (context, state) {
            if (state is UpdateRequired) {
              _showUpdateDialog(context, state.latestVersion);
            }
            if (state is UpdateFailure) {
              _showFailureDialog(context, state.error);
            }
          },
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
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
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, String latestVersion) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              'Update Available',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            content: Text(
              'A new version ($latestVersion) of the app is available. Please update to continue using it.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Update Now'),
                onPressed: () => _launchUpdateUrl(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFailureDialog(BuildContext context, String error) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Update Check Failed',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Text(
            'Failed to check for updates: $error',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchUpdateUrl() async {
    try {
      // TODO: After uploading app to play store, replace the URL with the app's play store link
      // const url = 'https://play.google.com/store/apps/details?id=com.yourapp';
      Uri url = Uri.parse(
          'https://drive.google.com/drive/u/1/folders/16DF_Q4onZfDL32QwR85qdJhsS6oHaqEQ');
      final Uri uri = Uri.parse(url.toString());
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        // print('Could not launch $url');
      }
    } catch (e) {
      // print('An error occurred: $e');
    }
  }
}
