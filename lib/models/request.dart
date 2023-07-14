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

}
