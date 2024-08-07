import 'package:marketapp/data/models/product_model.dart';
import 'package:marketapp/services/product_service.dart';

class ProductRepository {
  final ProductService _productService = ProductService();

  Future<void> createProduct(ProductModel product) async {
    await _productService.createProduct(product);
  }

  Future<ProductModel?> getProduct(String productId) async {
    return await _productService.getProduct(productId);
  }

  Future<void> updateProduct(ProductModel product) async {
    await _productService.updateProduct(product);
  }

  Future<void> deleteProduct(String productId) async {
    await _productService.deleteProduct(productId);
  }

  Future<List<ProductModel>> getAllProducts() async {
    return await _productService.getAllProducts();
  }
}
