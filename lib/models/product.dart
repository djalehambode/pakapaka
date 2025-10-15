// lib/models/product.dart
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final int size = 0;
  final Color color = Colors.green;
  final int price = 100;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  // Factory pour créer un Product à partir d'un JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Optionnel : convertir un Product en JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'image': image};
  }
}
