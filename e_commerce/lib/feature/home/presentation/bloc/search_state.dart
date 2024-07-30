part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.mealSearchModel = const [],
  });

  final List<MealModel> mealSearchModel;
  @override
  List<Object> get props => [mealSearchModel];

  SearchState copyWith({
    mealSearchModel,
  }) {
    return SearchState(
      mealSearchModel: mealSearchModel ?? this.mealSearchModel,
    );
  }
}
