
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/firebase/db.dart';
import 'package:hack/harsh/lib/providers/cart_provider.dart';
import 'package:hack/harsh/lib/screen/home/home_page.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:provider/provider.dart';

class SellItem extends StatefulWidget {
  const SellItem({super.key});

  @override
  State<SellItem> createState() => _SellItemState();
}

class _SellItemState extends State<SellItem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  File? img;
  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        img = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: categoryController,
          ),
          TextField(
            controller: priceController,
          ),
          TextField(
            controller: descController,
          ),
          Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
            color: Colors.grey[200],
            child: (img == null)
                ? const Text("No image chosen")
                : Image.file(
                    img!,
                    fit: BoxFit.fill,
                  ),
          ),
          ElevatedButton(
            onPressed: () {
              pickImageFromGallery();
            },
            child: Text("Add Image"),
          ),
          ElevatedButton(
            onPressed: () async {
              await DataServices().addItem(
                  name: nameController.text,
                  category: categoryController.text,
                  description: descController.text,
                  price: priceController.text,
                  userId: AuthServices().getFirebaseUser()!.uid,
                  imageLink: img!);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              await cart.storeAllItems();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage2()));
            },
            child: Text("Add Item"),
          ),
        ]),
      ),
    );
  }
}
