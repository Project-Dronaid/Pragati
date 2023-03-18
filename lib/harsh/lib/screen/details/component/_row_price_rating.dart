import 'package:flutter/material.dart';

Row buildRowPriceRating(product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Price: \$${product.price}",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ],
  );
}
