import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/components/menu_item_tile.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';
import 'package:mycloudpa/cubits/menu/menu_cubit.dart';
import 'package:mycloudpa/repositories/menu_repository.dart';
import 'package:mycloudpa/screens/cart_list_screen.dart';
import 'package:mycloudpa/service_locator.dart';

class MenuListScreen extends StatelessWidget {
  MenuListScreen({super.key});

  final MenuRepository _menuRepository = MenuRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCloudPA Restaurant'),
        actions: [_buildCartIcon(context)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDeliveryMessage(),
          const SizedBox(height: 16),
          _buildAddressField(),
          Expanded(
            child: BlocProvider(
              create: (context) => _createCubit(),
              child: BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  if (state is MenuInitial) {
                    //if state is MenuInitial again for any reason we have to fetch the menu list
                    //by initializing the page again
                    BlocProvider.of<MenuCubit>(context).initPage();
                  } else {
                    if (state is MenuIdle) {
                      return ListView.builder(
                        itemCount: state.menuList.length,
                        itemBuilder: (context, index) {
                          final item = state.menuList[index];
                          return MenuItemTile(item: item);
                        },
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildAddressField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'D6 ACE ENTERPRISE PARK, Dublin 22, D22 X0E2, Ireland',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, // Remove border side
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  Padding _buildDeliveryMessage() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Enjoy our delicious menu items delivered to your doorstep!',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: serviceLocator.get<CartCubit>(),
      builder: (context, state) {
        // Get the number of items in the cart
        int itemCount = (state as CartInitial).cartItems?.length ?? 0;

        return Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            if (itemCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    itemCount.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  //this will return cubit with page already initialized
  MenuCubit _createCubit() => MenuCubit(_menuRepository)..initPage();
}
