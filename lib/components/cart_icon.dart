import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/screens/cart_list_screen.dart';
import 'package:mycloudpa/service_locator.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      builder: (context, state) {
        // it gets the number of the items in the cart and if it is null it will return 0
        int itemCount = (state as CartInitial).cartItems?.length ?? 0;

        return _buildIconButtonWithNumber(context, itemCount);
      },
    );
  }

  Stack _buildIconButtonWithNumber(BuildContext context, int itemCount) {
    return Stack(
      children: [
        _buildCartIconButton(context),
        if (itemCount > 0) _buildNumberBadge(itemCount),
      ],
    );
  }

  IconButton _buildCartIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
      },
      icon: const Icon(Icons.shopping_cart),
    );
  }

  Positioned _buildNumberBadge(int itemCount) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Text(
          itemCount.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
