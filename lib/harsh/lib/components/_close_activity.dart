import 'package:flutter/material.dart';
import 'package:get/get.dart';

GestureDetector closeActivity() {
  return GestureDetector(
    onTap: () => Get.back(),
    child: const Padding(
      padding: EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ),
  );
}

const borderRadius = BorderRadius.all(
  Radius.circular(20.0),
);
