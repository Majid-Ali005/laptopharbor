import 'product_model.dart'; // Add this import

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}