import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/review_repository.dart';
import 'review_event.dart';
import 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository _reviewRepository;

  ReviewBloc(this._reviewRepository) : super(ReviewInitial()) {
    on<LoadReviews>((event, emit) async {
      emit(ReviewLoading());
      try {
        final reviews = await _reviewRepository.getAllReviewsForProduct(event.productId);
        emit(ReviewLoaded(reviews));
      } catch (e) {
        emit(ReviewError(e.toString()));
      }
    });

    on<CreateReview>((event, emit) async {
      emit(ReviewLoading());
      try {
        await _reviewRepository.createReview(event.review);
        final reviews = await _reviewRepository.getAllReviewsForProduct(event.review.productId);
        emit(ReviewLoaded(reviews));
      } catch (e) {
        emit(ReviewError(e.toString()));
      }
    });

    on<UpdateReview>((event, emit) async {
      emit(ReviewLoading());
      try {
        await _reviewRepository.updateReview(event.review);
        final reviews = await _reviewRepository.getAllReviewsForProduct(event.review.productId);
        emit(ReviewLoaded(reviews));
      } catch (e) {
        emit(ReviewError(e.toString()));
      }
    });

    on<DeleteReview>((event, emit) async {
      emit(ReviewLoading());
      try {
        await _reviewRepository.deleteReview(event.reviewId);
        final reviews = await _reviewRepository.getAllReviewsForProduct(event.reviewId);
        emit(ReviewLoaded(reviews));
      } catch (e) {
        emit(ReviewError(e.toString()));
      }
    });
  }
}
