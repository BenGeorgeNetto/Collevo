import 'package:collevo/widgets/bottom_nav_bar.dart';
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
        body: Container(),
      ),
    );
  }
}
