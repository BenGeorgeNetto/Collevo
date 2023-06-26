import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:collevo/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var name = "Rick Morgan";
  var email = "rickmorgan.b20cs1169@mbcet.ac.in";
  var sem = "6";
  var dept = "CSE";

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
                    name,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "S$sem | $dept",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                HomeCard(
                  cardText: "Request Activity Points",
                  routeName: '/new_request',
                ),
                HomeCard(
                  cardText: "Usage instructions",
                  routeName: '/usage_instructions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
