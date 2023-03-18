import 'package:flutter/material.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/harsh/lib/models/Product.dart';
import '../../details/detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';

ListView category(productList) {
  return ListView.builder(
      padding: const EdgeInsets.only(left: 0),
      itemCount: productList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {Get.to(ProductDetail)},
          child: buildPopularCard(productList[index]),
        );
      });
}

GridView mostPopularCategory(context, List<Product> product) {
  String ownId = AuthServices().getFirebaseUser()!.uid;
  List filteredList = product.where((ele) => ele.userId != ownId).toList();
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(filteredList.length, (index) {
      return GestureDetector(
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: filteredList[index]),
            ),
          ),
        },
        child: buildCard(filteredList[index]),
      );
    }),
  );
}
