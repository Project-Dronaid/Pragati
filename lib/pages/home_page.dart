import 'package:carousel_slider/carousel_slider.dart';
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

class Friend {
  final String name;
  final String imageUrl;

  Friend({required this.name, required this.imageUrl});
}

class HomePage_Main extends StatefulWidget {
  @override
  _HomePage_MainState createState() => _HomePage_MainState();
}

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  const Pair(this.first, this.second);
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

  final List<Pair<String, int>> features = [
    Pair('Feature1', 0),
    Pair('Feature2', 1),
    Pair('Feature3', 2),
  ];

  final List<String> activities = [
    'Activity 1',
    'Activity 2',
    'Activity 3',
    'Activity 4',
    'Activity 5',
  ];
  final List<Friend> friends = [
    Friend(name: 'John Doe', imageUrl: 'https://picsum.photos/id/237/200/300'),
    Friend(name: 'Jane Doe', imageUrl: 'https://picsum.photos/id/238/200/300'),
    Friend(name: 'Bob Smith', imageUrl: 'https://picsum.photos/id/239/200/300'),
    Friend(
        name: 'Alice Jones', imageUrl: 'https://picsum.photos/id/240/200/300'),
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context, listen: false);
    return FutureBuilder(
        future: DataServices().isNewUser(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data == true) {
              return const ProfileSetup();
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Home'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        // TODO: handle profile icon press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        // TODO: handle settings icon press
                      },
                    ),
                  ],
                ),
                body: Container(
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                        items: features
                            .map((feature) => _buildFeatureCard(
                                feature.first, feature.second))
                            .toList() as List<Widget>?,
                        options: CarouselOptions(
                          height: 200.0,
                          viewportFraction: 0.8,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Recent Activities',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(activities[index]),
                              subtitle: Text('Today'),
                              leading: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Text((index + 1).toString()),
                              ),
                              onTap: () {
                                // Open activity detail page
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Recent Activities',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: friends.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(friends[index].imageUrl),
                              ),
                              title: Text(friends[index].name),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  // TODO: add friend logic
                                },
                                child: Text('Add Friend'),
                              ),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
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

Widget _buildFeatureCard(String feature, int index) {
  List<Map<String, String>> items = [
    {
      'image':
          'https://static.businessworld.in/article/article_extra_large_image/1615186282_J8GCFG_Women_entrepreneur_Nino_.jpg',
      'title': 'Title 1',
      'description': 'Description 1'
    },
    {
      'image': 'https://picsum.photos/id/237/200/300',
      'title': 'Title 2',
      'description': 'Description 2'
    },
    {
      'image': 'https://picsum.photos/id/237/200/300',
      'title': 'Title 3',
      'description': 'Description 3'
    },
  ];

  return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 300,
              child: Image.network(
                items[index]['image']!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              items[index]['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              items[index]['description']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ));
}
