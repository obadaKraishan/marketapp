import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final List<Subcategory> subcategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.subcategories,
  });

  factory CategoryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CategoryModel(
      id: doc.id,
      name: data['name'],
      subcategories: List<Subcategory>.from(data['subcategories'].map((item) => Subcategory.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subcategories': subcategories.map((item) => item.toMap()).toList(),
    };
  }
}

class Subcategory {
  final String subcategoryId;
  final String name;

  Subcategory({
    required this.subcategoryId,
    required this.name,
  });

  factory Subcategory.fromMap(Map<String, dynamic> data) {
    return Subcategory(
      subcategoryId: data['subcategory_id'],
      name: data['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subcategory_id': subcategoryId,
      'name': name,
    };
  }
}
