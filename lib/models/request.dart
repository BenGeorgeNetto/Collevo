import 'package:collevo/enums/status_enum.dart';

class Request {
  final String requestId;
  final String activityId;
  final String createdBy; // uid of the user
  final DateTime createdAt;
  final String imageUrl;
  final String assignedTo; // uid of teacher
  final Status status;

  Request(
    this.requestId,
    this.activityId,
    this.createdBy,
    this.createdAt,
    this.imageUrl,
    this.assignedTo,
    this.status,
  );

  Map<String, dynamic> toMap() {
    return {
      'request_id': requestId,
      'activity_id': activityId,
      'created_by': createdBy,
      'created_at': createdAt,
      'image_url': imageUrl,
      'assigned_to': assignedTo,
      'status': status.index,
    };
  }
}
