import 'package:flutter/material.dart';
import 'package:mycloudpa/model/menu_item.dart';

class MenuItemTile extends StatelessWidget {
  final MenuItem item;

  const MenuItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/${item.id}.jpg'), // Assuming you have images named after the item IDs
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          item.description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
        onTap: () {
          // Handle tapping on the menu item (navigation or adding to cart)
        },
      ),
    );
  }
}
