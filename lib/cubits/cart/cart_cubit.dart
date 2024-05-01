// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:mycloudpa/model/menu_item.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());

//   void addItem(MenuItem item) {
//     var lastState = state as CartInitial;
//     final List<MenuItem> updatedCart = List.from(lastState.menuList!)..add(item);
//     emit(lastState.copyWith(menuList: updatedCart));
//   }

//   void removeItem(MenuItem item) {
//       var lastState = state as CartInitial;
//     final List<MenuItem> updatedCart = List.from(lastState.menuList!)..remove(item);
//      emit(lastState.copyWith(menuList: updatedCart));
//   }

//   void updateItemQuantity(MenuItem item, int quantity) {
//      var lastState = state as CartInitial;
//     final List<MenuItem> updatedCart = List.from(lastState.menuList!);
//     final index = updatedCart.indexWhere((element) => element.id == item.id);
//     if (index != -1) {
//       updatedCart[index] = item.copyWith(quantity: quantity);
//        emit(lastState.copyWith(menuList: updatedCart));
//     }
//   }
// }
// }
