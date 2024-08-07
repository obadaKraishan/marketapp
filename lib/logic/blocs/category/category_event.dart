import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/category_model.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategory extends CategoryEvent {
  final String categoryId;

  LoadCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class CreateCategory extends CategoryEvent {
  final CategoryModel category;

  CreateCategory(this.category);

  @override
  List<Object> get props => [category];
}

class UpdateCategory extends CategoryEvent {
  final CategoryModel category;

  UpdateCategory(this.category);

  @override
  List<Object> get props => [category];
}

class DeleteCategory extends CategoryEvent {
  final String categoryId;

  DeleteCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}
