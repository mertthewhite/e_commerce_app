part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchMeals extends SearchEvent {
  const FetchSearchMeals(
    this.searchQuery,
  );
  final String searchQuery;
  @override
  List<Object> get props => [searchQuery];
}
