import 'package:flutter/material.dart';

import '../../models/_payment_cart_model.dart';
import 'components/_body.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PayCard> payemnts = [];
    for (var element in payemnts) {
      //print(element.title);
    }
    return Scaffold(
      appBar: payActionbar(),
      body: Column(
        children: [
          creditcardImage(),
          choosePaymentType(),
        ],
      ),
    );
  }
}
