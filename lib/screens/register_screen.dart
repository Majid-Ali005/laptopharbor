// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../utils/shared_prefs.dart';
// import 'login_screen.dart';
// import '../widgets/custom_button.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _register() async {
//     if (_formKey.currentState!.validate()) {
//       String email = _emailController.text.trim();
//       String password = _passwordController.text.trim();

//       await SharedPrefs.setEmail(email);
//       await SharedPrefs.setPassword(password);

//       Fluttertoast.showToast(msg: "Registration successful!");
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register"),
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
//                 text: "Register",
//                 onPressed: _register,
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()),
//                   );
//                 },
//                 child: Text("Already have an account? Login"),
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
import '../utils/shared_prefs.dart';
import 'login_screen.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      await SharedPrefs.setEmail(email);
      await SharedPrefs.setPassword(password);

      Fluttertoast.showToast(msg: "Registration successful!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                Image.network(
                  "https://images-platform.99static.com//stZpFSlgo-84NpYmEosPfEu2te8=/479x42:1396x959/fit-in/500x500/99designs-contests-attachments/98/98379/attachment_98379445",
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
                // Register Button
                SizedBox(
                  width: 300, // Fixed width for better alignment
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spacing between button and login text
                // Login Text
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Already have an account? Login",
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