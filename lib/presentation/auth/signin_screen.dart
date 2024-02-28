import 'package:collevo/colors.dart';
import 'package:collevo/services/auth/auth_exceptions.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:collevo/utilities/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
              context,
              'Ensure that you are registered',
            );
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, 'Check your email and password');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication error');
          }
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextField(
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: CustomColors.blueGray,
                          ),
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: CustomColors.manga,
                          contentPadding: EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: CustomColors.voidColor,
                            ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: CustomColors.blueGray,
                          ),
                          hintText: 'Enter your password',
                          filled: true,
                          fillColor: CustomColors.manga,
                          contentPadding: EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: CustomColors.voidColor,
                            ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      ElevatedButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          context.read<AuthBloc>().add(
                                AuthEventLogIn(
                                  email,
                                  password,
                                ),
                              );
                        },
                        child: const Text('Sign In'),
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.05 / 2),
                      OutlinedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthEventForgotPassword(),
                              );
                        },
                        child: const Text('Forgot your password? Click here'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthEventShouldRegister(),
                              );
                        },
                        child: const Text('Not registered yet? Register here'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
