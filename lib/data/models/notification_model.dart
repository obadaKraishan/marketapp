import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String userId;
  final String message;
  final String type;
  final bool read;
  final Timestamp timestamp;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.type,
    required this.read,
    required this.timestamp,
  });

  factory NotificationModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return NotificationModel(
      id: doc.id,
      userId: data['user_id'],
      message: data['message'],
      type: data['type'],
      read: data['read'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'message': message,
      'type': type,
      'read': read,
      'timestamp': timestamp,
    };
  }
}
