part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchMeals extends SearchEvent {
  final String searchQuery;
  FetchSearchMeals(
    this.searchQuery,
  );
  List<Object> get props => [searchQuery];
}

final class SearchMealsLoding extends SearchState {
  SearchMealsLoding();
}

final class SearchMealsLoaded extends SearchState {
  final List<MealModel> meals;

  SearchMealsLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

final class SearchMealsError extends SearchState {
  final String message;

  SearchMealsError(this.message);

  @override
  List<Object> get props => [message];
}
