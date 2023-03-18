import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataServices {
  final db = FirebaseFirestore.instance;
  final fs = FirebaseStorage.instance;
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
    String img = await uploadImage(imageLink,id);

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

  Future<void> addItemToCart({
    required String itemid,
    required String userId,
  }) async {
    await db.collection('users').doc(userId).set({
      "cart": FieldValue.arrayUnion([itemid, 1]),
    }, SetOptions(merge: true));
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
