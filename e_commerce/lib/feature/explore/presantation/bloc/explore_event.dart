part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class CategoryLoading extends ExploreState {
  @override
  List<Object> get props => [];
}

final class CategoryLoaded extends ExploreState {
  final List<MealCategory> mealCategoryModel;

  CategoryLoaded({required this.mealCategoryModel});

  @override
  List<Object> get props => [mealCategoryModel];
}

final class CategoryError extends ExploreState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object> get props => [message];
}

class FetchExploreCategory extends ExploreEvent {
  @override
  List<Object> get props => [];
}
