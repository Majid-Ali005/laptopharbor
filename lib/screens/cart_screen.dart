import 'package:flutter/material.dart';
import 'checkout_screen.dart'; // Add this import
import '../models/cart_item_model.dart';
import '../services/cart_service.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  final CartService cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartService.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartService.cartItems[index];
                return CartItemWidget(
                  item: item,
                  onRemove: () {
                    cartService.removeFromCart(item.product.id);
                  },
                  onQuantityChanged: (quantity) {
                    cartService.updateQuantity(item.product.id, quantity);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${cartService.getTotalAmount().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()),
              );
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}