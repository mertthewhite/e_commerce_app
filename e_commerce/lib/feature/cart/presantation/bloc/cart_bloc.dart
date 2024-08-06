import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<AddToHiveCartEvent>(_addMealToCart);
    on<TotalPriceUpdatedState>(_onTotalPrice);
    on<ClearHiveCartEvent>(_clearCart);
    on<RemoveHiveFromCartEvent>(_removeMealFromCart);
    on<AddedMeals>(_onAddedMealFunc);
  }

  Future<void> _removeMealFromCart(
    RemoveHiveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final meal = event.meal;
    final currentProducts = List<MealModel>.from(state.product);
    await HiveDatabaseManager().allRemoveMealFromHiveBox(meal.idMeal ?? '');

    emit(state.copyWith(
      status: ViewStatus.success,
      product: currentProducts,
    ));
  }

  Future<void> _addMealToCart(
    AddToHiveCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      final meal = event.product;
      final newList = List<MealModel>.from(state.product)..add(meal);

      await HiveDatabaseManager().addMealToHiveBox(meal);

      emit(state.copyWith(product: newList));
    } catch (error) {
      print('$error');
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));

      final product = event.product;
      final newProductList = List<MealModel>.from(state.product)
        ..remove(product);

      await HiveDatabaseManager().singleRemoveMealFromHiveBox(product);

      emit(
        state.copyWith(
          status: ViewStatus.success,
          product: newProductList,
        ),
      );
    } on Failure catch (e) {
      emit(
        state.copyWith(status: ViewStatus.failure, failure: e),
      );
    }
  }

  Future<void> _clearCart(
    ClearHiveCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await HiveDatabaseManager().clearCart();

    emit(state.copyWith(product: []));
  }

  void _onTotalPrice(TotalPriceUpdatedState event, Emitter<CartState> emit) {
    emit(state.copyWith(totalPrice: event.totalPrice));
  }

  Future<void> _onAddedMealFunc(
    AddedMeals event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final addedMeals = <MealModel, int>{};
      await HiveDatabaseManager().getAddedMeals().then(addedMeals.addAll);

      emit(state.copyWith(
        status: ViewStatus.success,
        addedMeals: addedMeals,
      ));
    } on Failure catch (e) {
      emit(state.copyWith(
        status: ViewStatus.failure,
        failure: e,
      ));
    }
  }
}
