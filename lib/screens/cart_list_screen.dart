import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

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
            print("aaaa ${state.cartItems?.length}");
            return ListView.builder(
              itemCount: state.cartItems?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.cartItems?[index];
               return item!=null?
                 ListTile(
                  title: Text(item.keys.first.name),
                  subtitle: Text('Quantity: ${item.values}'),
                ):  Container();
              },
            );
          },
        ),
      ),
    );
  }
}
