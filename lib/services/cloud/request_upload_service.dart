import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/models/request.dart';
import 'package:collevo/services/preferences/preferences_service.dart';

class RequestUploadService {
  Future<void> uploadRequest(Request request) async {
    PreferencesService preferencesService = PreferencesService();
    String? batch = await preferencesService.getBatch();
    CollectionReference requestsRef = FirebaseFirestore.instance
        .collection('students')
        .doc(batch)
        .collection('requests');

    try {
      await requestsRef.doc(request.requestId).set(request.toMap());
      // print('Request uploaded successfully with ID: ${request.requestId}');
    } catch (e) {
      // print('Error uploading request: $e');
    }
  }
}
