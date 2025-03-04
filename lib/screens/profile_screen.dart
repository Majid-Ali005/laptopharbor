// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();

//   void _updateProfile() {
//     if (_formKey.currentState!.validate()) {
//       // Save profile logic
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Profile Updated!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: "Name"),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please enter your name";
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please enter your email";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateProfile,
//                 child: Text("Update Profile"),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Stored Values:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text("Name: ${_nameController.text}"),
//               Text("Email: ${_emailController.text}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile Updated!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
              Text("Your Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 20), // Spacing between logo and form
                // Name Field
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      prefixIcon: Icon(Icons.person), // Add an icon
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20), // Spacing between fields
                // Email Field
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      prefixIcon: Icon(Icons.email), // Add an icon
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20), // Spacing between fields and button
                // Update Profile Button
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: ElevatedButton(
                    onPressed: _updateProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Spacing between button and stored values
                // Stored Values Section
                Text(
                  "Your Details:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Name: ${_nameController.text}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Email: ${_emailController.text}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}