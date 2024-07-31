part of 'explore_bloc.dart';

enum ExploreStatus { initial, loading, loaded, error }

final class ExploreState extends Equatable {
  const ExploreState({
    this.status = ExploreStatus.initial,
    this.errorMessage = "",
    this.mealCategoryModel = const [],
  });

  final ExploreStatus status;
  final String errorMessage;
  final List<MealCategory> mealCategoryModel;

  @override
  List<Object?> get props => [
        errorMessage,
        status,
        mealCategoryModel,
      ];

  ExploreState copyWith({
    ExploreStatus? status,
    String? errorMessage,
    List<MealCategory>? mealCategoryModel,
  }) {
    return ExploreState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      mealCategoryModel: mealCategoryModel ?? this.mealCategoryModel,
    );
  }
}
