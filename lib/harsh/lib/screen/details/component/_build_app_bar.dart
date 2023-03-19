import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack/harsh/lib/components/_close_activity.dart';
import 'package:hack/harsh/lib/screen/details/component/cart_screen.dart';

AppBar detailAppBar(product,BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromRGBO(250, 248, 241, 1,),
    elevation: 0,
    title: Text(
      product.name,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: closeActivity(),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              CupertinoIcons.cart,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
