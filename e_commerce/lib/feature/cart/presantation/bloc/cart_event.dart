part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  const AddToCartEvent(this.product);
  final MealModel product;

  @override
  List<Object> get props => [product];
}

class AddToHiveCartEvent extends CartEvent {
  const AddToHiveCartEvent(this.product);
  final MealModel product;

  @override
  List<Object> get props => [product];
}

class RemoveHiveFromCartEvent extends CartEvent {
  const RemoveHiveFromCartEvent(this.meal);
  final MealModel meal;

  @override
  List<Object> get props => [meal];
}

class ClearHiveCartEvent extends CartEvent {
  const ClearHiveCartEvent();

  @override
  List<Object> get props => [];
}

class RemoveFromCartEvent extends CartEvent {
  const RemoveFromCartEvent(this.product);
  final MealModel product;

  @override
  List<Object> get props => [product];
}

class ClearCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class LoadCartItemsEvent extends CartEvent {
  const LoadCartItemsEvent(
    this.product,
  );
  final List<MealModel> product;
  @override
  List<Object> get props => [product];
}

class CartUpdatedState extends CartEvent {
  const CartUpdatedState(this.cartItems);
  final List<MealModel> cartItems;

  @override
  List<Object> get props => [cartItems];
}

class TotalPriceUpdatedState extends CartEvent {
  const TotalPriceUpdatedState(this.totalPrice);
  final double totalPrice;

  @override
  List<Object> get props => [totalPrice];
}

class AddedMeals extends CartEvent {
  @override
  List<Object> get props => [];
}
