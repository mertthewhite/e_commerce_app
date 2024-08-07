part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllMeals extends HomeEvent {
  const FetchAllMeals();

  @override
  List<Object> get props => [];
}

class CardIndexHome extends HomeEvent {
  const CardIndexHome(
    this.cardIndexHome,
  );
  final int cardIndexHome;

  @override
  List<Object> get props => [cardIndexHome];
}

class RatingStars extends HomeEvent {
  const RatingStars(
    this.ratingStars,
    this.meal,
  );
  final double ratingStars;
  final MealModel meal;

  @override
  List<Object> get props => [ratingStars, meal];
}

final class SearchQueryChanged extends HomeEvent {
  const SearchQueryChanged({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

class FilterMealsEvent extends HomeEvent {
  const FilterMealsEvent({required this.filters});
  final List<String> filters;

  @override
  List<Object> get props => [filters];
}

class HomeFiltered extends HomeEvent {
  const HomeFiltered({required this.meals});
  final List<MealModel> meals;

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

class FetchCategory extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FetchFilteCategoryMeals extends HomeEvent {
  const FetchFilteCategoryMeals({required this.endpoint2});
  final String endpoint2;
  @override
  List<Object> get props => [
        endpoint2,
      ];
}

class RatingHomeHive extends HomeEvent {
  const RatingHomeHive(this.favourite, this.rating);
  final MealModel favourite;
  final double rating;

  @override
  List<Object> get props => [favourite, rating];
}

class UpdateProductRatingEvent extends HomeEvent {
  const UpdateProductRatingEvent(this.meal, this.newRating);
  final MealModel meal;
  final double newRating;
}
