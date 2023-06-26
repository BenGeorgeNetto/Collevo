// ignore_for_file: use_build_context_synchronously

import 'package:collevo/colors.dart';
import 'package:collevo/cubit/bottom_nav_bar_cubit.dart';
import 'package:collevo/landing.dart';
import 'package:collevo/services/auth/bloc/auth_bloc.dart';
import 'package:collevo/utilities/dialogs/logout_dialog.dart';
import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsElement(
                element: "Profile",
                onTap: () {
                  Navigator.pushNamed(context, '/user_details');
                },
              ),
              SettingsElement(
                element: "About",
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              SettingsElement(
                element: "Sign Out",
                onTap: () async {
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    context.read<AuthBloc>().add(
                          const AuthEventLogOut(),
                        );
                    BlocProvider.of<BottomNavBarCubit>(context).selectTab(0);
                    Future.delayed(const Duration(milliseconds: 1000));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Landing(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsElement extends StatelessWidget {
  final String element;
  final void Function() onTap;

  const SettingsElement({
    super.key,
    required this.element,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          onTap: onTap,
        ),
        const Divider(
          color: CustomColors.blueGray,
          thickness: 1.0,
          indent: 16.0,
          endIndent: 16.0,
        )
      ],
    );
  }
}
