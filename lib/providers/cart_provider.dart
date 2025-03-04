import 'package:flutter/material.dart';
import '../models/laptop_model.dart';

class CartProvider with ChangeNotifier {
  List<Laptop> _cartItems = [];

  List<Laptop> get cartItems => _cartItems;

  void addToCart(Laptop laptop) {
    _cartItems.add(laptop);
    notifyListeners();
  }

  void removeFromCart(Laptop laptop) {
    _cartItems.remove(laptop);
    notifyListeners();
  }
}