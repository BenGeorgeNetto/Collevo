import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:collevo/widgets/requests_home_card.dart';
import 'package:flutter/material.dart';

class ViewRequests extends StatefulWidget {
  const ViewRequests({super.key});

  @override
  State<ViewRequests> createState() => _ViewRequestsState();
}

class _ViewRequestsState extends State<ViewRequests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Requests"),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RequestsHomeCard(
              cardText: "Pending Requests",
              routeName: '/pending_requests',
            ),
            RequestsHomeCard(
              cardText: "Accepted Requests",
              routeName: '/accepted_requests',
            ),
            RequestsHomeCard(
              cardText: "Rejected Requests",
              routeName: '/rejected_requests',
            ),
          ],
        ),
      ),
    );
  }
}
