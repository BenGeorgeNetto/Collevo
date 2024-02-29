import 'package:collevo/enums/status_enum.dart';

class Request {
  final String requestId;
  final String activityId;
  final String createdBy; // uid of the user
  final DateTime createdAt;
  final String imageUrl;
  final Status status;
  final String activityType;
  final String activity;
  final String activityLevel;
  final String batch; // batch of the student
  final int yearActivityDoneIn;
  String? optionalMessage;

  Request({
    required this.requestId,
    required this.activityId,
    required this.createdBy,
    required this.createdAt,
    required this.imageUrl,
    required this.status,
    required this.activityType,
    required this.activity,
    required this.activityLevel,
    required this.batch,
    required this.yearActivityDoneIn,
    this.optionalMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'request_id': requestId,
      'activity_id': activityId,
      'created_by': createdBy,
      'created_at': createdAt,
      'image_url': imageUrl,
      'status': status.index,
      'activity_type': activityType,
      'activity': activity,
      'activity_level': activityLevel,
      'batch': batch,
      'year_activity_done_in': yearActivityDoneIn,
      'optional_message': optionalMessage,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      requestId: map['request_id'] as String,
      activityId: map['activity_id'] as String,
      createdBy: map['created_by'] as String,
      createdAt: map['created_at'].toDate() as DateTime,
      imageUrl: map['image_url'] as String,
      status: Status.values[map['status'] as int],
      activityType: map['activity_type'] as String,
      activity: map['activity'] as String,
      activityLevel: map['activity_level'] as String,
      batch: map['batch'] as String,
      yearActivityDoneIn: map['year_activity_done_in'] as int,
      optionalMessage: map['optional_message'] as String?,
    );
  }
}
