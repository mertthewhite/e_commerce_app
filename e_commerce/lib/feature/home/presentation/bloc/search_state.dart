part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.mealSearchModel = const [],
  });

  final List<MealModel> mealSearchModel;

  @override
  List<Object> get props => [mealSearchModel];

  SearchState copyWith({
    List<MealModel>? mealSearchModel,
  }) {
    return SearchState(
      mealSearchModel: mealSearchModel ?? this.mealSearchModel,
    );
  }
}
