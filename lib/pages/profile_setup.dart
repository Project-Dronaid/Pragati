import 'dart:convert';

import 'package:flutter/material.dart';
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
  // TextEditingController kitchenNameController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController altPhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                RichText(
                  text: TextSpan(
                    text: 'Name of Owner',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // color: textColor,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                YellowBox(
                  width: double.infinity,
                  controller: nameController,
                  hintText: "Enter Your Name",
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Kitchen Name',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // color: textColor,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                // YellowBox(
                //   width: double.infinity,
                //   controller: kitchenNameController,
                //   hintText: "Enter the name of your Kitchen",
                // ),
                SizedBox(
                  height: height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    text: 'GST Number',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // color: textColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' (optional)',
                        style: GoogleFonts.inter(
                          // color: greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                YellowBox(
                  width: double.infinity,
                  controller: gstController,
                  hintText: "Enter your registered GST number ",
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Address',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // color: textColor,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    YellowBox(
                      width: width * 0.37,
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
                    cursorColor: Colors.yellow,
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Line 1 (Shop No, Building, Street, Area)",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
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
                    cursorColor: Colors.yellow,
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Line 2 (Locality/Town)",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
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
                    cursorColor: Colors.yellow,
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "Landmark",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
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
                    cursorColor: Colors.yellow,
                    showCursor: true,
                    decoration: InputDecoration(
                      hintText: "City/District",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 13,
                        // color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Alternate Phone',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // color: textColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' (optional)',
                        style: GoogleFonts.inter(
                          // color: greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                YellowBox(
                  width: double.infinity,
                  controller: altPhoneNumberController,
                  hintText: "Enter your Alternate mobile number ",
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
                          showSnackBar(context, "Enter All the details!");
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
                        width: width * 0.73,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow,
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
                GestureDetector(
                  onTap: () {
                    AuthServices().signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Let’s get started with your ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            // color: greyColor,
                          ),
                          children: [
                            TextSpan(
                              text: '15 day free trial.',
                              style: GoogleFonts.inter(
                                // color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
