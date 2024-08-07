import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/search_history_model.dart';

class SearchHistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _searchHistoryCollection = FirebaseFirestore.instance.collection('search_histories');

  Future<void> createSearchHistory(SearchHistoryModel searchHistory) async {
    await _searchHistoryCollection.doc(searchHistory.id).set(searchHistory.toMap());
  }

  Future<SearchHistoryModel?> getSearchHistory(String searchHistoryId) async {
    final doc = await _searchHistoryCollection.doc(searchHistoryId).get();
    if (doc.exists) {
      return SearchHistoryModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateSearchHistory(SearchHistoryModel searchHistory) async {
    await _searchHistoryCollection.doc(searchHistory.id).update(searchHistory.toMap());
  }

  Future<void> deleteSearchHistory(String searchHistoryId) async {
    await _searchHistoryCollection.doc(searchHistoryId).delete();
  }

  Future<List<SearchHistoryModel>> getAllSearchHistoriesForUser(String userId) async {
    final querySnapshot = await _searchHistoryCollection.where('user_id', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => SearchHistoryModel.fromDocument(doc)).toList();
  }

  Future<void> addSearchTerm(String userId, SearchTerm searchTerm) async {
    final doc = await _searchHistoryCollection.where('user_id', isEqualTo: userId).limit(1).get();
    if (doc.docs.isNotEmpty) {
      final searchHistory = SearchHistoryModel.fromDocument(doc.docs.first);
      searchHistory.searchTerms.add(searchTerm);
      await _searchHistoryCollection.doc(searchHistory.id).update({'search_terms': searchHistory.searchTerms.map((e) => e.toMap()).toList()});
    }
  }

  Future<void> clearSearchHistory(String userId) async {
    final doc = await _searchHistoryCollection.where('user_id', isEqualTo: userId).limit(1).get();
    if (doc.docs.isNotEmpty) {
      await _searchHistoryCollection.doc(doc.docs.first.id).update({'search_terms': []});
    }
  }
}
