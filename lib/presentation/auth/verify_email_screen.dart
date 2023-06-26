import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Check your email'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "We've sent you an email verification. Please open it to verify your account.",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "If you haven't received a verification email yet, press the send email verification again button below",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "If you have already verified your email, press the restart button below to restart the app",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05 / 2,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventSendEmailVerification(),
                        );
                  },
                  child: const Text('Send email verification again'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05 / 4,
                ),
                OutlinedButton(
                  onPressed: () async {
                    context.read<AuthBloc>().add(
                          const AuthEventLogOut(),
                        );
                  },
                  child: const Text('Restart'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
