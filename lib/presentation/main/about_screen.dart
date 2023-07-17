import 'package:collevo/utilities/communication/mail_util.dart';
import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Name",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Collevo',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Version",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '1.0.0-alpha1',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Contact Developer",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      EmailUtils.sendEmail(
                          emailAddress: 'bengeorgenetto.work@gmail.com');
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text("Contact via Email"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
