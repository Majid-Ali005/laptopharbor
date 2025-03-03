import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'product_details_screen.dart';
import 'browse_screen.dart';
import 'cart_screen.dart';
import 'checkout_screen.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';
import '../services/cart_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedTab = 0; // For header navigation bar

  // Dummy product data with 5 products
  final List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Laptop 1',
      description: 'High-performance laptop for professionals.',
      rating: 4.5,
      imageUrl: 'https://w7.pngwing.com/pngs/723/514/png-transparent-laptop-personal-computer-laptops-electronics-photography-computer-thumbnail.png',
      reviews: [
        'Great product!',
        'Highly recommended.',
        'Excellent quality.',
      ],
      category: 'top',
    ),
    Product(
      id: '2',
      name: 'Laptop 2',
      description: 'Affordable laptop for students.',
      rating: 4.0,
      imageUrl: 'https://w7.pngwing.com/pngs/723/514/png-transparent-laptop-personal-computer-laptops-electronics-photography-computer-thumbnail.png',
      reviews: [
        'Good value for money.',
        'Works perfectly.',
        'Satisfied with the purchase.',
      ],
      category: 'cheap',
    ),
    Product(
      id: '3',
      name: 'Laptop 3',
      description: 'Lightweight and portable laptop.',
      rating: 4.2,
      imageUrl: 'https://w7.pngwing.com/pngs/723/514/png-transparent-laptop-personal-computer-laptops-electronics-photography-computer-thumbnail.png',
      reviews: [
        'Very portable.',
        'Great battery life.',
        'Perfect for travel.',
      ],
      category: 'new',
    ),
    Product(
      id: '4',
      name: 'Laptop 4',
      description: 'Gaming laptop with high-end specs.',
      rating: 4.7,
      imageUrl: 'https://w7.pngwing.com/pngs/723/514/png-transparent-laptop-personal-computer-laptops-electronics-photography-computer-thumbnail.png',
      reviews: [
        'Amazing for gaming.',
        'Smooth performance.',
        'Worth the price.',
      ],
      category: 'top',
    ),
    Product(
      id: '5',
      name: 'Laptop 5',
      description: 'Business laptop with security features.',
      rating: 4.3,
      imageUrl: 'https://w7.pngwing.com/pngs/723/514/png-transparent-laptop-personal-computer-laptops-electronics-photography-computer-thumbnail.png',
      reviews: [
        'Great for work.',
        'Secure and reliable.',
        'Excellent build quality.',
      ],
      category: 'cheap',
    ),
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = allProducts; // Initially show all products
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
      // Filter products based on the selected tab
      switch (index) {
        case 0:
          _filteredProducts = allProducts.where((product) => product.category == 'top').toList();
          break;
        case 1:
          _filteredProducts = allProducts.where((product) => product.category == 'cheap').toList();
          break;
        case 2:
          _filteredProducts = allProducts.where((product) => product.category == 'new').toList();
          break;
        default:
          _filteredProducts = allProducts;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHeaderTab('Top Laptops', 0),
                _buildHeaderTab('Cheap Laptops', 1),
                _buildHeaderTab('New Laptops', 2),
              ],
            ),
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? Column(
              children: [
                // Welcome Text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to XYZ App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // Header Image
                Image.network(
                  'https://e7.pngegg.com/pngimages/726/570/png-clipart-black-hp-laptop-laptop-dell-macbook-air-laptop-notebook-gadget-electronics.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                // Product Grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    padding: EdgeInsets.all(10),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: _filteredProducts[index],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(product: _filteredProducts[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          : ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          });
        },
      ),
    );
  }

  Widget _buildHeaderTab(String title, int index) {
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedTab == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedTab == index ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}