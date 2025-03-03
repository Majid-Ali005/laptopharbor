import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  List<CartItem> _cartItems = [];

  CartService._internal();

  factory CartService() {
    return _instance;
  }

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: Product(id: '', name: '', description: '', rating: 0, imageUrl: '', reviews: [], category: '')),
    );

    if (existingItem.product.id.isNotEmpty) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(String productId, int quantity) {
    final item = _cartItems.firstWhere((item) => item.product.id == productId);
    item.quantity = quantity;
  }

  double getTotalAmount() {
    return _cartItems.fold(0, (total, item) => total + (item.product.rating * item.quantity));
  }

  void clearCart() {
    _cartItems.clear();
  }
}