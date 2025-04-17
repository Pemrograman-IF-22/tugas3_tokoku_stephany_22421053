// import 'dart:convert';

class Product{
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,
  });
   factory Product.fromJson(Map<String,dynamic>Json) {
    return Product(
    id:Json['id'],
    title: Json['title'],
    price:  (Json['price'] as num).toDouble(),
    description: Json['description'],
    category: Json['category'],
    image : Json['image'],

    );
   
  }
} 



