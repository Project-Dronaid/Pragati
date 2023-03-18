import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hack/harsh/lib/models/Product.dart';

class DataServices {
  final db = FirebaseFirestore.instance;
  final fs = FirebaseStorage.instance;

  Future<bool> isNewUser(String userid) async {
    bool newUser = true;
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        if (doc.id == userid) {
          newUser = false;
          break;
        }
      }
    });
    return newUser;
  }

  Future<void> setupResturant({
    required String name,
    required String gst,
    required String pin,
    required String state,
    required String address1,
    required String address2,
    required String landmark,
    required String city,
    required String altPhoneNumber,
    required String userId,
  }) async {
    await db.collection('users').doc(userId).set({
      "name": name,
      "gst": gst,
      "pin": pin,
      "state": state,
      "address1": address1,
      "address2": address2,
      "landmark": landmark,
      "city": city,
      "altPhoneNumber": altPhoneNumber,
      "userId": userId,
    }, SetOptions(merge: true));
  }

  Future<String> uploadImage(File img, String id) async {
    var snapShot = await fs.ref().child('images/$id').putFile(img);
    var downloadUrl = await snapShot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> addItem({
    required String name,
    required String category,
    required String description,
    required String price,
    required String userId,
    required File imageLink,
  }) async {
    DocumentReference ref = db.collection("items").doc();
    String id = ref.id;
    String img = await uploadImage(imageLink, id);

    Map<String, dynamic> data = {
      "name": name,
      "category": category,
      "description": description,
      "price": price,
      "imageLink": img,
      "id": id,
      "userId": userId
    };
    await ref.set(data);
  }

  Stream cartStream(String userId) {
    return db.collection('users').doc(userId).collection('cart').snapshots();
  }

  Future<void> addItemToCart({
    required String itemid,
    required String userId,
  }) async {
    DocumentReference ref =
        db.collection('users').doc(userId).collection('cart').doc();
    String id = ref.id;
    await ref.set({"itemid": itemid, "quantity": 1, "cartitemid": id});
  }

  Future<Product> getProduct(String itemid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('items').doc(itemid).get();
    Map<String, dynamic> data = snapshot.data()!;
    return Product(
        name: data['name'],
        imageLink: data['imageLink'],
        price: data['price'],
        category: data['category'],
        description: data['description'],
        userId: data['userId'],
        id: data['id']);
  }

  Future<List<List<dynamic>>> getCart({
    required String userId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('users').doc(userId).get();
    Map<String, dynamic> data = snapshot.data()!;
    return data["cart"];
  }

  Future<List<Map<String, dynamic>>> getItems({
    required String userId,
  }) async {
    List<Map<String, dynamic>> ans = [];
    final snapshot = await db.collection('items').get();
    if (snapshot.docs.isNotEmpty) {
      // ans.addAll(snapshot.docs);
    }
    snapshot.docs.forEach((element) {
      if (element.data()['userid'] == userId) {
        ans.add(element.data());
      }
    });
    return ans;
  }

  Future<List<Map<String, dynamic>>> getAllItems({
    required String userId,
  }) async {
    List<Map<String, dynamic>> ans = [];
    final snapshot = await db.collection('items').get();
    if (snapshot.docs.isNotEmpty) {
      // ans.addAll(snapshot.docs);
    }
    snapshot.docs.forEach((element) {
      ans.add(element.data());
    });
    return ans;
  }
}
