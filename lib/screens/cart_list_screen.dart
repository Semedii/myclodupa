import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/components/app_button.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => serviceLocator.get<CartCubit>(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            state as CartInitial;
            return Padding(
              padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
              child: Column(
                children: [
                  _buildCartItemsList(state),
                  _buildUsernameField(context, state),
                  const SizedBox(height: 20),
                  _buildPayButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Expanded _buildCartItemsList(CartInitial state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.cartItems?.length,
        itemBuilder: (BuildContext context, int index) {
          final item = state.cartItems?[index];
          return item != null
              ? ListTile(
                  title: Text(item.keys.first.name),
                  subtitle: Text('Quantity: ${item.values}'),
                )
              : Container();
        },
      ),
    );
  }

  _buildUsernameField(BuildContext context, CartInitial state) {
    return TextFormField(
      initialValue: state.username,
      onChanged: serviceLocator.get<CartCubit>().onUsernameChanged,
      decoration: InputDecoration(
          hintText: "User name",
          border: _buildUsernameFieldBorder(),
          focusedBorder: _buildUsernameFieldBorder()),
    );
  }

  OutlineInputBorder _buildUsernameFieldBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(12),
    );
  }

  AppButton _buildPayButton() {
    return AppButton(title: "Pay", onPressed: ()=> null);
  }
}
