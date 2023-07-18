import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/data/activity_assigned_points.dart';
import 'package:collevo/data/activity_max_points.dart';
import 'package:collevo/services/preferences/preferences_service.dart';

class ActivityPointsService {
  Map<String, int> activityPoints = {};
  Map<String, int> maxActivityPoints = maxPoints;
  Map<String, int> activityPointsToBeAdded = assignedPoints;

  Future<Map<String, int>> getActivityPoints() async {
    final PreferencesService preferencesService = PreferencesService();
    final String? email = await preferencesService.getEmail();
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentSnapshot<Map<String, dynamic>> studentDocument =
          await firestore.collection('students').doc(email).get();

      if (studentDocument.exists) {
        // print('Document data: ${studentDocument.data()}');
        Map<String, dynamic> data = studentDocument.data()!;
        data['activity_points'].forEach((key, value) {
          activityPoints[key] = value as int;
        });

        return activityPoints;
      } else {
        // print('Document does not exist on the database');
        return {};
      }
    } catch (e) {
      // print('Error getting activityPoints: $e');
      return {};
    }
  }

  Future<bool> checkIfCanInsertActivityPoints(String activityId) async {
    var activityIdSplit = activityId.split('_');
    var activityType = activityIdSplit[0];
    var activity = activityIdSplit[1];
    // var activityLevel = activityIdSplit[2];

    var activityPartialId = '${activityType}_$activity';

    Map<String, int> activityPoints = await getActivityPoints();

    if (activityPoints[activityType]! + activityPointsToBeAdded[activityId]! <=
        maxActivityPoints[activityType]!) {
      if (activityPoints[activityPartialId]! +
              activityPointsToBeAdded[activityId]! <=
          maxActivityPoints[activityPartialId]!) {
        return true;
      }
    }

    return false;
  }
}
