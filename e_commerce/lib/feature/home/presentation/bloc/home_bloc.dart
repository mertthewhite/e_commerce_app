import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GeneralRepository repository;
  HomeBloc(this.repository) : super(HomeState()) {
    on<FetchAllMeals>(_onFetchAllMeals);
    on<CardIndexHome>((event, emit) {
      cardIndexHome(event, emit, event.cardIndexHome);
    });
    on<RatingStars>((event, emit) {
      ratingStars(event, emit, event.ratingStars);
    });
    on<SearchQueryChanged>((event, emit) {
      _searchQueryChanged(event, emit);
    });
    on<FilterMealsEvent>((event, emit) {
      _updateFAllProducFilter(event, emit);
    });
    on<UpdatePlusIndex>((event, emit) {
      _updatePlusIndex(emit, event);
    });
    on<UpdateMinusIndex>((event, emit) {
      _updateMinusIndex(emit, event);
    });
    on<UpdateClearIndex>((event, emit) {
      _updateIndex(emit, event);
    });
    on<FetchCategory>(_onFecthCategory);
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

  Future<void> _onFecthCategory(
      FetchCategory event, Emitter<HomeState> emit) async {
    emit(CategoryLoading());
    try {
      print('Fetching category meals');
      final mealsCategoryName = await repository.fetchMealCategorynName();
      if (mealsCategoryName.isEmpty) {
        emit(CategoryError('No meals category found.'));
      } else {
        emit(CategoryLoaded(
          mealCategoryModel: mealsCategoryName,
        ));
        state.copyWith(mealCategoryModel: mealsCategoryName);
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
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

  void ratingStars(
    RatingStars event,
    Emitter<HomeState> emit,
    double ratingStars,
  ) {
    emit(
      state.copyWith(
        ratingStars: event.ratingStars,
      ),
    );
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
