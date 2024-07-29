part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final MealModel product;

  const AddToCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class AddToHiveCartEvent extends CartEvent {
  final MealModel product;

  const AddToHiveCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveHiveFromCartEvent extends CartEvent {
  final MealModel meal;

  const RemoveHiveFromCartEvent(this.meal);

  @override
  List<Object> get props => [meal];
}

class ClearHiveCartEvent extends CartEvent {
  final MealModel meal;
  const ClearHiveCartEvent(this.meal);

  @override
  List<Object> get props => [meal];
}

class RemoveFromCartEvent extends CartEvent {
  final MealModel product;

  const RemoveFromCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class ClearCartEvent extends CartEvent {
  final MealModel product;

  const ClearCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class LoadCartItemsEvent extends CartEvent {
  final List<MealModel> product;

  const LoadCartItemsEvent(
    this.product,
  );
  List<Object> get props => [product];
}

class CartUpdatedState extends CartEvent {
  final List<MealModel> cartItems;

  const CartUpdatedState(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class TotalPriceUpdatedState extends CartEvent {
  final double totalPrice;

  const TotalPriceUpdatedState(this.totalPrice);

  @override
  List<Object> get props => [totalPrice];
}
