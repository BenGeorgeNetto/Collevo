import 'package:collevo/data/activities_lists.dart';
import 'package:collevo/services/cloud/activity_points_service.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Map<String, int> activityPointsData = {};
  Map<String, dynamic> activityTypesData = {};

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  void fetchStats() {
    final activityPointsService = ActivityPointsService();
    activityPointsService.getActivityPoints().then((value) {
      activityPointsData = value;
      setState(() {});
    });

    activityTypesData = dropdownItems2;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: ListView.builder(
        itemCount: activityTypesData.length,
        itemBuilder: (context, index) {
          String activityType = activityTypesData.keys.elementAt(index);
          List<String> activities = activityTypesData[activityType]!;

          // Compute total points for the current activity type
          int totalPoints = activities.fold(0, (sum, activity) {
            String activityKey = '${index}_${activities.indexOf(activity)}';
            int points = activityPointsData[activityKey] ?? 0;
            return sum + points;
          });

          // Only show activity types with non-zero points
          if (totalPoints == 0) {
            return const SizedBox.shrink();
          }

          return ExpansionTile(
            title: Text(activityType),
            subtitle: Text(
              'Total Points: $totalPoints',
            ), // Show total points in the header
            children: activities.map((activity) {
              String activityKey = '${index}_${activities.indexOf(activity)}';
              int points = activityPointsData[activityKey] ?? 0;
              // Only show activities with non-zero points
              if (points == 0) {
                return const SizedBox.shrink();
              }
              return ListTile(
                title: Text(activity),
                subtitle: Text('Points: $points'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
