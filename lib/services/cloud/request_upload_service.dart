import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/models/request.dart';

class RequestUploadService {
  Future<void> uploadRequest(Request request) async {
    CollectionReference requestsRef =
        FirebaseFirestore.instance.collection('requests');

    try {
      await requestsRef.doc(request.requestId).set(request.toMap());
      // print('Request uploaded successfully with ID: ${request.requestId}');
    } catch (e) {
      // print('Error uploading request: $e');
    }
  }
}
