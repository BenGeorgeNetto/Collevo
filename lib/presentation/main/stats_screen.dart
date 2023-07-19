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
  int totalSum = 0;

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  void fetchStats() {
    final activityPointsService = ActivityPointsService();
    activityPointsService.getActivityPoints().then((value) {
      activityPointsData = value;

      // Compute total sum of all points
      totalSum =
          activityPointsData.values.fold(0, (sum, points) => sum + points);

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total Activity Points: ${(totalSum / 2).round()}',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: activityTypesData.length,
              itemBuilder: (context, index) {
                String activityType = activityTypesData.keys.elementAt(index);
                List<String> activities = activityTypesData[activityType]!;

                int totalPoints = 0;
                for (var activity in activities) {
                  String activityKey =
                      '${index}_${activities.indexOf(activity)}';
                  int points = activityPointsData[activityKey] ?? 0;
                  totalPoints += points;
                }

                if (totalPoints == 0) {
                  return const SizedBox.shrink();
                }

                return ExpansionTile(
                  title: Text(activityType),
                  subtitle: Text(
                    'Total Points: $totalPoints',
                  ),
                  children: activities.map((activity) {
                    String activityKey =
                        '${index}_${activities.indexOf(activity)}';
                    int points = activityPointsData[activityKey] ?? 0;

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
          ),
        ],
      ),
    );
  }
}
