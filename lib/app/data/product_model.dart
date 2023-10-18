import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
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

final Product product = Product(
    id: 1, 
    title: "MSI Modern 14 i3 (11) C11M 9S7-14J312-244 Black", 
    price: 361.82, 
    description: "Laptop ini dilengkapi dengan fitur Cooler Boost, Hi-Res Audio, Military-Grade Durability, Type-C PD Charging", 
    category: "Laptop", 
    image: "https://cdn1.smartprix.com/rx-i7ZSnyKNa-w1200-h1200/7ZSnyKNa.jpg", 
    rating: Rating(rate: 4.8, count: 34));