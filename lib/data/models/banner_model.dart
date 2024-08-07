import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String id;
  final String imageUrl;
  final String link;
  final int priority;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.link,
    required this.priority,
  });

  factory BannerModel.fromMap(Map<String, dynamic> data) {
    return BannerModel(
      id: data['id'],
      imageUrl: data['image_url'],
      link: data['link'],
      priority: data['priority'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_url': imageUrl,
      'link': link,
      'priority': priority,
    };
  }

  factory BannerModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return BannerModel(
      id: doc.id,
      imageUrl: data['image_url'],
      link: data['link'],
      priority: data['priority'],
    );
  }
}
