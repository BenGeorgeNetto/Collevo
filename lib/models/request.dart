import 'package:collevo/enums/status_enum.dart';

class Request {
  final String requestId;
  final String activityId;
  final String createdBy; // uid of the user
  final DateTime createdAt;
  final String imageUrl;
  final String assignedTo; // uid of teacher
  final Status status;
  final String activityType;
  final String activity;
  final String activityLevel;

  Request({
    required this.requestId,
    required this.activityId,
    required this.createdBy,
    required this.createdAt,
    required this.imageUrl,
    required this.assignedTo,
    required this.status,
    required this.activityType,
    required this.activity,
    required this.activityLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'request_id': requestId,
      'activity_id': activityId,
      'created_by': createdBy,
      'created_at': createdAt,
      'image_url': imageUrl,
      'assigned_to': assignedTo,
      'status': status.index,
      'activity_type': activityType,
      'activity': activity,
      'activity_level': activityLevel,
    };
  }
}
