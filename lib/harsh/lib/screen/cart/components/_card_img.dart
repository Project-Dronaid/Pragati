import 'package:flutter/material.dart';

Image cardImage(product) {
  return Image.network(
    product.imageLink,
    width: 150,
    height: 180,
    fit: BoxFit.fill,
  );
}
