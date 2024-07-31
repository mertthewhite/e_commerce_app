part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.meals = const [],
    this.cardIndexHome = 0,
    this.ratingStar = 0.0,
    this.searchQuery = '',
    this.filters = const [],
    this.index = 0,
    this.mealCategoryModel = const [],
  });

  final List<MealModel> meals;
  final List<MealCategory> mealCategoryModel;
  final int cardIndexHome;
  final double ratingStar;
  final String searchQuery;
  final List<String> filters;
  final int index;

  @override
  List<Object?> get props => [
        meals,
        cardIndexHome,
        ratingStar,
        searchQuery,
        filters,
        index,
        mealCategoryModel
      ];

  HomeState copyWith({
    List<MealModel>? meals,
    int? cardIndexHome,
    double? ratingStars,
    String? searchQuery,
    List<String>? filters,
    int? index,
    List<MealCategory>? mealCategoryModel,
  }) {
    return HomeState(
      mealCategoryModel: mealCategoryModel ?? this.mealCategoryModel,
      filters: filters ?? this.filters,
      searchQuery: searchQuery ?? this.searchQuery,
      meals: meals ?? this.meals,
      cardIndexHome: cardIndexHome ?? this.cardIndexHome,
      ratingStar: ratingStars ?? this.ratingStar,
      index: index ?? this.index,
    );
  }
}
