import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final cartBox = Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);

  final GeneralRepository repository;
  HomeBloc(this.repository) : super(HomeState()) {
    on<FetchAllMeals>(_onFetchAllMeals);
    on<CardIndexHome>((event, emit) {
      cardIndexHome(event, emit, event.cardIndexHome);
    });
    on<RatingStars>((event, emit) {
      _onRatingStars(event, emit, event.ratingStars);
    });
    on<SearchQueryChanged>(_searchQueryChanged);
    on<FilterMealsEvent>(_updateFAllProducFilter);
    on<UpdatePlusIndex>((event, emit) {
      _updatePlusIndex(emit, event);
    });
    on<UpdateMinusIndex>((event, emit) {
      _updateMinusIndex(emit, event);
    });
    on<UpdateClearIndex>((event, emit) {
      _updateIndex(emit, event);
    });
    on<FetchFilteCategoryMeals>(_onFetcFilterCategory);
  }

  Future<void> _onFetchAllMeals(
      FetchAllMeals event, Emitter<HomeState> emit) async {
    emit(const AllMealsLoading());
    try {
      print('Fetching meals');
      final meals = await repository.fetchAllMeals();
      if (meals.isEmpty) {
        emit(HomeError('No meals found.'));
      } else {
        emit(AllMealsLoaded(meals));
      }
    } catch (e) {
      print('Error fetching meals');
      emit(HomeError(e.toString()));
    }
  }

  void cardIndexHome(
    CardIndexHome event,
    Emitter<HomeState> emit,
    int cardIndexHome,
  ) {
    emit(
      state.copyWith(
        cardIndexHome: event.cardIndexHome,
      ),
    );
  }

  Future<void> _onRatingStars(
    RatingStars event,
    Emitter<HomeState> emit,
    double ratingStars,
  ) async {
    try {
      final cartBox =
          await Hive.openBox<MealModel>(HiveDatabaseConstants.productModelBox);

      final existingProduct = cartBox.get(event.meal.idMeal);
      print('Rating Stars: ${event.ratingStars}');

      if (existingProduct != null) {
        existingProduct.rating = event.ratingStars;

        await cartBox.put(existingProduct.idMeal, existingProduct);
        print('Rating Stars: ${existingProduct.rating}');
        print('Rating Stars: ${existingProduct}');
      } else {
        event.meal.rating = event.ratingStars;
        await cartBox.put(event.meal.idMeal, event.meal);
      }

      emit(
        state.copyWith(
          ratingStars: event.ratingStars,
        ),
      );
    } catch (e) {}
  }

  void _searchQueryChanged(SearchQueryChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(searchQuery: event.query, meals: []));
  }

  void _updateFAllProducFilter(
      FilterMealsEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(filters: event.filters));
  }

  void _updatePlusIndex(Emitter<HomeState> emit, UpdatePlusIndex event) {
    emit(state.copyWith(index: state.index + 1));
  }

  void _updateMinusIndex(Emitter<HomeState> emit, UpdateMinusIndex event) {
    emit(state.copyWith(index: state.index - 1));
  }

  void _updateIndex(Emitter<HomeState> emit, UpdateClearIndex event) {
    emit(state.copyWith(index: 0));
  }

  Future<void> _onFetcFilterCategory(
      FetchFilteCategoryMeals event, Emitter<HomeState> emit) async {
    emit(FilterCategoryLoading());
    try {
      print('Fetching Filter');
      final meal = await repository.fetchFilterCategoryMeal(
        event.endpoint2,
      );
      if (meal.isEmpty) {
        emit(HomeError('No meals found.'));
      } else {
        emit(FilterCategoryLoaded(
          mealfiltercategory: meal,
        ));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
