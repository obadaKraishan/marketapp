import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProduct(ProductModel product) async {
    await _firestore.collection('products').doc(product.id).set(product.toMap());
  }

  Future<ProductModel?> getProduct(String productId) async {
    DocumentSnapshot doc = await _firestore.collection('products').doc(productId).get();
    if (doc.exists) {
      return ProductModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateProduct(ProductModel product) async {
    await _firestore.collection('products').doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String productId) async {
    await _firestore.collection('products').doc(productId).delete();
  }

  Future<List<ProductModel>> getAllProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();
    return querySnapshot.docs.map((doc) => ProductModel.fromDocument(doc)).toList();
  }
}
