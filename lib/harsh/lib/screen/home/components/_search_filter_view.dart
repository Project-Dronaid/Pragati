import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack/harsh/lib/components/_close_activity.dart';

Row buildSearchRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: _showTextField()),
      const SizedBox(width: 20),
      Container(
        color: Colors.white,
        height: 45,
        width: 45,
        child: _buildFilterBtn(),
      ),
    ],
  );
}

_showTextField() {
  return  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 2,
    child: Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          // border: OutlineInputBorder(
          //   gapPadding: 8,
          //   borderRadius: borderRadius,
          // ),
          filled: true,
          hintStyle: TextStyle(color: Colors.black),
          hintText: "Search products",
          fillColor: Colors.white,
        ),
      ),
    ),
  );
}

IconButton _buildFilterBtn() {
  return IconButton(
    alignment: Alignment.center,
    icon: const Icon(CupertinoIcons.sort_down, size: 20),
    onPressed: () => print("Filter clicked"),
    tooltip: "Filter",
    iconSize: 35,
    padding: const EdgeInsets.all(10),
    color: Colors.teal,
  );
}
