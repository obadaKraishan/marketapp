import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/recommendation_model.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<RecommendationModel> recommendations;

  RecommendationLoaded(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

class RecommendationError extends RecommendationState {
  final String message;

  RecommendationError(this.message);

  @override
  List<Object> get props => [message];
}
