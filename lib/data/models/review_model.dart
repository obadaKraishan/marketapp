import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String productId;
  final String userId;
  final int rating;
  final String review;
  final Timestamp timestamp;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.review,
    required this.timestamp,
  });

  factory ReviewModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return ReviewModel(
      id: doc.id,
      productId: data['product_id'],
      userId: data['user_id'],
      rating: data['rating'],
      review: data['review'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'user_id': userId,
      'rating': rating,
      'review': review,
      'timestamp': timestamp,
    };
  }
}
