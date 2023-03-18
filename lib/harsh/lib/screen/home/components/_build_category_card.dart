import 'package:flutter/material.dart';
import '../../../models/Product.dart';

buildCard(Product product) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        
      ),
      elevation: 3,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: GridTile(
          header: Padding(
            padding: const EdgeInsets.all(12),
            child: imageIcon(product),
          ),
          footer: _buildPriceRating(product),
          child: Container(),
        ),
      ),
    ),
  );
}

Padding _buildPriceRating(Product product) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titlePrice(product),
        const SizedBox(height: 8),
      ],
    ),
  );
}

Text description(Product product) {
  return Text(
    product.description,
    maxLines: 2,
  );
}

Row _titlePrice(Product product) {
  return Row(
    children: [
      Text(
        product.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Text(
        '\$ ${product.price}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )
    ],
  );
}

Image imageIcon(Product product) {
  return Image.network(
    product.imageLink,
    fit: BoxFit.cover,
    height: 100,
    width: 100,
  );
}
