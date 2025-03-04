// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/laptop_model.dart';
// import '../providers/cart_provider.dart';
// import 'cart_screen.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final Laptop laptop;

//   ProductDetailScreen({required this.laptop});

//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   final _reviewController = TextEditingController();
//   double _userRating = 0;
//   final List<Review> _reviews = [];

//   void _submitReview() {
//     if (_reviewController.text.isNotEmpty && _userRating > 0) {
//       setState(() {
//         _reviews.add(
//           Review(
//             userName: "User", // Replace with actual user name
//             comment: _reviewController.text,
//             rating: _userRating,
//           ),
//         );
//         _reviewController.clear();
//         _userRating = 0;
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter a review and select a rating.")),
//       );
//     }
//   }

//   double _calculateAverageRating() {
//     if (_reviews.isEmpty) return widget.laptop.rating;
//     double totalRating = _reviews.fold(0, (sum, review) => sum + review.rating);
//     return totalRating / _reviews.length;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final averageRating = _calculateAverageRating();
//     final cartProvider = Provider.of<CartProvider>(context);
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Product Details"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Responsive Image
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.3, // 30% of screen height
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(widget.laptop.image),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Product Name
//             Text(
//               widget.laptop.name,
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 28 : 24, // Larger font for tablets/desktops
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             // Product Price
//             Text(
//               widget.laptop.price,
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
//                 color: Colors.green,
//               ),
//             ),
//             SizedBox(height: 10),
//             // Rating
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber, size: 24),
//                 SizedBox(width: 5),
//                 Text(
//                   "${averageRating.toStringAsFixed(1)}",
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Product Description
//             Text(
//               widget.laptop.description,
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
//               ),
//             ),
//             SizedBox(height: 20),
//             // Add to Cart Button
//             ElevatedButton(
//               onPressed: () {
//                 // Add the product to the cart
//                 cartProvider.addToCart(widget.laptop);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Added to cart!")),
//                 );

//                 // Navigate to the Cart Screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CartScreen(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(
//                   vertical: screenWidth > 600 ? 16 : 12, // Larger padding for tablets/desktops
//                   horizontal: screenWidth > 600 ? 32 : 24,
//                 ),
//               ),
//               child: Text(
//                 "Add to Cart",
//                 style: TextStyle(
//                   fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // User Reviews Section
//             Text(
//               "User Reviews",
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             // Reviews List
//             _reviews.isEmpty
//                 ? Text(
//                     "No reviews yet.",
//                     style: TextStyle(
//                       fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
//                       color: Colors.grey,
//                     ),
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: _reviews.length,
//                     itemBuilder: (context, index) {
//                       final review = _reviews[index];
//                       return ListTile(
//                         title: Text(
//                           review.userName,
//                           style: TextStyle(
//                             fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
//                           ),
//                         ),
//                         subtitle: Text(
//                           review.comment,
//                           style: TextStyle(
//                             fontSize: screenWidth > 600 ? 18 : 14, // Larger font for tablets/desktops
//                           ),
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.star, color: Colors.amber, size: 16),
//                             Text(
//                               "${review.rating.toStringAsFixed(1)}",
//                               style: TextStyle(
//                                 fontSize: screenWidth > 600 ? 18 : 14, // Larger font for tablets/desktops
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//             Divider(),
//             // Leave a Review Section
//             Text(
//               "Leave a Review",
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 22 : 18, // Larger font for tablets/desktops
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             // Star Rating
//             Row(
//               children: [
//                 Text(
//                   "Rating: ",
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
//                   ),
//                 ),
//                 ...List.generate(5, (index) {
//                   return IconButton(
//                     icon: Icon(
//                       index < _userRating ? Icons.star : Icons.star_border,
//                       color: Colors.amber,
//                       size: screenWidth > 600 ? 32 : 24, // Larger icons for tablets/desktops
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _userRating = index + 1.0;
//                       });
//                     },
//                   );
//                 }),
//               ],
//             ),
//             SizedBox(height: 10),
//             // Review Text Field
//             TextField(
//               controller: _reviewController,
//               decoration: InputDecoration(
//                 hintText: "Write your review...",
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
//               ),
//             ),
//             SizedBox(height: 10),
//             // Submit Review Button
//             ElevatedButton(
//               onPressed: _submitReview,
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(
//                   vertical: screenWidth > 600 ? 16 : 12, // Larger padding for tablets/desktops
//                   horizontal: screenWidth > 600 ? 32 : 24,
//                 ),
//               ),
//               child: Text(
//                 "Submit Review",
//                 style: TextStyle(
//                   fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/laptop_model.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Laptop laptop;

  ProductDetailScreen({required this.laptop});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _reviewController = TextEditingController();
  double _userRating = 0;
  final List<Review> _reviews = [];

  void _submitReview() {
    if (_reviewController.text.isNotEmpty && _userRating > 0) {
      setState(() {
        _reviews.add(
          Review(
            userName: "User", // Replace with actual user name
            comment: _reviewController.text,
            rating: _userRating,
          ),
        );
        _reviewController.clear();
        _userRating = 0;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a review and select a rating.")),
      );
    }
  }

  double _calculateAverageRating() {
    if (_reviews.isEmpty) return widget.laptop.rating;
    double totalRating = _reviews.fold(0, (sum, review) => sum + review.rating);
    return totalRating / _reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final averageRating = _calculateAverageRating();
    final cartProvider = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsive Image
            Container(
              width: screenWidth,
              height: screenHeight * 0.3, // 30% of screen height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.laptop.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Product Name
            Text(
              widget.laptop.name,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 28 : 24, // Larger font for tablets/desktops
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Product Price
            Text(
              widget.laptop.price,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            // Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 24),
                SizedBox(width: 5),
                Text(
                  "${averageRating.toStringAsFixed(1)}",
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Product Description
            Text(
              widget.laptop.description,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
              ),
            ),
            SizedBox(height: 20),
            // Add to Cart Button (Blue Color)
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart
                cartProvider.addToCart(widget.laptop);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Added to cart!")),
                );

                // Navigate to the Cart Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth > 600 ? 16 : 12, // Larger padding for tablets/desktops
                  horizontal: screenWidth > 600 ? 32 : 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
                  color: Colors.white, // White text color
                ),
              ),
            ),
            SizedBox(height: 20),
            // User Reviews Section
            Text(
              "User Reviews",
              style: TextStyle(
                fontSize: screenWidth > 600 ? 24 : 20, // Larger font for tablets/desktops
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Reviews List
            _reviews.isEmpty
                ? Text(
                    "No reviews yet.",
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
                      color: Colors.grey,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _reviews.length,
                    itemBuilder: (context, index) {
                      final review = _reviews[index];
                      return ListTile(
                        title: Text(
                          review.userName,
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
                          ),
                        ),
                        subtitle: Text(
                          review.comment,
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 18 : 14, // Larger font for tablets/desktops
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Text(
                              "${review.rating.toStringAsFixed(1)}",
                              style: TextStyle(
                                fontSize: screenWidth > 600 ? 18 : 14, // Larger font for tablets/desktops
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            Divider(),
            // Leave a Review Section
            Text(
              "Leave a Review",
              style: TextStyle(
                fontSize: screenWidth > 600 ? 22 : 18, // Larger font for tablets/desktops
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Star Rating
            Row(
              children: [
                Text(
                  "Rating: ",
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
                  ),
                ),
                ...List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _userRating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: screenWidth > 600 ? 32 : 24, // Larger icons for tablets/desktops
                    ),
                    onPressed: () {
                      setState(() {
                        _userRating = index + 1.0;
                      });
                    },
                  );
                }),
              ],
            ),
            SizedBox(height: 10),
            // Review Text Field
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: "Write your review...",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 18 : 16, // Larger font for tablets/desktops
              ),
            ),
            SizedBox(height: 10),
            // Submit Review Button (Blue Color)
            ElevatedButton(
              onPressed: _submitReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth > 600 ? 16 : 12, // Larger padding for tablets/desktops
                  horizontal: screenWidth > 600 ? 32 : 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Text(
                "Submit Review",
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 20 : 16, // Larger font for tablets/desktops
                  color: Colors.white, // White text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}