import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/components/app_button.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/screens/menu_list_screen.dart';
import 'package:mycloudpa/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: serviceLocator.get<CartCubit>(),
        builder: (context, state) {
          state as CartInitial;
          return Padding(
            padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
            child: Column(
              children: [
                _buildCartItemsList(state),
                _buildUsernameField(context, state),
                const SizedBox(height: 20),
                Text("Total Price ${state.totalPrice} "),
                _buildPayButton(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded _buildCartItemsList(CartInitial state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = state.cartItems[index];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.menuItem.name),
                Text('Price: ${item.menuItem.price}'),
              ],
            ),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                serviceLocator.get<CartCubit>().removeFromCart(item.menuItem);
              },
            ),
          );
        },
      ),
    );
  }

  Column _buildUsernameField(BuildContext context, CartInitial state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: state.username,
          onChanged: serviceLocator.get<CartCubit>().onUsernameChanged,
          decoration: InputDecoration(
              hintText: "User name",
              border: _buildUsernameFieldBorder(),
              focusedBorder: _buildUsernameFieldBorder()),
        ),
        const Text("Please enter you username to continue")
      ],
    );
  }

  OutlineInputBorder _buildUsernameFieldBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(12),
    );
  }

  AppButton _buildPayButton(BuildContext context, CartInitial state) {
    bool isDisabled = state.cartItems.isEmpty ||
        state.username == null ||
        state.username!.isEmpty;
    return AppButton(
        title: "Pay",
        onPressed: isDisabled
            ? null
            : () {
                serviceLocator.get<CartCubit>().onPayButtonPressed();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MenuListScreen()));
              });
  }
}
