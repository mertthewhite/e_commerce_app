import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final cartBox = Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);
  CartBloc() : super(CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
    on<LoadCartItemsEvent>(_onLoadCartItems);
    on<TotalPriceUpdatedState>(_onTotalPrice);
    on<AddToHiveCartEvent>((event, emit) {
      addMealToCart(event.product, this, cartBox);
    });
    on<ClearHiveCartEvent>((event, emit) {
      clearCart(cartBox, this);
    });
    on<RemoveHiveFromCartEvent>((event, emit) async {
      await removeMealFromCart(event.meal, this, cartBox);
    });
  }

  Future<void> removeMealFromCart(
      MealModel meal, CartBloc bloc, Box cartBox) async {
    final currentProducts = List<MealModel>.from(bloc.state.product);

    currentProducts.removeWhere((m) => m.idMeal == meal.idMeal);
    final mealsToRemove =
        cartBox.values.where((m) => m.idMeal == meal.idMeal).toList();

    for (var mealToRemove in mealsToRemove) {
      final index = cartBox.values.toList().indexOf(mealToRemove);
      if (index != -1) {
        await cartBox.deleteAt(index);
      }
    }

    bloc.emit(bloc.state
        .copyWith(status: ViewStatus.success, product: currentProducts));
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final product = <MealModel>[];
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final productEvent = event.product;
      final newProduct = state.product;

      product.add(productEvent);

      emit(state.copyWith(
          status: ViewStatus.success, product: newProduct + product));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  void clearCart(Box cartBox, CartBloc bloc) {
    cartBox.clear();

    bloc.emit(CartState(product: []));
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final product = event.product;
      final newProduct = state.product;
      newProduct.remove(product);
      final index = cartBox.values
          .toList()
          .indexWhere((meal) => meal.idMeal == event.product.idMeal);
      cartBox.deleteAt(index);
      emit(state.copyWith(status: ViewStatus.success, product: newProduct));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));

      emit(state.copyWith(status: ViewStatus.success, product: []));
    } on Failure catch (e) {
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  Future<void> _onLoadCartItems(
    LoadCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final product = event.product;
      if (kDebugMode) {
        print("Loaded products: $product");
      }
      emit(state.copyWith(status: ViewStatus.success, product: product));
    } on Failure catch (e) {
      print("Error loading cart items: $e");
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  void _onTotalPrice(TotalPriceUpdatedState event, Emitter<CartState> emit) {
    emit(state.copyWith(totalPrice: event.totalPrice));
  }

  void addMealToCart(MealModel meal, CartBloc bloc, Box cartBox) {
    final newList = List<MealModel>.from(bloc.state.product)..add(meal);

    cartBox.add(meal);

    bloc.emit(CartState(product: newList));
  }
}
