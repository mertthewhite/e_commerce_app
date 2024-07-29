part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavouriteEvent extends FavouriteEvent {
  final MealModel favourite;

  const AddToFavouriteEvent(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class RemoveFromFavouriteEvent extends FavouriteEvent {
  final MealModel favourite;

  const RemoveFromFavouriteEvent(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class ClearFavouritesEvent extends FavouriteEvent {}

class AddToCartFavouriteEvent extends FavouriteEvent {
  final List<MealModel> favourite;

  const AddToCartFavouriteEvent(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class IndexFavouriteEvent extends FavouriteEvent {
  final int index;

  const IndexFavouriteEvent(this.index);

  @override
  List<Object> get props => [index];
}

class AddHiveToFavouriteEvent extends FavouriteEvent {
  final MealModel favourite;

  const AddHiveToFavouriteEvent(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class RemoveHiveFromFavouriteEvent extends FavouriteEvent {
  final MealModel favourite;

  const RemoveHiveFromFavouriteEvent(this.favourite);

  @override
  List<Object> get props => [favourite];
}

class ClearHiveFavouritesEvent extends FavouriteEvent {
  const ClearHiveFavouritesEvent();
}
