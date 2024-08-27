part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.mealSearchModel = const [],
    this.status = ViewStatus.loading,
    this.errorMessage = '',
    this.searchQuery = '',
  });

  final List<MealModel> mealSearchModel;
  final ViewStatus status;
  final String errorMessage;
  final String searchQuery;

  @override
  List<Object> get props =>
      [mealSearchModel, status, errorMessage, searchQuery];

  SearchState copyWith({
    List<MealModel>? mealSearchModel,
    ViewStatus? status,
    String? errorMessage,
    String? searchQuery,
  }) {
    return SearchState(
      mealSearchModel: mealSearchModel ?? this.mealSearchModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
