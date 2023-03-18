import 'package:flutter/material.dart';
import 'package:hack/harsh/lib/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/Product.dart';
import 'components/_build_app_bar.dart';
import 'components/_item_cart_view.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Cart>(context).productList;
    return Scaffold(
        //backgroundColor: Colors.grey.shade200,
        appBar: buildAppBar(context),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return buildCartCard(products[index]);
            },
          ),
        ));
  }
}
