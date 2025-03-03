import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  String? phone;
  String? location;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
      location = prefs.getString('location');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${name ?? 'N/A'}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Email: ${email ?? 'N/A'}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Phone: ${phone ?? 'N/A'}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Location: ${location ?? 'N/A'}', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}