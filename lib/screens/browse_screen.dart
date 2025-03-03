import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class BrowseScreen extends StatelessWidget {
  final List<Product> products;

  BrowseScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Products'),
      ),
      body: ListView(
        children: [
          // Add filtering and sorting options here
          ...products.map((product) => ProductCard(
                product: product,
                onPressed: () {
                  // Navigate to product details
                },
              )).toList(),
        ],
      ),
    );
  }
}