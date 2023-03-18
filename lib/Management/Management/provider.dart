import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Transaction {
  //modal class for Person object
  String? name;
  DateTime? d;
  int? val, type;
  Transaction({this.name, this.d, this.val, this.type});
}

class Data extends ChangeNotifier {
  int income = 0;
  int expense = 0;

  List<Transaction> t = [];

  addTransaction(String name, DateTime d, int val, int type) {
    t.add(Transaction(name: name, d: d, val: val, type: type));
    (type == 1) ? changeIncome(val) : changeExpense(val);
    notifyListeners();
  }

  String timeOfDay() {
    String s;
    int h = DateTime.now().hour;
    (h >= 6 && h < 12)
        ? s = "Morning"
        : (h > 12 && h < 18)
            ? s = "Afternoon"
            : s = "Evening";
    return s;
  }

  changeIncome(int a) {
    income += a;
    notifyListeners();
  }

  changeExpense(int a) {
    expense += a;
    notifyListeners();
  }
}
