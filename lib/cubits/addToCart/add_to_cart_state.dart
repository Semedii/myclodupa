part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {
  final MenuItem menuItem;
  final int quantity;

  AddToCartInitial({required this.menuItem, required this.quantity});

  AddToCartInitial copyWith({MenuItem? menuItem, int? quantity}) {
    return AddToCartInitial(
      menuItem: menuItem ?? this.menuItem,
      quantity: quantity ?? this.quantity,
    );
  }
}
