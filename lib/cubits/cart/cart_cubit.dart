import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mycloudpa/model/menu_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(MenuItem item, int quantity){
    var lastState = state as CartInitial;
    var updatedCartItems = List<Map<MenuItem, int>>.from(lastState.cartItems ?? []);
    var newItem = {item: quantity};
    updatedCartItems.add(newItem);
    emit(lastState.copyWith(cartItems: updatedCartItems));
  }

void removeFromCart(Map<MenuItem, int> item) {
  (state as CartInitial).cartItems.removeWhere((element) => element.keys.first == item.keys.first);
  emit(state as CartInitial);
}


  void onUsernameChanged(String? username){
     emit((state as CartInitial).copyWith(username: username));
  }
}
