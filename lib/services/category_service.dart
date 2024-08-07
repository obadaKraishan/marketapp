import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/category_model.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createCategory(CategoryModel category) async {
    await _firestore.collection('categories').doc(category.id).set(category.toMap());
  }

  Future<CategoryModel?> getCategory(String categoryId) async {
    DocumentSnapshot doc = await _firestore.collection('categories').doc(categoryId).get();
    if (doc.exists) {
      return CategoryModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateCategory(CategoryModel category) async {
    await _firestore.collection('categories').doc(category.id).update(category.toMap());
  }

  Future<void> deleteCategory(String categoryId) async {
    await _firestore.collection('categories').doc(categoryId).delete();
  }

  Future<List<CategoryModel>> getAllCategories() async {
    QuerySnapshot querySnapshot = await _firestore.collection('categories').get();
    return querySnapshot.docs.map((doc) => CategoryModel.fromDocument(doc)).toList();
  }
}
