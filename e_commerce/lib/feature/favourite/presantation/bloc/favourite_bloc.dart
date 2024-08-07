import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<AddToFavouriteEvent>(_onAddToFavourite);
    on<RemoveFromFavouriteEvent>(_onRemoveFromFavourite);
    on<ClearFavouritesEvent>(_onClearFavourites);
    on<IndexFavouriteEvent>(_onIndexFavourite);
    on<LoadFavouritesEvent>(_onLoadFavourites);
    on<RatingHive>(_onRatingHive);
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

        await HiveDatabaseManager().updateFavouriteRating(
          event.favourite.idMeal ?? '',
          updatedFavourites[index],
        );

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
        await HiveDatabaseManager().addFavouriteToHive(favourite);
      }

      emit(
        state.copyWith(
          status: ViewStatus.success,
          favourites: currentFavourites,
        ),
      );
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
      await HiveDatabaseManager()
          .removeFavouriteFromHive(favourite.idMeal ?? '');

      emit(
        state.copyWith(
          status: ViewStatus.success,
          favourites: currentFavourites,
        ),
      );
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  void _onClearFavourites(
    ClearFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) {
    emit(
      state.copyWith(
        status: ViewStatus.loading,
        favourites: [],
      ),
    );
  }

  void _onIndexFavourite(
    IndexFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) {
    emit(
      state.copyWith(index: event.index),
    );
  }

  Future<void> _onLoadFavourites(
    LoadFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final favourites = await HiveDatabaseManager().loadFavouritesFromHive();
      emit(
        state.copyWith(
          status: ViewStatus.success,
          favourites: favourites,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ViewStatus.failure,
        ),
      );
    }
  }
}
