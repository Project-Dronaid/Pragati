import 'package:flutter/material.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/firebase/db.dart';
import 'package:hack/harsh/lib/models/Product.dart';

class Cart extends ChangeNotifier {
  List<Product> productList = [];
  Future<void> storeAllItems() async {
    List<Map<String, dynamic>> data = await DataServices()
        .getAllItems(userId: AuthServices().getFirebaseUser()!.uid);
    productList.clear();

    for (var i in data) {
      productList.add(Product(
          name: i["name"],
          imageLink: i["imageLink"],
          price: i['price'],
          category: i['category'],
          description: i["description"],
          userId: i["userId"],
          id: i["id"]));
    }
    notifyListeners();
  }
}
