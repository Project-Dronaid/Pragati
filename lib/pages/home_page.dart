import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack/Community/MainPage.dart';
import 'package:hack/Courses/Course_Home.dart';
import 'package:hack/Management/Management/financeManagement.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/firebase/db.dart';
import 'package:hack/harsh/lib/providers/cart_provider.dart';
import 'package:hack/harsh/lib/screen/home/home_page.dart';
import 'package:hack/pages/home.dart';
import 'package:hack/pages/profile_setup.dart';
import 'package:provider/provider.dart';

class HomePage_Main extends StatefulWidget {
  @override
  _HomePage_MainState createState() => _HomePage_MainState();
}

class _HomePage_MainState extends State<HomePage_Main> {
  int _currentIndex = 0;

  int _selectedIndex = 0;
  void _onItemTapped(int index) async {
    switch (index) {
      case 1:
        {
          final cart = Provider.of<Cart>(context, listen: false);

          await cart.storeAllItems();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage2()),
          );
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage_Course()),
          );
        }
        break;
      case 3:
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
        break;
      case 4:
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => financeHomepage()),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context, listen: false);
    return FutureBuilder<bool>(
        future: DataServices().isNewUser(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data == true) {
              return const ProfileSetup();
            } else {
              // return Home();
              return Scaffold(
                appBar: AppBar(
                  title: Text("Home Page"),
                ),
                body: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: HomeTab(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                      backgroundColor: Colors.green,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                      backgroundColor: Colors.purple,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                      backgroundColor: Colors.pink,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.money),
                      label: 'Finance',
                      backgroundColor: Colors.pink,
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemTapped,
                ),
              );
            }
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("error"),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Tab'),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Tab'),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Tab'),
    );
  }
}
