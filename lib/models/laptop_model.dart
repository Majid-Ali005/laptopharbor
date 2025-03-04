// class Laptop {
//   final String name;
//   final String price;
//   final double rating;
//   final String image;
//   final String description; // Add this field

//   Laptop({
//     required this.name,
//     required this.price,
//     required this.rating,
//     required this.image,
//     required this.description, // Add this field
//   });
// }

class Review {
  final String userName;
  final String comment;
  final double rating;

  Review({
    required this.userName,
    required this.comment,
    required this.rating,
  });
}

class Laptop {
  final String name;
  final String price;
  final double rating;
  final String image;
  final String description;
  final List<Review> reviews;

  Laptop({
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.description,
    this.reviews = const [],
  });
  
}

