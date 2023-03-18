// ignore: file_names
import 'package:flutter/material.dart';

class Product {
  String name;
  String imageLink;
  String price;
  String category;
  String description;
  String userId;
  String id;

  Product(
      {
      required this.name,
      required this.imageLink,
      required this.price,
      required this.category,
      required this.description,
      required this.userId,
      required this.id});
}
