import 'package:collevo/utilities/communication/mail_util.dart';
import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              FutureBuilder<PackageInfo>(
                future: _getPackageInfo(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: Text(
                        '${snapshot.data?.version}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Contact Developer",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
