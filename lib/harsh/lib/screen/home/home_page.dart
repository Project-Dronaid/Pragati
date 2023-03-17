import 'package:flutter/material.dart';
import 'package:hack/harsh/lib/colors.dart';
import 'package:hack/harsh/lib/providers/cart_provider.dart';
import 'package:hack/harsh/lib/screen/home/components/_body.dart';
import 'package:provider/provider.dart';
import '../../models/_res_files.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Res.fetchProducts();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: detailBody(products, context),
          ),
        ),
      ),
    );
  }
}
