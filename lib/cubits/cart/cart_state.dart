part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  final List<Map<MenuItem, int>> cartItems;
  final String? username;

  CartInitial({this.cartItems= const [], this.username});

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      item.forEach((menuItem, quantity) {
        total += menuItem.price * quantity;
      });
    }
    return total;
  }

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
