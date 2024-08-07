import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/search_history_repository.dart';
import 'search_history_event.dart';
import 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final SearchHistoryRepository _searchHistoryRepository;

  SearchHistoryBloc(this._searchHistoryRepository) : super(SearchHistoryInitial()) {
    on<LoadSearchHistory>((event, emit) async {
      emit(SearchHistoryLoading());
      try {
        final searchHistory = await _searchHistoryRepository.getAllSearchHistoriesForUser(event.userId);
        emit(SearchHistoryLoaded(searchHistory));
      } catch (e) {
        emit(SearchHistoryError(e.toString()));
      }
    });

    on<AddSearchTerm>((event, emit) async {
      emit(SearchHistoryLoading());
      try {
        await _searchHistoryRepository.addSearchTerm(event.userId, event.searchTerm);
        final searchHistory = await _searchHistoryRepository.getAllSearchHistoriesForUser(event.userId);
        emit(SearchHistoryLoaded(searchHistory));
      } catch (e) {
        emit(SearchHistoryError(e.toString()));
      }
    });

    on<ClearSearchHistory>((event, emit) async {
      emit(SearchHistoryLoading());
      try {
        await _searchHistoryRepository.clearSearchHistory(event.userId);
        emit(SearchHistoryLoaded([]));
      } catch (e) {
        emit(SearchHistoryError(e.toString()));
      }
    });
  }
}
