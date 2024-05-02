import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycloudpa/model/cart_item.dart';
import 'package:mycloudpa/model/menu_item.dart';
import 'package:mycloudpa/utils/pop_up_message.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial(cartItems: const []));

  void addToCart(MenuItem item, int quantity) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<CartItem>.from(lastState.cartItems);
    var existingItemIndex =
        updatedCartItems.indexWhere((cartItem) => cartItem.menuItem == item);

    if (existingItemIndex != -1) {
      // Item already exists in cart, update its quantity
      updatedCartItems[existingItemIndex].quantity += quantity;
    } else {
      // Item doesn't exist in cart, add it
      updatedCartItems.add(CartItem(menuItem: item, quantity: quantity));
    }

    emit(lastState.copyWith(cartItems: updatedCartItems));
    toastInfo("Added to the cart");
  }

  void removeFromCart(MenuItem item) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<CartItem>.from(lastState.cartItems);
    updatedCartItems.removeWhere((cartItem) => cartItem.menuItem == item);
    emit(lastState.copyWith(cartItems: updatedCartItems));
    toastInfo("Removed from the cart");
  }

  void incrementQuantity(MenuItem item) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<CartItem>.from(lastState.cartItems);
    var existingItemIndex =
        updatedCartItems.indexWhere((cartItem) => cartItem.menuItem == item);

    updatedCartItems[existingItemIndex].quantity++;

    emit(lastState.copyWith(cartItems: updatedCartItems));
  }

    void deccrementQuantity(MenuItem item) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<CartItem>.from(lastState.cartItems);
    var existingItemIndex =
        updatedCartItems.indexWhere((cartItem) => cartItem.menuItem == item);

    updatedCartItems[existingItemIndex].quantity--;

    emit(lastState.copyWith(cartItems: updatedCartItems));
  }

  void onUsernameChanged(String? username) {
    emit((state as CartInitial).copyWith(username: username));
  }

  void onPayButtonPressed() {
    _clearCart();
    toastInfo(
        "Your delicious meal is being prepared with care. Sit back, relax, and get ready to enjoy your food soon");
  }

  void _clearCart() {
    emit(CartInitial(cartItems: const [])); // Reset cart state to initial state
  }
}
