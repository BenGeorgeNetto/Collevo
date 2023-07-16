import 'package:collevo/models/request.dart';
import 'package:collevo/services/cloud/requests_fetch_service.dart';
import 'package:collevo/widgets/bottom_nav_bar.dart';
import 'package:collevo/widgets/request_card.dart';
import 'package:flutter/material.dart';

class AcceptedRequests extends StatefulWidget {
  const AcceptedRequests({super.key});

  @override
  State<AcceptedRequests> createState() => _AcceptedRequestsState();
}

class _AcceptedRequestsState extends State<AcceptedRequests> {
  Future<List<Request>>? _requestsFuture;

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    final requestsService = RequestsFetchService();
    _requestsFuture = requestsService.fetchApprovedRequests();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Approved Requests"),
        ),
        bottomNavigationBar: const BottomNavBar(),
        body: FutureBuilder<List<Request>>(
          future: _requestsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              final requests = snapshot.data;
              if (requests == null || requests.isEmpty) {
                return const Center(child: Text("No approved requests found."));
              } else {
                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return RequestCard(request: request);
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
