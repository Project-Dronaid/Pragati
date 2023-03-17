import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hack/harsh/lib/screen/login/login_page.dart';

Row buildActionBar() {
  return Row(
    children: [
      const Text(
        'Discover',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () => Get.to(const LoginScreen()),
        child: const Icon(
          CupertinoIcons.profile_circled,
          size: 45,
        ),
      ),
    ],
  );
}
