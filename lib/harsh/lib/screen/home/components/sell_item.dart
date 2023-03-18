
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
  FocusNode n = FocusNode();
  TextEditingController categoryController = TextEditingController();
  FocusNode c= FocusNode();
  TextEditingController priceController = TextEditingController();
  FocusNode p = FocusNode();
  TextEditingController descController = TextEditingController();
  FocusNode d = FocusNode();
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
    var width=size.width;
    var height=size.height;
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(context),
            ),
          ],
        ),
      ),
    );


    //
    //   Scaffold(
    //   body: SingleChildScrollView(
    //     child: Container(
    //       color: Colors.greenAccent,
    //       padding: EdgeInsets.symmetric(horizontal: width*0.07, vertical: height*0.1 ),
    //       child: Column(children: [
    //         TextField(
    //           controller: nameController,
    //         ),
    //         TextField(
    //           controller: categoryController,
    //         ),
    //         TextField(
    //           controller: priceController,
    //         ),
    //         TextField(
    //           controller: descController,
    //         ),
    //         Container(
    //           width: size.width * 0.8,
    //           height: size.width * 0.8,
    //           color: Colors.grey[200],
    //           child: (img == null)
    //               ? const Text("No image chosen")
    //               : Image.file(
    //                   img!,
    //                   fit: BoxFit.fill,
    //                 ),
    //         ),
    //         ElevatedButton(
    //           onPressed: () async{
    //             await pickImageFromGallery();
    //           },
    //           child: Text("Add Image"),
    //         ),
    //         ElevatedButton(
    //           onPressed: () async {
    //             await DataServices().addItem(
    //                 name: nameController.text,
    //                 category: categoryController.text,
    //                 description: descController.text,
    //                 price: priceController.text,
    //                 userId: AuthServices().getFirebaseUser()!.uid,
    //                 imageLink: img!);
    //             Navigator.of(context).pop();
    //             Navigator.of(context).pop();
    //             await cart.storeAllItems();
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => HomePage2()));
    //           },
    //           child: Text("Add Item"),
    //         ),
    //       ]
    //       ),
    //     ),
    //   ),
    // );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Color.fromRGBO(206,111,89,1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container main_container(BuildContext context2)
  {
    var size=MediaQuery.of(context).size;
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 600,
              width: 340,

              padding: EdgeInsets.symmetric(horizontal: width*0.07, vertical: height*0.03 ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(top: height*0.01),
                  child: Column(children: [
                    TextField(
                      focusNode: n,
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                        labelText: 'Product Name',
                        labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
                      ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    TextField(
                      focusNode: c,
                      controller: categoryController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                        labelText: 'Category',
                        labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
                      ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      focusNode: p,
                      controller: priceController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                        labelText: 'Price',
                        labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
                      ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    SizedBox(
                      height: height*0.12,
                      child: TextField(
                        focusNode: d,
                        controller: descController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.01),
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
                        ),

                        maxLines: null,
                        expands: true,
                      ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Container(
                      width: (img==null)?size.width * 0:size.width * 0.8,
                      height: (img==null)?size.height * 0:size.width * 0.8,
                      color: (img==null)?Colors.transparent: Colors.grey[200],
                      child: (img == null)
                          ? Text("")
                          : Image.file(
                              img!,
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    SizedBox(
                      height: height*0.06,
                      width: width*0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          pickImageFromGallery();
                        },
                        child: Text("Add Image"),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(206,111,89,1)
                        ),
                      ),
                    ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    SizedBox(
                      height: height*0.06,
                      width: width*0.8,
                      child: ElevatedButton(
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
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(206,111,89,1)
                          ),
                        ),
                      ),
                    ),
                  ]
                  ),
                ),
              ),
            );
  }

}
