import 'package:collevo/services/preferences/preferences_service.dart';
import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:collevo/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final preferencesService = PreferencesService();

  String? name;
  String? email;
  String? rollNo;
  String? dept;
  String? sid;
  String? batch;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    email = await preferencesService.getEmail();
    name = await preferencesService.getName();
    rollNo = await preferencesService.getRollNo();
    sid = await preferencesService.getStudentId();
    batch = await preferencesService.getBatch();
    dept = await preferencesService.getDept();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("collevo"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user_details');
              },
              icon: const Icon(Icons.person_rounded),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 32.0),
                child: Column(children: [
                  Text(
                    '$name',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  // Text(
                  //   '$email',
                  //   style: Theme.of(context).textTheme.bodySmall,
                  //   textAlign: TextAlign.center,
                  // ),
                  Text(
                    "$sid",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeCard(
                  cardText: "Request Activity Points",
                  routeName: '/new_request',
                ),
                HomeCard(
                  cardText: "User Stats",
                  routeName: '/stats',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
