import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/review_model.dart';

class ReviewService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createReview(ReviewModel review) async {
    await _firestore.collection('reviews').doc(review.id).set(review.toMap());
  }

  Future<ReviewModel?> getReview(String reviewId) async {
    DocumentSnapshot doc = await _firestore.collection('reviews').doc(reviewId).get();
    if (doc.exists) {
      return ReviewModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateReview(ReviewModel review) async {
    await _firestore.collection('reviews').doc(review.id).update(review.toMap());
  }

  Future<void> deleteReview(String reviewId) async {
    await _firestore.collection('reviews').doc(reviewId).delete();
  }

  Future<List<ReviewModel>> getAllReviewsForProduct(String productId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('reviews')
        .where('product_id', isEqualTo: productId)
        .get();
    return querySnapshot.docs
        .map((doc) => ReviewModel.fromDocument(doc))
        .toList();
  }
}
