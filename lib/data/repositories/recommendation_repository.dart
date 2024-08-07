import 'package:marketapp/data/models/recommendation_model.dart';
import 'package:marketapp/services/recommendation_service.dart';

class RecommendationRepository {
  final RecommendationService _recommendationService = RecommendationService();

  Future<void> createRecommendation(RecommendationModel recommendation) async {
    await _recommendationService.createRecommendation(recommendation);
  }

  Future<RecommendationModel?> getRecommendation(String recommendationId) async {
    return await _recommendationService.getRecommendation(recommendationId);
  }

  Future<void> updateRecommendation(RecommendationModel recommendation) async {
    await _recommendationService.updateRecommendation(recommendation);
  }

  Future<void> deleteRecommendation(String recommendationId) async {
    await _recommendationService.deleteRecommendation(recommendationId);
  }

  Future<List<RecommendationModel>> getAllRecommendationsForUser(String userId) async {
    return await _recommendationService.getAllRecommendationsForUser(userId);
  }
}
