import 'package:cloud_firestore/cloud_firestore.dart';

class SupportTicketModel {
  final String id;
  final String userId;
  final String subject;
  final String message;
  final String status;
  final List<Response> responses;

  SupportTicketModel({
    required this.id,
    required this.userId,
    required this.subject,
    required this.message,
    required this.status,
    required this.responses,
  });

  factory SupportTicketModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return SupportTicketModel(
      id: doc.id,
      userId: data['user_id'],
      subject: data['subject'],
      message: data['message'],
      status: data['status'],
      responses: List<Response>.from(data['responses'].map((item) => Response.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'subject': subject,
      'message': message,
      'status': status,
      'responses': responses.map((item) => item.toMap()).toList(),
    };
  }
}

class Response {
  final String responseId;
  final String message;
  final Timestamp timestamp;

  Response({
    required this.responseId,
    required this.message,
    required this.timestamp,
  });

  factory Response.fromMap(Map<String, dynamic> data) {
    return Response(
      responseId: data['response_id'],
      message: data['message'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'response_id': responseId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
