part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  final List<Map<MenuItem, int>>? cartItems;

  CartInitial({this.cartItems});

  CartInitial copyWith({List<Map<MenuItem, int>>? cartItems}) {
    return CartInitial(cartItems: cartItems ?? this.cartItems);
  }
}
