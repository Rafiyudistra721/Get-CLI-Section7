import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  NetworkImage image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}

// List<Product> dummyItems() => [
//   Product(
//     id: 1, 
//     title: "MSI Modern 14 i3 (11) C11M 9S7-14J312-244 Black", 
//     price: 5690000, 
//     description: "Modern 14 C11M-244ID-9S7-14J312-244 dengan fitur Cooler Boost, Hi-Res Audio, Military-Grade Durability, Type-C PD Charging", 
//     category: "Laptop", 
//     image: "assets/images/Product1.jpg", 
//     rating: Rating(rate: 4.8, count: 34))
// ];