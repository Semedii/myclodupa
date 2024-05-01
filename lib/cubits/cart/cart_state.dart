part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  final List<Map<MenuItem, int>>? cartItems;
  final String? username;

  CartInitial({this.cartItems, this.username});

  CartInitial copyWith({
    List<Map<MenuItem, int>>? cartItems,
    String? username,
  }) {
    return CartInitial(
      cartItems: cartItems ?? this.cartItems,
      username: username ?? this.username,
    );
  }
}
