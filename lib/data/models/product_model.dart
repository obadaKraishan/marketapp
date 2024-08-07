import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String subcategory;
  final List<String> images;
  final int stock;
  final List<Variant> variants;
  final List<Rating> ratings;
  final List<String> relatedProducts;
  final String mostFrequentWord;
  final String topEmotion;
  final EmotionScores emotionScores;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.subcategory,
    required this.images,
    required this.stock,
    required this.variants,
    required this.ratings,
    required this.relatedProducts,
    required this.mostFrequentWord,
    required this.topEmotion,
    required this.emotionScores,
  });

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return ProductModel(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      price: data['price'].toDouble(),
      category: data['category'],
      subcategory: data['subcategory'],
      images: List<String>.from(data['images']),
      stock: data['stock'],
      variants: List<Variant>.from(data['variants'].map((item) => Variant.fromMap(item))),
      ratings: List<Rating>.from(data['ratings'].map((item) => Rating.fromMap(item))),
      relatedProducts: List<String>.from(data['related_products']),
      mostFrequentWord: data['most_frequent_word'],
      topEmotion: data['top_emotion'],
      emotionScores: EmotionScores.fromMap(data['emotion_scores']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'subcategory': subcategory,
      'images': images,
      'stock': stock,
      'variants': variants.map((item) => item.toMap()).toList(),
      'ratings': ratings.map((item) => item.toMap()).toList(),
      'related_products': relatedProducts,
      'most_frequent_word': mostFrequentWord,
      'top_emotion': topEmotion,
      'emotion_scores': emotionScores.toMap(),
    };
  }
}

class Variant {
  final String variantId;
  final String variantName;
  final double price;

  Variant({
    required this.variantId,
    required this.variantName,
    required this.price,
  });

  factory Variant.fromMap(Map<String, dynamic> data) {
    return Variant(
      variantId: data['variant_id'],
      variantName: data['variant_name'],
      price: data['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'variant_id': variantId,
      'variant_name': variantName,
      'price': price,
    };
  }
}

class Rating {
  final String userId;
  final int rating;
  final String review;
  final Timestamp timestamp;

  Rating({
    required this.userId,
    required this.rating,
    required this.review,
    required this.timestamp,
  });

  factory Rating.fromMap(Map<String, dynamic> data) {
    return Rating(
      userId: data['user_id'],
      rating: data['rating'],
      review: data['review'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'rating': rating,
      'review': review,
      'timestamp': timestamp,
    };
  }
}

class EmotionScores {
  final double happiness;
  final double sadness;
  final double anger;
  final double fear;
  final double disgust;

  EmotionScores({
    required this.happiness,
    required this.sadness,
    required this.anger,
    required this.fear,
    required this.disgust,
  });

  factory EmotionScores.fromMap(Map<String, dynamic> data) {
    return EmotionScores(
      happiness: data['happiness'].toDouble(),
      sadness: data['sadness'].toDouble(),
      anger: data['anger'].toDouble(),
      fear: data['fear'].toDouble(),
      disgust: data['disgust'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'happiness': happiness,
      'sadness': sadness,
      'anger': anger,
      'fear': fear,
      'disgust': disgust,
    };
  }
}
