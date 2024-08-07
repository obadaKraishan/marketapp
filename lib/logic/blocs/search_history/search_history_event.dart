import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/search_history_model.dart';

abstract class SearchHistoryEvent extends Equatable {
  const SearchHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchHistory extends SearchHistoryEvent {
  final String userId;

  LoadSearchHistory(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddSearchTerm extends SearchHistoryEvent {
  final String userId;
  final SearchTerm searchTerm;

  AddSearchTerm(this.userId, this.searchTerm);

  @override
  List<Object> get props => [userId, searchTerm];
}

class ClearSearchHistory extends SearchHistoryEvent {
  final String userId;

  ClearSearchHistory(this.userId);

  @override
  List<Object> get props => [userId];
}
