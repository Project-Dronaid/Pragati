import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hack/harsh/lib/screen/home/components/sell_item.dart';
import 'package:hack/harsh/lib/screen/login/login_page.dart';

Row buildActionBar(BuildContext context) {
  return Row(
    children: [
      const Text(
        'Discover',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SellItem()));
        },
        child: const Icon(
          CupertinoIcons.profile_circled,
          size: 45,
        ),
      ),
    ],
  );
}
