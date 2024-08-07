import 'package:cloud_firestore/cloud_firestore.dart';

class SearchTerm {
  final String term;
  final Timestamp timestamp;

  SearchTerm({
    required this.term,
    required this.timestamp,
  });

  factory SearchTerm.fromMap(Map<String, dynamic> data) {
    return SearchTerm(
      term: data['term'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'term': term,
      'timestamp': timestamp,
    };
  }
}

class SearchHistoryModel {
  final String id;
  final String userId;
  final List<SearchTerm> searchTerms;

  SearchHistoryModel({
    required this.id,
    required this.userId,
    required this.searchTerms,
  });

  factory SearchHistoryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return SearchHistoryModel(
      id: doc.id,
      userId: data['user_id'],
      searchTerms: List<SearchTerm>.from(data['search_terms'].map((item) => SearchTerm.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'search_terms': searchTerms.map((item) => item.toMap()).toList(),
    };
  }

  List<SearchTerm> get searchTermList => searchTerms;
}

