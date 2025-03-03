import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final TextEditingController _reviewController = TextEditingController();

  void _addReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        widget.product.reviews.add(_reviewController.text);
        _reviewController.clear(); // Clear the text field after adding the review
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.network(
              widget.product.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            // Product Description
            Text(
              'Description: ${widget.product.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Star Rating
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) => Icon(
                    index < widget.product.rating.floor()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '(${widget.product.rating})',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Reviews Section
            Text(
              'Reviews:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...widget.product.reviews.map((review) => Text('- $review', style: TextStyle(fontSize: 14))).toList(),
            SizedBox(height: 20),

            // Add Review Section
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Add your review',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addReview,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}