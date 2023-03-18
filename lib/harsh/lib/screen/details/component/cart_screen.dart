import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:hack/firebase/auth.dart";
import "package:hack/firebase/db.dart";
import "package:hack/harsh/lib/models/Product.dart";
import "package:hack/harsh/lib/screen/home/components/_build_category_card.dart";

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Cart"),
        ),
        body: StreamBuilder(
          stream:
              DataServices().cartStream(AuthServices().getFirebaseUser()!.uid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'Loading...',
                ),
              );
            } else {
              // DocumentSnapshot items = snapshot.data.documents;
              // print(snapshot.data!.docs.length);
              // return Text("Yes");
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text((doc.data() as Map<String, dynamic>)['itemid'] ),
                          FutureBuilder<Product>(
                            future: DataServices().getProduct(
                                (doc.data() as Map<String, dynamic>)['itemid']),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.name);
                              } else {
                                return Text("Fetching");
                              }
                            },
                          ),
                          Text((doc.data() as Map<String, dynamic>)['quantity']
                              .toString()),
                          // Text(doc['quantity']),
                        ],
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
