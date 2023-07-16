import 'package:collevo/enums/status_enum.dart';
import 'package:collevo/models/request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/services/preferences/preferences_service.dart';

class RequestsFetchService {
  Future<List<Request>> fetchMyRequestsByStatus(Status status) async {
    try {
      final String? currentUserUID = await PreferencesService().getUid();

      final querySnapshot = await FirebaseFirestore.instance
          .collection('requests')
          .where('created_by', isEqualTo: currentUserUID)
          .where('status', isEqualTo: status.index) // status.index gives the integer value of the Status enum
          .get();

      final List<Request> myRequests = querySnapshot.docs.map((doc) {
        return Request(
          requestId: doc['request_id'],
          activityId: doc['activity_id'],
          createdBy: doc['created_by'],
          createdAt: doc['created_at'].toDate(),
          imageUrl: doc['image_url'],
          assignedTo: doc['assigned_to'],
          status: Status.values[doc['status']],
          activityType: doc['activity_type'],
          activity: doc['activity'],
          activityLevel: doc['activity_level'],
        );
      }).toList();

      return myRequests;
    } catch (e) {
      // print('Error fetching requests: $e');
      return [];
    }
  }

  Future<List<Request>> fetchApprovedRequests() async {
    return fetchMyRequestsByStatus(Status.approved);
  }

  Future<List<Request>> fetchPendingRequests() async {
    return fetchMyRequestsByStatus(Status.pending);
  }

  Future<List<Request>> fetchRejectedRequests() async {
    return fetchMyRequestsByStatus(Status.rejected);
  }
}
