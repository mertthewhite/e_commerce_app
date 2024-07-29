part of 'explore_bloc.dart';

enum ExploreStatus { initial, loading, loaded, error }

final class ExploreState extends Equatable {
  const ExploreState({
    this.categories = const [],
    this.status = ExploreStatus.initial,
    this.errorMessage = "",
    this.mealCategoryModel = const [],
  });

  final List<Category> categories;
  final ExploreStatus status;
  final String errorMessage;
  final List<MealCategory> mealCategoryModel;

  @override
  List<Object?> get props => [
        categories,
        errorMessage,
        status,
        mealCategoryModel,
      ];

  ExploreState copyWith({categories, status, errorMessage, mealCategoryModel}) {
    return ExploreState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      mealCategoryModel: mealCategoryModel ?? this.mealCategoryModel,
    );
  }
}
