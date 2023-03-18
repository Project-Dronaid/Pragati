import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hack/harsh/lib/models/Product.dart';
import 'package:hack/harsh/lib/screen/details/detail_page.dart';

buildPopularCard(Product product) {
  return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetail(product: product));
        },
        child: _productCard(product),
      ));
}

Card _productCard(Product product) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20)
      ),
    ),
    elevation: 2,
    child: GridTile(
      child: Column(
        children: [
          _imageIcon(product),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _title(product),
          ),
        ],
      ),
    ),
  );
}

Text _title(Product product) {
  return Text(
    product.name,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Container _imageIcon(Product product) {
  return Container(
    height: 100,
    width: 120,
    padding: const EdgeInsets.all(20),
    child: Image.network(
      product.imageLink,
      fit: BoxFit.cover,
      height: 80,
      width: 80,
    ),
  );
}
