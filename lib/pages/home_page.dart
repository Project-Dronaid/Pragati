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
import 'package:hack/pages/Users_Profile.dart';
import 'package:hack/pages/home.dart';
import 'package:hack/pages/profile.dart';
import 'package:hack/pages/profile_setup.dart';
import 'package:hack/pages/settings.dart';
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
    var width=MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
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
                backgroundColor: const Color.fromRGBO(250, 248, 241, 1),
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(250, 248, 241, 1),
                  title: Text('Home', style: TextStyle(color: Colors.black),),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.black,),
                      onPressed: () {
                        // TODO: handle profile icon press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileInfoPage(
                                  userName: "Sandeep Rai",
                                  userEmail: "contact4rai@gmail.com")),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.black,),
                      onPressed: () {
                        // TODO: handle settings icon press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Container(
                    height: height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height*0.02,
                        ),
                        CarouselSlider(
                          items: features
                              .map((feature) => _buildFeatureCard( context,
                                  feature.first, feature.second))
                              .toList() as List<Widget>?,
                          options: CarouselOptions(
                            height:height*0.2,
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

                        Container(
                          height: height*0.09,
                            padding: EdgeInsets.all(16.0),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                    Color.fromRGBO(206, 111, 89, 1),
                                    child: Text("1", style: TextStyle(color: Colors.white),),

                                  ),
                                  SizedBox(
                                    width: width*0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Activity 1"),
                                      Text("Today", style: TextStyle(color: Colors.grey),)
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                    Color.fromRGBO(206, 111, 89, 1),
                                    child: Text("2", style: TextStyle(color: Colors.white),),

                                  ),
                                  SizedBox(
                                    width: width*0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Activity 2"),
                                      Text("Today", style: TextStyle(color: Colors.grey),)
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                    Color.fromRGBO(206, 111, 89, 1),
                                    child: Text("3",style: TextStyle(color: Colors.white),),

                                  ),
                                  SizedBox(
                                    width: width*0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Activity 3"),
                                      Text("Today", style: TextStyle(color: Colors.grey),)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Make New Friends',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                          itemCount: friends.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Color.fromRGBO(250, 248, 241, 1),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(friends[index].imageUrl),
                                ),
                                title: Text(friends[index].name),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // TODO: add friend logic
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LinkedInProfileScreen(),),
                                    );
                                  },
                                  child: Text('Add Friend'),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromRGBO(206, 111, 89, 1))),
                                ),
                              ),
                            );
                          },
                        )
                        ),

                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Color.fromRGBO(250, 248, 241, 1),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.group),
                      label: 'Settings',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.money),
                      label: 'Finance',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor:  Color.fromRGBO(206, 111, 89, 1),
                  unselectedItemColor: Colors.grey,
                  onTap: _onItemTapped,
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        );
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

Widget _buildFeatureCard(BuildContext context2,String feature, int index) {
  var width=MediaQuery.of(context2).size.width;
  var height= MediaQuery.of(context2).size.height;
  List<Map<String, String>> items = [
    {
      'image':
          'https://womenserve.org/wp-content/uploads/2019/08/gavra-3.jpg',
      'title': 'Gavra’s Story',
      'description': 'Description 1'
    },
    {
      'image':
          'https://womenserve.org/wp-content/uploads/2021/05/NiomaIndia14.jpg',
      'title': 'Nioma’s Story',
      'description': 'Description 2'
    },
    {
      'image':
          'https://d2vbj8g7upsspg.cloudfront.net/fit-in/580x348/filters:format(webp)/30-stades/media/post_attachments/8b5e14c6-004.jpg',
      'title': 'Rabari’s Story',
      'description': 'Description 3'

    },
  ];

  return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
       // color: Color.f,
       borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: height*0.2,
              width: 300,
              child: ClipRRect(
                child: Image.network(
                  items[index]['image']!,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Container(
              height: height*0.2,
              width: width*0.9,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            //SizedBox(height: 10),
            Positioned(
              bottom: height*0.07,
              right: width*0.04,
              child: Text(
                items[index]['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width*0.09,
                  color: Colors.white
                ),
              ),
            ),

          ],
        ),
      ));
}
