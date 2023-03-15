import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final db = FirebaseFirestore.instance;
  Future<void> setupResturant({
    required String name,
    required String kitchenName,
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
    await db.collection('restaurants').doc(userId).set({
      "name": name,
      "kitchenName": kitchenName,
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

  Future<bool> isNewUser(String userid) async {
    bool ans = true;
    await db.collection("restaurants").get().then((event) {
      for (var doc in event.docs) {
        if (doc.id == userid) {
          ans = false;
          break;
        }
      }
    });
    return ans;
  }
}
