import 'package:flutter/material.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/firebase/db.dart';
import 'package:hack/utils/show_snack_bar.dart';
import '../../cart/cart_page.dart';
import 'package:get/get.dart';

OutlinedButton btnAddToCart(BuildContext context, product) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
          animationDuration: const Duration(seconds: 5),
          side: const BorderSide(width: 1, color: Colors.white),
          padding: const EdgeInsets.all(10)),
      onPressed: () async {
        print(AuthServices().getFirebaseUser()!.uid);
        await DataServices().addItemToCart(
            itemid: product.id, userId: AuthServices().getFirebaseUser()!.uid);
        showSnackBar(context, "Added to cart");
      },
      child: const Text(
        'ADD TO CART',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
