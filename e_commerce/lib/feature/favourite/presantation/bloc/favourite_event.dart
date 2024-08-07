part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavouriteEvent extends FavouriteEvent {
  const AddToFavouriteEvent(this.favourite);
  final MealModel favourite;

  @override
  List<Object> get props => [favourite];
}

class RemoveFromFavouriteEvent extends FavouriteEvent {
  const RemoveFromFavouriteEvent(this.favourite);
  final MealModel favourite;

  @override
  List<Object> get props => [favourite];
}

class ClearFavouritesEvent extends FavouriteEvent {}

class AddToCartFavouriteEvent extends FavouriteEvent {
  const AddToCartFavouriteEvent(this.favourite);
  final List<MealModel> favourite;

  @override
  List<Object> get props => [favourite];
}

class IndexFavouriteEvent extends FavouriteEvent {
  const IndexFavouriteEvent(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class AddHiveToFavouriteEvent extends FavouriteEvent {
  const AddHiveToFavouriteEvent(this.favourite);
  final MealModel favourite;

  @override
  List<Object> get props => [favourite];
}

class RemoveHiveFromFavouriteEvent extends FavouriteEvent {
  const RemoveHiveFromFavouriteEvent(this.favourite);
  final MealModel favourite;

  @override
  List<Object> get props => [favourite];
}

class ClearHiveFavouritesEvent extends FavouriteEvent {
  const ClearHiveFavouritesEvent();
}

class RatingHive extends FavouriteEvent {
  const RatingHive(this.favourite, this.rating);
  final MealModel favourite;
  final double rating;

  @override
  List<Object> get props => [favourite, rating];
}

class LoadRatingEvent extends FavouriteEvent {
  const LoadRatingEvent(this.favourite);
  final MealModel favourite;

  @override
  List<Object> get props => [favourite];
}
