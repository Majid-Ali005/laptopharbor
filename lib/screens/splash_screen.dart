import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Text("Welcome to", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
            Image.asset(
              "assets/logo.jpg",
              width: 250, // Adjust the size as needed
              height: 250,
            ),
            
            Text("a place where you can find your dream laptop", style: TextStyle(fontSize: 15)),
            SizedBox(height: 20), // Spacing between logo and button
            // Let's Start Button
            ElevatedButton(
              onPressed: () {
                // Navigate to LoginScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                elevation: 5, // Shadow
              ),
              child: Text(
                "Let's Start",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}