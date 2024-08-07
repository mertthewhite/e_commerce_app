import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(const SearchState()) {
    on<SearchEvent>((event, emit) {});
    on<FetchSearchMeals>(_onFetchAllMeals);
  }
  final GeneralRepository repository;
  Future<void> _onFetchAllMeals(
      FetchSearchMeals event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(
        status: ViewStatus.loading,
      ),
    );
    try {
      if (kDebugMode) {
        print('Fetching meals');
      }
      final meals = await repository.fetchSearchMeals(event.searchQuery);
      if (meals.isEmpty) {
        print('No meals found');
        emit(
          state.copyWith(
            status: ViewStatus.failure,
          ),
        );
      } else {
        if (kDebugMode) {
          print('Meals found');
        }
        emit(
          state.copyWith(
            mealSearchModel: meals,
            status: ViewStatus.success,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching meals');
      }
      emit(
        state.copyWith(
          status: ViewStatus.failure,
        ),
      );
    }
  }
}
