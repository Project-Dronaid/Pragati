import 'package:flutter/material.dart';

Container showImageView(BuildContext context, product) {
  var screenSize = MediaQuery.of(context).size;
  var screenHeight = (screenSize.height);
  return Container(
    padding: const EdgeInsets.all(20),
    child: Image.network(
      product.imageLink,
      alignment: Alignment.centerRight,
      height: screenHeight * 0.5,
    ),
  );
}
