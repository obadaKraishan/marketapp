import 'package:marketapp/data/models/category_model.dart';
import 'package:marketapp/services/category_service.dart';

class CategoryRepository {
  final CategoryService _categoryService = CategoryService();

  Future<void> createCategory(CategoryModel category) async {
    await _categoryService.createCategory(category);
  }

  Future<CategoryModel?> getCategory(String categoryId) async {
    return await _categoryService.getCategory(categoryId);
  }

  Future<void> updateCategory(CategoryModel category) async {
    await _categoryService.updateCategory(category);
  }

  Future<void> deleteCategory(String categoryId) async {
    await _categoryService.deleteCategory(categoryId);
  }

  Future<List<CategoryModel>> getAllCategories() async {
    return await _categoryService.getAllCategories();
  }
}
