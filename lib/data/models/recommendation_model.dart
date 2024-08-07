import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendationModel {
  final String id;
  final String userId;
  final List<String> recommendedProducts;
  final Timestamp timestamp;

  RecommendationModel({
    required this.id,
    required this.userId,
    required this.recommendedProducts,
    required this.timestamp,
  });

  factory RecommendationModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return RecommendationModel(
      id: doc.id,
      userId: data['user_id'],
      recommendedProducts: List<String>.from(data['recommended_products']),
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'recommended_products': recommendedProducts,
      'timestamp': timestamp,
    };
  }
}
