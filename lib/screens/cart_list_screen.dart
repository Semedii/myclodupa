import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('Quantity: ${item['quantity']}'),
          );
        },
      ),
    );
  }
}
