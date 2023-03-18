import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/firebase/db.dart';
import 'package:hack/pages/home_page.dart';
import 'package:hack/utils/show_snack_bar.dart';
import 'package:hack/utils/yellow_box.dart';
import 'package:http/http.dart' as http;

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  FocusNode name= FocusNode();
  TextEditingController gstController = TextEditingController();
  FocusNode gst= FocusNode();
  TextEditingController pinController = TextEditingController();
  FocusNode pin= FocusNode();
  TextEditingController stateController = TextEditingController();
  FocusNode state= FocusNode();
  TextEditingController addressLine1Controller = TextEditingController();
  FocusNode al1= FocusNode();
  TextEditingController addressLine2Controller = TextEditingController();
  FocusNode al2= FocusNode();
  TextEditingController landmarkController = TextEditingController();
  FocusNode landmark= FocusNode();
  TextEditingController cityController = TextEditingController();
  FocusNode city= FocusNode();
  TextEditingController altPhoneNumberController = TextEditingController();
  FocusNode altphone= FocusNode();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 248, 241, 1),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.1,
            ),
            width: width,
            // height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Profile Set Up",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                TextField(
                  focusNode: name,
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.01),
                    labelText: 'Enter your name',
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
                  height: height * 0.04,
                ),

                TextField(
                  focusNode: gst,
                  controller: gstController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                    labelText: 'GSTIN Number',
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
                  height: height * 0.04,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    YellowBox(
                      width: width * 0.37,
                      focusNode: pin,
                      controller: pinController,
                      onChanged: (String pincode) async {
                        final response = await http.get(
                          Uri.parse(
                            "http://www.postalpincode.in/api/pincode/$pincode",
                          ),
                        );
                        final result = jsonDecode(response.body.toString());
                        print("WHAT!");
                        print(result);
                        if (result["Status"] == "Success") {
                          stateController.text =
                              result["PostOffice"][0]["District"];
                          setState(() {});
                        }
                      },
                      hintText: "Pincode ",
                    ),
                    YellowBox(
                      focusNode: state,
                      width: width * 0.37,
                      controller: stateController,
                      enabled: false,
                      hintText: "State ",
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: TextField(
                    controller: addressLine1Controller,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      // color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Color.fromRGBO(206,111,89,1),
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Line 1 (Shop No, Building, Street, Area)",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color:Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: TextField(
                    controller: addressLine2Controller,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      // color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Color.fromRGBO(206,111,89,1),
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Line 2 (Locality/Town)",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: TextField(
                    controller: landmarkController,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      // color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Color.fromRGBO(206,111,89,1),
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Landmark",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.8,
                  child: TextField(
                    controller: cityController,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      // color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: Color.fromRGBO(206,111,89,1),
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "City/District",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(206,111,89,1), width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                TextField(
                  focusNode: altphone,
                  controller: altPhoneNumberController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                    labelText: 'Alternatte Phone Number',
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
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (nameController.text == "" ||
                            pinController.text == "" ||
                            stateController.text == "" ||
                            addressLine1Controller.text == "" ||
                            cityController.text == "") {
                          toastmessage("Enter All the details!", context,Color.fromRGBO(206,111,89,0.8), Color.fromRGBO(206,111,89,1));
                          return;
                        }
                        await DataServices().setupResturant(
                          name: nameController.text,
                          gst: gstController.text,
                          pin: pinController.text,
                          state: stateController.text,
                          address1: addressLine1Controller.text,
                          address2: addressLine2Controller.text,
                          landmark: landmarkController.text,
                          city: cityController.text,
                          altPhoneNumber: altPhoneNumberController.text,
                          userId: AuthServices().getFirebaseUser()!.uid,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomePage_Main(),
                          ),
                        );
                      },
                      child: Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(206,111,89,1),
                        ),
                        child: SizedBox(
                          width: width * 0.6,
                          height: height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              isLoading == true
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Save Changes",
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.025,
                                        color: Colors.black,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),

                SizedBox(
                  height: height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void toastmessage(String message, BuildContext context2, Color c, Color sc) {
  var width = MediaQuery.of(context2).size.width;
  var height = MediaQuery.of(context2).size.height;
  ScaffoldMessenger.of(context2).showSnackBar(SnackBar(
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: width * 0.1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          height: height * 0.09,
          padding: EdgeInsets.all(height * 0.02),
          decoration: BoxDecoration(
              color: c, borderRadius: BorderRadius.circular(width * 0.05)),
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.05),
                ),
                child: SvgPicture.asset(
                  'assets/icons/bubbles.svg',
                  height: height * 0.06,
                  width: width * 0.9,
                  color: sc,
                ))),
        Positioned(
            top: -height * 0.01,
            child: SvgPicture.asset(
              'assets/icons/fail.svg',
              height: height * 0.033,
              color: sc,
            ))
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

