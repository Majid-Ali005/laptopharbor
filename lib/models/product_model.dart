class Product {
  final String id;
  final String name;
  final String description;
  final double rating;
  final String imageUrl;
  final List<String> reviews;
  final String category; // New field for categorization

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.reviews,
    required this.category,
  });
}