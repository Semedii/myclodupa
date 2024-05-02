import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mycloudpa/model/menu_item.dart';
import 'package:mycloudpa/utils/pop_up_message.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(MenuItem item, int quantity) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<Map<MenuItem, int>>.from(lastState.cartItems);
    var newItem = {item: quantity};
    updatedCartItems.add(newItem);
    emit(lastState.copyWith(cartItems: updatedCartItems));
    toastInfo("added to the cart");
  }

  void removeFromCart(Map<MenuItem, int> item) {
    var lastState = state as CartInitial;
    var updatedCartItems = List<Map<MenuItem, int>>.from(lastState.cartItems);
    updatedCartItems.removeWhere((element) => element == item);
    emit(lastState.copyWith(cartItems: updatedCartItems));
    toastInfo("removed from the cart");
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
    emit(CartInitial()); // Reset cart state to initial state
  }
}
