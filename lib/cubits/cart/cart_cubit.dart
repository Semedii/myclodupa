import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mycloudpa/model/menu_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  AddToCart(MenuItem item, int quantity){
    var currentState = state as CartInitial;
    var updatedCartItems = List<Map<MenuItem, int>>.from(currentState.cartItems ?? []);
    var newItem = {item: quantity};
    updatedCartItems.add(newItem);
    emit(currentState.copyWith(cartItems: updatedCartItems));
    print("aaaa ${updatedCartItems.length} ${currentState.cartItems?.length}");
  }
}
