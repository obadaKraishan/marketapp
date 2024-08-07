import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Timestamp startDate;
  final Timestamp endDate;
  final double discountPercentage;
  final List<String> applicableProducts;

  PromotionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.discountPercentage,
    required this.applicableProducts,
  });

  factory PromotionModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return PromotionModel(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      imageUrl: data['image_url'],
      startDate: data['start_date'],
      endDate: data['end_date'],
      discountPercentage: data['discount_percentage'],
      applicableProducts: List<String>.from(data['applicable_products']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'start_date': startDate,
      'end_date': endDate,
      'discount_percentage': discountPercentage,
      'applicable_products': applicableProducts,
    };
  }
}
