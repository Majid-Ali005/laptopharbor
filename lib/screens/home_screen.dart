import 'package:flutter/material.dart';
import '../widgets/laptop_card.dart';
import '../widgets/bottom_navbar.dart';
import '../models/laptop_model.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Laptop> cheapLaptops = [
    Laptop(
      name: "Laptop A",
      price: "\$500",
      rating: 4.2,
      image: "assets/laptop1.jpg",
      description: "A budget-friendly laptop with great performance.",
    ),
    Laptop(
      name: "Laptop B",
      price: "\$450",
      rating: 3.8,
      image: "assets/laptop2.jpg",
      description: "Lightweight and portable for everyday use.",
    ),
    Laptop(
      name: "Laptop C",
      price: "\$480",
      rating: 4.0,
      image: "assets/laptop3.jpg",
      description: "Affordable and reliable for daily tasks.",
    ),
    Laptop(
      name: "Laptop D",
      price: "\$520",
      rating: 4.1,
      image: "assets/laptop4.jpg",
      description: "Great for students and casual users.",
    ),
    Laptop(
      name: "Laptop E",
      price: "\$490",
      rating: 3.9,
      image: "assets/laptop5.jpg",
      description: "Compact design with decent performance.",
    ),
  ];

  final List<Laptop> newLaptops = [
    Laptop(
      name: "Laptop X",
      price: "\$1200",
      rating: 4.5,
      image: "assets/laptop6.jpg",
      description: "High-performance laptop for professionals.",
    ),
    Laptop(
      name: "Laptop Y",
      price: "\$1500",
      rating: 4.7,
      image: "assets/laptop7.jpg",
      description: "Top-tier laptop with advanced features.",
    ),
    Laptop(
      name: "Laptop Z",
      price: "\$1300",
      rating: 4.6,
      image: "assets/laptop8.jpg",
      description: "Perfect for gaming and heavy workloads.",
    ),
    Laptop(
      name: "Laptop W",
      price: "\$1400",
      rating: 4.4,
      image: "assets/laptop9.jpg",
      description: "Sleek design with powerful performance.",
    ),
    Laptop(
      name: "Laptop V",
      price: "\$1100",
      rating: 4.3,
      image: "assets/laptop10.jpg",
      description: "Great for multitasking and productivity.",
    ),
  ];

  final List<Laptop> oldLaptops = [
    Laptop(
      name: "Laptop P",
      price: "\$300",
      rating: 3.5,
      image: "assets/laptop11.jpg",
      description: "Reliable and affordable for basic tasks.",
    ),
    Laptop(
      name: "Laptop Q",
      price: "\$250",
      rating: 3.2,
      image: "assets/laptop12.jpg",
      description: "Perfect for students and casual users.",
    ),
    Laptop(
      name: "Laptop R",
      price: "\$280",
      rating: 3.4,
      image: "assets/laptop13.jpg",
      description: "Budget-friendly with decent performance.",
    ),
    Laptop(
      name: "Laptop S",
      price: "\$270",
      rating: 3.3,
      image: "assets/laptop14.jpg",
      description: "Lightweight and easy to carry.",
    ),
    Laptop(
      name: "Laptop T",
      price: "\$260",
      rating: 3.1,
      image: "assets/laptop15.jpg",
      description: "Affordable option for basic computing.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laptop Store"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Cheap Laptops"),
            Tab(text: "New Laptops"),
            Tab(text: "Old Laptops"),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header Image
          Container(
            child: Row(
              children: [
                //header on image text here.
              ],
            ),
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/header_image.jpg"),
                
                fit: BoxFit.cover,
              ),
            ),
          ),
          // TabBar View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLaptopList(cheapLaptops),
                _buildLaptopList(newLaptops),
                _buildLaptopList(oldLaptops),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          }
        },
      ),
    );
  }

  Widget _buildLaptopList(List<Laptop> laptops) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: laptops.length,
      itemBuilder: (context, index) {
        return LaptopCard(
          laptop: laptops[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(laptop: laptops[index]),
              ),
            );
          },
        );
      },
    );
  }
}