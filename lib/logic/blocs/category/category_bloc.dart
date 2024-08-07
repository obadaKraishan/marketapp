import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryInitial()) {
    on<LoadCategory>((event, emit) async {
      emit(CategoryLoading());
      try {
        final category = await _categoryRepository.getCategory(event.categoryId);
        if (category != null) {
          emit(CategoryLoaded(category));
        } else {
          emit(CategoryError("Category not found"));
        }
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });

    on<CreateCategory>((event, emit) async {
      emit(CategoryLoading());
      try {
        await _categoryRepository.createCategory(event.category);
        emit(CategoryLoaded(event.category));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });

    on<UpdateCategory>((event, emit) async {
      emit(CategoryLoading());
      try {
        await _categoryRepository.updateCategory(event.category);
        emit(CategoryLoaded(event.category));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });

    on<DeleteCategory>((event, emit) async {
      emit(CategoryLoading());
      try {
        await _categoryRepository.deleteCategory(event.categoryId);
        emit(CategoryInitial());
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }
}
