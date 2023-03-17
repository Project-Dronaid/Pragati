import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hack/firebase/auth.dart';
import 'package:hack/harsh/lib/screen/home/home_page.dart';
import 'package:provider/provider.dart';


import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  List<Widget> _widgetOptions = [
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chat',
      style: optionStyle,
    ),
    Text(
      'Index 2: Community',
      style: optionStyle,
    ),
    Text(
      'Index 3: Plan',
      style: optionStyle,
    ),
  ];
  Widget curr_page = Home();
  List<Widget> pages = [Home(), Home(), Home(), Home()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthServices().signOut();
                },
                child: Text("Sign Out"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()));
                },
                child: Text("Marketplace"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
