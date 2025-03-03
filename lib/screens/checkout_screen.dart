import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CheckoutScreen extends StatelessWidget {
  final CartService cartService = CartService();
  final _formKey = GlobalKey<FormState>();
  final _shippingController = TextEditingController();
  final _billingController = TextEditingController();

  void _placeOrder(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Simulate order confirmation email
      print('Order placed successfully!');
      print('Shipping Address: ${_shippingController.text}');
      print('Billing Address: ${_billingController.text}');
      print('Total Amount: \$${cartService.getTotalAmount().toStringAsFixed(2)}');

      // Clear the cart
      cartService.clearCart();

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Order Confirmation'),
          content: Text('Your order has been placed successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _shippingController,
                decoration: InputDecoration(labelText: 'Shipping Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your shipping address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _billingController,
                decoration: InputDecoration(labelText: 'Billing Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your billing address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Total: \$${cartService.getTotalAmount().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _placeOrder(context),
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}