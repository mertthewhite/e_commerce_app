part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.meals = const [],
    this.cardIndexHome = 0,
    this.searchQuery = '',
    this.filters = const [],
    this.index = 0,
    this.mealCategoryModel = const [],
    this.status,
    this.errorMessage,
  });

  final List<MealModel> meals;
  final List<MealCategory> mealCategoryModel;
  final int cardIndexHome;
  final String searchQuery;
  final List<String> filters;
  final int index;
  final ViewStatus? status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        meals,
        cardIndexHome,
        searchQuery,
        filters,
        index,
        mealCategoryModel,
        status,
        errorMessage
      ];

  HomeState copyWith({
    List<MealModel>? meals,
    int? cardIndexHome,
    String? searchQuery,
    List<String>? filters,
    int? index,
    List<MealCategory>? mealCategoryModel,
    ViewStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      mealCategoryModel: mealCategoryModel ?? this.mealCategoryModel,
      filters: filters ?? this.filters,
      searchQuery: searchQuery ?? this.searchQuery,
      meals: meals ?? this.meals,
      cardIndexHome: cardIndexHome ?? this.cardIndexHome,
      index: index ?? this.index,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
