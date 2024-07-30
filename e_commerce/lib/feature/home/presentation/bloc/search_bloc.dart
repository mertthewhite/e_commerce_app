import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GeneralRepository repository;

  SearchBloc(this.repository) : super(SearchState()) {
    on<SearchEvent>((event, emit) {});
    on<FetchSearchMeals>(_onFetchAllMeals);
  }
  Future<void> _onFetchAllMeals(
      FetchSearchMeals event, Emitter<SearchState> emit) async {
    emit(SearchMealsLoding());
    try {
      print('Fetching meals');
      final meals = await repository.fetchSearchMeals(event.searchQuery);
      if (meals.isEmpty) {
        print('No meals found');
        emit(SearchMealsError('No meals found.'));
      } else {
        print('Meals found');
        emit(SearchMealsLoaded(meals));
      }
    } catch (e) {
      print('Error fetching meals');
      emit(SearchMealsError(e.toString()));
    }
  }
}
