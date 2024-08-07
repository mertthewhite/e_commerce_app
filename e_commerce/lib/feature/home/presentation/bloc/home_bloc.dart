import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repository) : super(const HomeState()) {
    on<FetchAllMeals>(_onFetchAllMeals);
    on<CardIndexHome>(_cardIndexHome);
    on<SearchQueryChanged>(_searchQueryChanged);
    on<FilterMealsEvent>(_updateFAllProductFilter);
    on<UpdatePlusIndex>(_updatePlusIndex);
    on<UpdateMinusIndex>(_updateMinusIndex);
    on<UpdateClearIndex>(_updateIndex);
  }

  final GeneralRepository repository;

  Future<void> _onFetchAllMeals(
    FetchAllMeals event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      status: ViewStatus.loading,
    ));
    try {
      print('Fetching meals');
      final meals = await repository.fetchAllMeals();
      if (meals.isEmpty) {
        emit(
          state.copyWith(
            status: ViewStatus.failure,
            errorMessage: 'No meals found.',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ViewStatus.success,
            meals: meals,
            errorMessage: "success",
          ),
        );
      }
    } catch (e) {
      print('Error fetching meals');
      emit(
        state.copyWith(
          status: ViewStatus.failure,
          errorMessage: 'Error fetching meals',
        ),
      );
    }
  }

  void _cardIndexHome(
    CardIndexHome event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        cardIndexHome: event.cardIndexHome,
      ),
    );
  }

  void _searchQueryChanged(
    SearchQueryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        searchQuery: event.query,
        meals: [],
      ),
    );
  }

  void _updateFAllProductFilter(
    FilterMealsEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(filters: event.filters),
    );
  }

  void _updatePlusIndex(
    UpdatePlusIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(index: state.index + 1),
    );
  }

  void _updateMinusIndex(
    UpdateMinusIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(index: state.index - 1),
    );
  }

  void _updateIndex(
    UpdateClearIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(index: 0),
    );
  }
}
