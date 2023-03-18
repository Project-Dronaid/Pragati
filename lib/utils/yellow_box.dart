import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YellowBox extends StatelessWidget {
  late TextEditingController controller;
  late double width;
  late String hintText;
  bool enabled;
  Function(String)? onChanged;
  YellowBox({
    super.key,
    this.onChanged,
    this.enabled = true,
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
      decoration: BoxDecoration(
        border: Border.all(
          // color: boxBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          // cursorColor: boxBorder,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
