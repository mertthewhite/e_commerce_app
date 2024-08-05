part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}

final class AllMealsLoading extends HomeState {
  const AllMealsLoading();

  @override
  List<Object> get props => [];
}

final class FetchAllMeals extends HomeEvent {
  FetchAllMeals();

  @override
  List<Object> get props => [];
}

final class AllMealsLoaded extends HomeState {
  @override
  final List<MealModel> meals;

  const AllMealsLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

class CardIndexHome extends HomeEvent {
  CardIndexHome(
    this.cardIndexHome,
  );
  final int cardIndexHome;

  @override
  List<Object> get props => [cardIndexHome];
}

class RatingStars extends HomeEvent {
  RatingStars(
    this.ratingStars,
    this.meal,
  );
  final double ratingStars;
  final MealModel meal;

  @override
  List<Object> get props => [ratingStars, meal];
}

final class SearchQueryChanged extends HomeEvent {
  SearchQueryChanged({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

class LoadMealsEvent extends HomeEvent {}

class FilterMealsEvent extends HomeEvent {
  final List<String> filters;

  FilterMealsEvent({required this.filters});

  @override
  List<Object> get props => [filters];
}

class HomeLoaded extends HomeEvent {
  final List<MealModel> meals;

  HomeLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class HomeFiltered extends HomeEvent {
  final List<MealModel> meals;

  HomeFiltered({required this.meals});

  @override
  List<Object> get props => [meals];
}

class UpdatePlusIndex extends HomeEvent {
  @override
  List<Object> get props => [];
}

class UpdateMinusIndex extends HomeEvent {
  @override
  List<Object> get props => [];
}

class UpdateClearIndex extends HomeEvent {
  @override
  List<Object> get props => [];
}

final class CategoryLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class CategoryLoaded extends HomeState {
  final List<MealCategory> mealCategoryModel;

  CategoryLoaded({required this.mealCategoryModel});

  @override
  List<Object> get props => [mealCategoryModel];
}

final class CategoryError extends HomeState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object> get props => [message];
}

class FetchCategory extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FetchFilteCategoryMeals extends HomeEvent {
  final String endpoint2;

  FetchFilteCategoryMeals({required this.endpoint2});
  @override
  List<Object> get props => [
        endpoint2,
      ];
}

final class FilterCategoryLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class FilterCategoryLoaded extends HomeState {
  final List<MealCategory> mealfiltercategory;

  FilterCategoryLoaded({required this.mealfiltercategory});

  @override
  List<Object> get props => [mealCategoryModel];
}

class RatingHomeHive extends HomeEvent {
  final MealModel favourite;
  final double rating;

  RatingHomeHive(this.favourite, this.rating);

  @override
  List<Object> get props => [favourite, rating];
}

class UpdateProductRatingEvent extends HomeEvent {
  final MealModel meal;
  final double newRating;

  UpdateProductRatingEvent(this.meal, this.newRating);
}
