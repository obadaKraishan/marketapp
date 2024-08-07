import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/search_history_model.dart';

abstract class SearchHistoryState extends Equatable {
  const SearchHistoryState();

  @override
  List<Object> get props => [];
}

class SearchHistoryInitial extends SearchHistoryState {}

class SearchHistoryLoading extends SearchHistoryState {}

class SearchHistoryLoaded extends SearchHistoryState {
  final List<SearchTerm> searchTerms;

  SearchHistoryLoaded(this.searchTerms);

  @override
  List<Object> get props => [searchTerms];
}

class SearchHistoryError extends SearchHistoryState {
  final String message;

  SearchHistoryError(this.message);

  @override
  List<Object> get props => [message];
}
