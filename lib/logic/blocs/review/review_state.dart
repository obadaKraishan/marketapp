import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/review_model.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List<ReviewModel> reviews;

  ReviewLoaded(this.reviews);

  @override
  List<Object> get props => [reviews];
}

class ReviewError extends ReviewState {
  final String message;

  ReviewError(this.message);

  @override
  List<Object> get props => [message];
}
