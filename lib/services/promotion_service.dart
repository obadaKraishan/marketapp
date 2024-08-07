import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/promotion_model.dart';

class PromotionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPromotion(PromotionModel promotion) async {
    await _firestore.collection('promotions').doc(promotion.id).set(promotion.toMap());
  }

  Future<PromotionModel?> getPromotion(String promotionId) async {
    DocumentSnapshot doc = await _firestore.collection('promotions').doc(promotionId).get();
    if (doc.exists) {
      return PromotionModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updatePromotion(PromotionModel promotion) async {
    await _firestore.collection('promotions').doc(promotion.id).update(promotion.toMap());
  }

  Future<void> deletePromotion(String promotionId) async {
    await _firestore.collection('promotions').doc(promotionId).delete();
  }

  Future<List<PromotionModel>> getAllPromotions() async {
    QuerySnapshot querySnapshot = await _firestore.collection('promotions').get();
    return querySnapshot.docs.map((doc) => PromotionModel.fromDocument(doc)).toList();
  }
}
