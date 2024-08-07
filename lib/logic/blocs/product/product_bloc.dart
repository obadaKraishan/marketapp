import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await _productRepository.getProduct(event.productId);
        if (product != null) {
          emit(ProductLoaded(product));
        } else {
          emit(ProductError("Product not found"));
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<CreateProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        await _productRepository.createProduct(event.product);
        emit(ProductLoaded(event.product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<UpdateProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        await _productRepository.updateProduct(event.product);
        emit(ProductLoaded(event.product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<DeleteProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        await _productRepository.deleteProduct(event.productId);
        emit(ProductInitial());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
