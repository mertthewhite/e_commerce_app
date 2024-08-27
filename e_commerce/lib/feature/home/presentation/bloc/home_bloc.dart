import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/feature/home/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._ucGetMeal) : super(const HomeState()) {
    on<CardIndexHome>(_cardIndexHome);
    on<SearchQueryChanged>(_searchQueryChanged);
    on<FilterMealsEvent>(_updateFAllProductFilter);
    on<UpdatePlusIndex>(_updatePlusIndex);
    on<UpdateMinusIndex>(_updateMinusIndex);
    on<UpdateClearIndex>(_updateIndex);
    on<FecthNewMeal>(fetchMeal);
  }

  final UCGetMeal _ucGetMeal;

  Future<void> fetchMeal(
    FecthNewMeal event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      status: ViewStatus.loading,
      errorMessage: '',
    ));

    final response = await _ucGetMeal.getMeal();

    response.fold(
      (failure) {
        if (failure is NetworkFailure) {
          emit(
            state.copyWith(
              errorMessage: 'Network Failure',
              status: ViewStatus.failure,
            ),
          );
        } else if (failure is NullResponseFailure) {
          emit(
            state.copyWith(
              errorMessage: 'Null Response Failure',
              status: ViewStatus.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              errorMessage: 'Unknown Failure',
              status: ViewStatus.failure,
            ),
          );
        }
      },
      (meal) {
        print(meal);
        emit(
          state.copyWith(
            status: ViewStatus.success,
            errorMessage: '',
            meals: meal,
          ),
        );
        print(state.meals);
      },
    );
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
