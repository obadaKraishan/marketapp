import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/review_model.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class LoadReviews extends ReviewEvent {
  final String productId;

  LoadReviews(this.productId);

  @override
  List<Object> get props => [productId];
}

class CreateReview extends ReviewEvent {
  final ReviewModel review;

  CreateReview(this.review);

  @override
  List<Object> get props => [review];
}

class UpdateReview extends ReviewEvent {
  final ReviewModel review;

  UpdateReview(this.review);

  @override
  List<Object> get props => [review];
}

class DeleteReview extends ReviewEvent {
  final String reviewId;

  DeleteReview(this.reviewId);

  @override
  List<Object> get props => [reviewId];
}
