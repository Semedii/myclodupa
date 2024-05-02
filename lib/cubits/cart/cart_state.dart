part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  final List<CartItem> cartItems;
  final String? username;

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.menuItem.price * item.quantity;
    }
    return total;
  }

  CartInitial({required this.cartItems, this.username});

  CartInitial copyWith({
    List<CartItem>? cartItems,
    String? username,
  }) {
    return CartInitial(
        cartItems: cartItems ?? this.cartItems,
        username: username ?? this.username);
  }
}
