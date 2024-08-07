import 'package:marketapp/data/models/search_history_model.dart';
import 'package:marketapp/services/search_history_service.dart';

class SearchHistoryRepository {
  final SearchHistoryService _searchHistoryService = SearchHistoryService();

  Future<void> createSearchHistory(SearchHistoryModel searchHistory) async {
    await _searchHistoryService.createSearchHistory(searchHistory);
  }

  Future<SearchHistoryModel?> getSearchHistory(String searchHistoryId) async {
    return await _searchHistoryService.getSearchHistory(searchHistoryId);
  }

  Future<void> updateSearchHistory(SearchHistoryModel searchHistory) async {
    await _searchHistoryService.updateSearchHistory(searchHistory);
  }

  Future<void> deleteSearchHistory(String searchHistoryId) async {
    await _searchHistoryService.deleteSearchHistory(searchHistoryId);
  }

  Future<List<SearchTerm>> getAllSearchHistoriesForUser(String userId) async {
    final searchHistories = await _searchHistoryService.getAllSearchHistoriesForUser(userId);
    return searchHistories.expand((history) => history.searchTermList).toList();
  }

  Future<void> addSearchTerm(String userId, SearchTerm searchTerm) async {
    await _searchHistoryService.addSearchTerm(userId, searchTerm);
  }

  Future<void> clearSearchHistory(String userId) async {
    await _searchHistoryService.clearSearchHistory(userId);
  }
}
