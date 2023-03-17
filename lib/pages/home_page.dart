import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hack/firebase/auth.dart';
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
        backgroundColor: Colors.black,
        // appBar: constraints.maxWidth < mobileBreakPoint
        //     ? PreferredSize(
        //         preferredSize: Size(double.infinity, 55.0),
        //         child: MobileAppBar(),
        //       )
        //     : PreferredSize(
        //         preferredSize: Size(double.infinity, 72.0),
        //         child: WebAppBar(),
        //       ),
        // drawer: constraints.maxWidth < mobileBreakPoint ? Drawer() : null,
        body: Align(
          alignment: Alignment.center,
          child: Scaffold(
            body: curr_page,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.energy_savings_leaf),
                  label: 'Plan',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
