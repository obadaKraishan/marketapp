import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/recommendation_repository.dart';
import 'recommendation_event.dart';
import 'recommendation_state.dart';

class RecommendationBloc extends Bloc<RecommendationEvent, RecommendationState> {
  final RecommendationRepository _recommendationRepository;

  RecommendationBloc(this._recommendationRepository) : super(RecommendationInitial()) {
    on<LoadRecommendations>((event, emit) async {
      emit(RecommendationLoading());
      try {
        final recommendations = await _recommendationRepository.getAllRecommendationsForUser(event.userId);
        emit(RecommendationLoaded(recommendations));
      } catch (e) {
        emit(RecommendationError(e.toString()));
      }
    });

    on<CreateRecommendation>((event, emit) async {
      emit(RecommendationLoading());
      try {
        await _recommendationRepository.createRecommendation(event.recommendation);
        final recommendations = await _recommendationRepository.getAllRecommendationsForUser(event.recommendation.userId);
        emit(RecommendationLoaded(recommendations));
      } catch (e) {
        emit(RecommendationError(e.toString()));
      }
    });

    on<UpdateRecommendation>((event, emit) async {
      emit(RecommendationLoading());
      try {
        await _recommendationRepository.updateRecommendation(event.recommendation);
        final recommendations = await _recommendationRepository.getAllRecommendationsForUser(event.recommendation.userId);
        emit(RecommendationLoaded(recommendations));
      } catch (e) {
        emit(RecommendationError(e.toString()));
      }
    });

    on<DeleteRecommendation>((event, emit) async {
      emit(RecommendationLoading());
      try {
        await _recommendationRepository.deleteRecommendation(event.recommendationId);
        final recommendations = await _recommendationRepository.getAllRecommendationsForUser(event.recommendationId);
        emit(RecommendationLoaded(recommendations));
      } catch (e) {
        emit(RecommendationError(e.toString()));
      }
    });
  }
}
