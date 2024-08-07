import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(this.repository) : super(const ExploreState()) {
    on<FetchExploreCategory>(_onFecthCategory);
  }
  final GeneralRepository repository;

  Future<void> _onFecthCategory(
    FetchExploreCategory event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final mealsCategoryName = await repository.fetchMealCategoryName();
      if (mealsCategoryName.isEmpty) {
        emit(
          state.copyWith(
            status: ViewStatus.failure,
            errorMessage: 'No data found',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ViewStatus.success,
            mealCategoryModel: mealsCategoryName,
          ),
        );
        if (kDebugMode) {
          print(mealsCategoryName);
        }
        state.copyWith(mealCategoryModel: mealsCategoryName);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching category meals');
      }
      emit(
        state.copyWith(
          status: ViewStatus.failure,
          errorMessage: 'Error fetching category meals',
        ),
      );
    }
  }
}
