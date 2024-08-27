import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/feature/home/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.ucGetMeal) : super(SearchState()) {
    on<SearchEvent>((event, emit) {});
    on<FetchSearchMeals>(fetchSearchMeal);
  }
  final UCGetMeal ucGetMeal;

  Future<void> fetchSearchMeal(
    FetchSearchMeals event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(
      status: ViewStatus.loading,
      errorMessage: '',
      mealSearchModel: [],
    ));

    final response = await ucGetMeal.getSearchMeal(event.searchQuery);

    response.fold((failure) {
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
    }, (meal) {
      print(meal);
      emit(
        state.copyWith(
            searchQuery: event.searchQuery,
            status: ViewStatus.success,
            errorMessage: '',
            mealSearchModel: meal),
      );
      print(state.mealSearchModel);
    });
  }
}
