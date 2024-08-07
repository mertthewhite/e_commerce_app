part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.mealSearchModel = const [],
    this.status = ViewStatus.loading,
  });

  final List<MealModel> mealSearchModel;
  final ViewStatus status;

  @override
  List<Object> get props => [mealSearchModel, status];

  SearchState copyWith({
    List<MealModel>? mealSearchModel,
    ViewStatus? status,
  }) {
    return SearchState(
      mealSearchModel: mealSearchModel ?? this.mealSearchModel,
      status: status ?? this.status,
    );
  }
}
