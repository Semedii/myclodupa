import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/model/menu_item.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final MenuItem menuItem;
  AddToCartCubit(this.menuItem)
      : super(AddToCartInitial(menuItem: menuItem, quantity: 1));

  void incrementQuantity() {
    var currentState = state as AddToCartInitial;

    emit(currentState.copyWith(quantity: currentState.quantity + 1));
  }

  void decrementQuantity() {
    var currentState = state as AddToCartInitial;
    if (currentState.quantity > 1) {
      emit(currentState.copyWith(quantity: currentState.quantity - 1));
    }
  }
}
