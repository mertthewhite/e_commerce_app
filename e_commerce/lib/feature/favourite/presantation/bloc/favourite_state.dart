part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final List<MealModel> favourites;
  final ViewStatus status;
  final Failure? failure;
  final int index;
  final double rating;

  const FavouriteState({
    this.favourites = const [],
    this.status = ViewStatus.loading,
    this.failure,
    this.index = 0,
    this.rating = 0,
  });

  FavouriteState copyWith({
    List<MealModel>? favourites,
    ViewStatus? status,
    Failure? failure,
    int? index,
    double? rating,
  }) {
    return FavouriteState(
      rating: rating ?? this.rating,
      index: index ?? this.index,
      favourites: favourites ?? this.favourites,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [favourites, status, failure, index];
}

class LoadFavouritesEvent extends FavouriteEvent {
  const LoadFavouritesEvent();
}
