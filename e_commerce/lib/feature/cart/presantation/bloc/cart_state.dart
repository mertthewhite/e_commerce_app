part of 'cart_bloc.dart';

final class CartState extends Equatable {
  const CartState({
    this.failure,
    this.status = ViewStatus.loading,
    this.product = const <MealModel>[],
    this.totalPrice = 0.0,
  });

  final ViewStatus status;
  final List<MealModel> product;
  final Failure? failure;
  final double totalPrice;

  @override
  List<Object?> get props => [
        status,
        product,
        failure,
        totalPrice,
      ];

  CartState copyWith({
    ViewStatus? status,
    List<MealModel>? product,
    Failure? failure,
    double? totalPrice,
  }) {
    return CartState(
      failure: failure ?? this.failure,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }
}
