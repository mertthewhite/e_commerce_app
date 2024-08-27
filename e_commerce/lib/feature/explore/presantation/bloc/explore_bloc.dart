import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/explore/data/model/meal_category_name_model.dart';
import 'package:e_commerce/feature/explore/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/feature/home/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(this._ucGetMeal) : super(const ExploreState()) {
    on<FetchExploreCategory>(fetchMealCategoryName);
  }
  final UCGetMealCategoryName _ucGetMeal;

  Future<void> fetchMealCategoryName(
    FetchExploreCategory event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(
      status: ViewStatus.loading,
      errorMessage: '',
    ));

    final response = await _ucGetMeal.getMealCategoryName();

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
            mealCategoryModel: meal,
          ),
        );
        print(state.mealCategoryModel);
      },
    );
  }
}
