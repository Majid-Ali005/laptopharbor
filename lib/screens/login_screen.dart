// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:laptopharbor/screens/product_detail_screen.dart';
// import '../utils/shared_prefs.dart';
// import 'register_screen.dart';
// import 'home_screen.dart';
// import '../widgets/custom_button.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       String email = _emailController.text.trim();
//       String password = _passwordController.text.trim();

//       String? storedEmail = await SharedPrefs.getEmail();
//       String? storedPassword = await SharedPrefs.getPassword();

//       if (email == storedEmail && password == storedPassword) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } else {
//         Fluttertoast.showToast(msg: "Invalid email or password");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
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
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Please enter your password";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 text: "Login",
//                 onPressed: _login,
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => RegisterScreen()),
//                   );
//                 },
//                 child: Text("Don't have an account? Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laptopharbor/screens/product_detail_screen.dart';
import '../utils/shared_prefs.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      String? storedEmail = await SharedPrefs.getEmail();
      String? storedPassword = await SharedPrefs.getPassword();

      if (email == storedEmail && password == storedPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Fluttertoast.showToast(msg: "Invalid email or password");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                Image.asset(
                  "assets/logo.jpg",
                  width: 150, // Adjust the size as needed
                  height: 150,
                ),
                SizedBox(height: 20), // Spacing between logo and form
                // Email Field
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20), // Spacing between fields
                // Password Field
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20), // Spacing between fields and button
                // Login Button
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spacing between button and register text
                // Register Text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                      color: Colors.blue, // Blue color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}