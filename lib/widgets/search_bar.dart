import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search products...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onSearch,
      ),
    );
  }
}