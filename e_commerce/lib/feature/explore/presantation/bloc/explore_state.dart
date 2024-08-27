part of 'explore_bloc.dart';

final class ExploreState extends Equatable {
  const ExploreState({
    this.status = ViewStatus.loading,
    this.errorMessage = '',
    this.mealCategoryModel = const [],
  });

  final ViewStatus status;
  final String errorMessage;
  final List<MealCategoryNameModel> mealCategoryModel;

  @override
  List<Object?> get props => [
        errorMessage,
        status,
        mealCategoryModel,
      ];

  ExploreState copyWith({
    ViewStatus? status,
    String? errorMessage,
    List<MealCategoryNameModel>? mealCategoryModel,
  }) {
    return ExploreState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      mealCategoryModel: mealCategoryModel ?? this.mealCategoryModel,
    );
  }
}
