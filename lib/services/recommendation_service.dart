import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/recommendation_model.dart';

class RecommendationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRecommendation(RecommendationModel recommendation) async {
    await _firestore
        .collection('recommendations')
        .doc(recommendation.id)
        .set(recommendation.toMap());
  }

  Future<RecommendationModel?> getRecommendation(String recommendationId) async {
    DocumentSnapshot doc =
    await _firestore.collection('recommendations').doc(recommendationId).get();
    if (doc.exists) {
      return RecommendationModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateRecommendation(RecommendationModel recommendation) async {
    await _firestore
        .collection('recommendations')
        .doc(recommendation.id)
        .update(recommendation.toMap());
  }

  Future<void> deleteRecommendation(String recommendationId) async {
    await _firestore.collection('recommendations').doc(recommendationId).delete();
  }

  Future<List<RecommendationModel>> getAllRecommendationsForUser(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('recommendations')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => RecommendationModel.fromDocument(doc))
        .toList();
  }
}
