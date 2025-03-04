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
            Image.network(
              "https://images-platform.99static.com//stZpFSlgo-84NpYmEosPfEu2te8=/479x42:1396x959/fit-in/500x500/99designs-contests-attachments/98/98379/attachment_98379445",
              width: 250, // Adjust the size as needed
              height: 250,
            ),
            Text("Welcom To LOGIA", style: TextStyle(fontSize: 20)),
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