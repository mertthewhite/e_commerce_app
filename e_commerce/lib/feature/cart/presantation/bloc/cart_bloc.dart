import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
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
      final newList = List<MealModel>.from(state.product)..add(event.product);
      cartBox.add(event.product);
      emit(CartState(product: newList));
    });
    on<RemoveHiveFromCartEvent>((event, emit) {
      final currentProducts = List<MealModel>.from(state.product);

      currentProducts.removeWhere((meal) => meal.idMeal == event.meal.idMeal);

      final mealsToRemove = cartBox.values
          .where((meal) => meal.idMeal == event.meal.idMeal)
          .toList();

      for (var meal in mealsToRemove) {
        final index = cartBox.values.toList().indexOf(meal);
        if (index != -1) {
          cartBox.deleteAt(index);
        }
      }

      emit(
          state.copyWith(status: ViewStatus.success, product: currentProducts));
    });

    on<ClearHiveCartEvent>((event, emit) {
      cartBox.clear();
      emit(CartState(product: []));
    });
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<MealModel> product = [];
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
      final meal = event.product;

      final newProduct = List<MealModel>.from(state.product);
      newProduct.removeWhere((m) => m.idMeal == meal.idMeal);

      emit(state.copyWith(status: ViewStatus.success, product: newProduct));
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
      print("Loaded products: $product");
      emit(state.copyWith(status: ViewStatus.success, product: product));
    } on Failure catch (e) {
      print("Error loading cart items: $e");
      emit(state.copyWith(status: ViewStatus.failure, failure: e));
    }
  }

  void _onTotalPrice(TotalPriceUpdatedState event, Emitter<CartState> emit) {
    emit(state.copyWith(totalPrice: event.totalPrice));
  }
}
