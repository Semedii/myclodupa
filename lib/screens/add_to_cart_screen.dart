import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/components/app_button.dart';
import 'package:mycloudpa/cubits/addToCart/add_to_cart_cubit.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/model/menu_item.dart';
import 'package:mycloudpa/screens/cart_list_screen.dart';
import 'package:mycloudpa/service_locator.dart';

class AddToCartScreen extends StatelessWidget {
  final MenuItem menuItem;

  const AddToCartScreen({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'),
        actions: [
          _buildCartIcon(context),
        ],
      ),
      body: BlocProvider(
        create: (context) => AddToCartCubit(menuItem),
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {
            state as AddToCartInitial;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuName(),
                  const SizedBox(height: 10),
                  _buildMenuDescription(),
                  const SizedBox(height: 20),
                  _buildQuantity(context, state),
                  const SizedBox(height: 20),
                  _buildAddToCartButton(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: serviceLocator.get<CartCubit>(),
      builder: (context, state) {
        // Get the number of items in the cart
        int itemCount = (state as CartInitial).cartItems.length;

        return Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            if (itemCount > 0)
              Positioned(
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
              ),
          ],
        );
      },
    );
  }

  Text _buildMenuName() {
    return Text(
      menuItem.name,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildMenuDescription() {
    return Text(
      menuItem.description,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
      ),
    );
  }

  Row _buildQuantity(BuildContext context, AddToCartInitial state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuantityText(),
        _buildQuantitySection(context, state),
      ],
    );
  }

  Text _buildQuantityText() {
    return const Text(
      'Quantity',
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Row _buildQuantitySection(BuildContext context, AddToCartInitial state) {
    return Row(
      children: [
        _buildDecrementButton(context),
        _buildQuantityNumber(state),
        _buildIncrementButton(context),
      ],
    );
  }

  IconButton _buildIncrementButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: BlocProvider.of<AddToCartCubit>(context).incrementQuantity,
    );
  }

  Text _buildQuantityNumber(AddToCartInitial state) {
    return Text(
      state.quantity.toString(),
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  IconButton _buildDecrementButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: BlocProvider.of<AddToCartCubit>(context).decrementQuantity,
    );
  }

  AppButton _buildAddToCartButton(AddToCartInitial state) {
    return AppButton(
        title: 'Add (${state.quantity}) to Cart',
        onPressed: () {
          serviceLocator
              .get<CartCubit>()
              .addToCart(state.menuItem, state.quantity);
        });
  }
}
