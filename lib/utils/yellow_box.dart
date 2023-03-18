import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YellowBox extends StatelessWidget {
  late TextEditingController controller;
  late double width;
  late String hintText;
  late FocusNode focusNode;
  bool enabled;
  Function(String)? onChanged;
  YellowBox({
    super.key,
    this.onChanged,
    this.enabled = true,
    required this.focusNode,
    required this.controller,
    required this.width,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.06,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     // color: boxBorder,
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Center(
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
            labelText: hintText,
            labelStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(206,111,89,0.9)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,0.6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color.fromRGBO(206,111,89,1))),
          ),
        ),
      ),
    );
  }
}
