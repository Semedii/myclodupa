import 'package:flutter/material.dart';
import 'package:mycloudpa/model/menu_item.dart';

class MenuItemTile extends StatelessWidget {
  final MenuItem item;

  const MenuItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.description),
      trailing: Text('\$${item.price.toStringAsFixed(2)}'),
      onTap: () {
        // Handle tapping on the menu item (navigation or adding to cart)
      },
    );
  }
}
