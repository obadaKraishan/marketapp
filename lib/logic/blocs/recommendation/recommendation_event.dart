import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/recommendation_model.dart';

abstract class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object> get props => [];
}

class LoadRecommendations extends RecommendationEvent {
  final String userId;

  LoadRecommendations(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreateRecommendation extends RecommendationEvent {
  final RecommendationModel recommendation;

  CreateRecommendation(this.recommendation);

  @override
  List<Object> get props => [recommendation];
}

class UpdateRecommendation extends RecommendationEvent {
  final RecommendationModel recommendation;

  UpdateRecommendation(this.recommendation);

  @override
  List<Object> get props => [recommendation];
}

class DeleteRecommendation extends RecommendationEvent {
  final String recommendationId;

  DeleteRecommendation(this.recommendationId);

  @override
  List<Object> get props => [recommendationId];
}
