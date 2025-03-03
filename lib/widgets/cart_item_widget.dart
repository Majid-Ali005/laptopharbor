import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  CartItemWidget({
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(item.product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(item.product.name),
        subtitle: Text('\$${item.product.rating.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (item.quantity > 1) {
                  onQuantityChanged(item.quantity - 1);
                }
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onQuantityChanged(item.quantity + 1);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}