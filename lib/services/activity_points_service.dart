import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/services/preferences/preferences_service.dart';

class ActivityPointsService {
  late Map<String, int> activityPoints;

  Future<Map<String, int>> getActivityPoints() async {
    final PreferencesService preferencesService = PreferencesService();
    final String? uid = await preferencesService.getUid();
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentSnapshot<Map<String, dynamic>> studentDocument =
          await firestore.collection('students').doc(uid).get();

      if (studentDocument.exists) {
        Map<String, dynamic> data = studentDocument.data()!;
        data['activity_points'].forEach((key, value) {
          activityPoints[key] = value as int;
        });

        return activityPoints;
      } else {
        return {};
      }
    } catch (e) {
      print('Error getting activityPoints: $e');
      return {};
    }
  }
}
