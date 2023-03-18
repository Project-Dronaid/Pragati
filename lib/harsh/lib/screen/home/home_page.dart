import 'package:flutter/material.dart';
import 'package:hack/harsh/lib/colors.dart';
import 'package:hack/harsh/lib/providers/cart_provider.dart';
import 'package:hack/harsh/lib/screen/home/components/_body.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Cart>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: detailBody(products.productList, context),
        ),
      ),
    );
  }
}
