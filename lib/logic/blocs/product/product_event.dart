import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/product_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  final String productId;

  LoadProduct(this.productId);

  @override
  List<Object> get props => [productId];
}

class CreateProduct extends ProductEvent {
  final ProductModel product;

  CreateProduct(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProduct extends ProductEvent {
  final ProductModel product;

  UpdateProduct(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProduct extends ProductEvent {
  final String productId;

  DeleteProduct(this.productId);

  @override
  List<Object> get props => [productId];
}
