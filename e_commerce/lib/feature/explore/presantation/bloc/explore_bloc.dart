import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(this.repository) : super(ExploreState()) {
    on<ExploreEvent>((event, emit) {});
    on<FetchExploreCategory>(_onFecthCategory);
  }
  final GeneralRepository repository;
  Future<void> _onFecthCategory(
      FetchExploreCategory event, Emitter<ExploreState> emit) async {
    emit(CategoryLoading());
    try {
      final mealsCategoryName = await repository.fetchMealCategoryName();
      if (mealsCategoryName.isEmpty) {
        emit(CategoryError('No meals category found.'));
      } else {
        emit(CategoryLoaded(
          mealCategoryModel: mealsCategoryName,
        ));
        print(mealsCategoryName);
        state.copyWith(mealCategoryModel: mealsCategoryName);
      }
    } catch (e) {
      print('Error fetching category meals');
      emit(CategoryError(e.toString()));
    }
  }
}
