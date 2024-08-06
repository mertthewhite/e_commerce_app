import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<AddToFavouriteEvent>(_onAddToFavourite);
    on<RemoveFromFavouriteEvent>(_onRemoveFromFavourite);
    on<ClearFavouritesEvent>(_onClearFavourites);
    on<AddToCartFavouriteEvent>(_onAddToCart);
    on<IndexFavouriteEvent>(_onIndexFavourite);
    on<AddHiveToFavouriteEvent>(_onHiveAddToFavourite);
    on<RemoveHiveFromFavouriteEvent>(_onHiveRemoveFromFavourite);
    on<ClearHiveFavouritesEvent>(_onHivelearFavourites);
    on<LoadFavouritesEvent>(_onLoadFavourites);
    on<RatingHive>(_onRatingHive);
  }
  final favouritesBox = Hive.box<MealModel>(HiveDatabaseConstants.favouriteBox);

  Future<void> _onAddToCart(
    AddToCartFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final newFavourites = List<MealModel>.from(state.favourites);
      newFavourites.addAll(event.favourite);
      emit(state.copyWith(
        status: ViewStatus.success,
        favourites: newFavourites,
      ));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  Future<void> _onRatingHive(
    RatingHive event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      final updatedFavourites = List<MealModel>.from(state.favourites);
      final index = updatedFavourites
          .indexWhere((meal) => meal.idMeal == event.favourite.idMeal);

      if (index != -1) {
        updatedFavourites[index] =
            updatedFavourites[index].copyWith(rating: event.rating);

        final hiveIndex = favouritesBox.values
            .toList()
            .indexWhere((meal) => meal.idMeal == event.favourite.idMeal);

        if (hiveIndex != -1) {
          favouritesBox.putAt(hiveIndex, updatedFavourites[index]);
        }

        emit(state.copyWith(favourites: updatedFavourites));
      }
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.failure));
    }
  }

  Future<void> _onAddToFavourite(
    AddToFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final favourite = event.favourite;
      final currentFavourites = List<MealModel>.from(state.favourites);

      if (!currentFavourites.contains(favourite)) {
        currentFavourites.add(favourite);
        await favouritesBox.put(event.favourite.idMeal, event.favourite);
      }

      emit(state.copyWith(
          status: ViewStatus.success, favourites: currentFavourites));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  Future<void> _onRemoveFromFavourite(
    RemoveFromFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final favourite = event.favourite;
      final currentFavourites = List<MealModel>.from(state.favourites);

      currentFavourites.remove(favourite);
      await favouritesBox.delete(event.favourite.idMeal);

      emit(state.copyWith(
          status: ViewStatus.success, favourites: currentFavourites));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  void _onClearFavourites(
    ClearFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) {
    emit(state.copyWith(status: ViewStatus.loading, favourites: []));
  }

  void _onIndexFavourite(
    IndexFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) {
    emit(state.copyWith(index: event.index));
  }

  Future<void> _onLoadFavourites(
    LoadFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final favourites = favouritesBox.values.toList();
      emit(state.copyWith(
        status: ViewStatus.success,
        favourites: favourites,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.failure,
      ));
    }
  }

  Future<void> _onHiveAddToFavourite(
    AddHiveToFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      final currentFavourites = List<MealModel>.from(state.favourites);

      if (!currentFavourites.contains(event.favourite)) {
        currentFavourites.add(event.favourite);
        await favouritesBox.put(event.favourite.idMeal, event.favourite);
      }

      emit(state.copyWith(
          status: ViewStatus.success, favourites: currentFavourites));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.failure,
      ));
    }
  }

  Future<void> _onHiveRemoveFromFavourite(
    RemoveHiveFromFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      final currentFavourites = List<MealModel>.from(state.favourites);

      currentFavourites.remove(event.favourite);
      await favouritesBox.delete(event.favourite.idMeal);

      emit(state.copyWith(
          status: ViewStatus.success, favourites: currentFavourites));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.failure,
      ));
    }
  }

  void _onHivelearFavourites(
    ClearHiveFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) {
    favouritesBox.clear();
    emit(state.copyWith(status: ViewStatus.loading, favourites: []));
  }

  void clearFavourites(
    ClearFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) {
    favouritesBox.clear();

    emit(const FavouriteState(favourites: []));
  }
}
