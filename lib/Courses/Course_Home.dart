import 'package:flutter/material.dart';
import 'package:hack/Courses/course_details.dart';
import 'package:hack/Courses/success.dart';

class HomePage_Course extends StatefulWidget {
  @override
  _HomePage_CourseState createState() => _HomePage_CourseState();
}

class _HomePage_CourseState extends State<HomePage_Course> {
  List<String> categories = [
    'Development',
    'Business',
    'Finance & Accounting',
    'IT & Software',
    'Office Productivity',
    'Personal Development',
  ];

  List<Map<String, dynamic>> courses = [
    {
      'title': 'The Complete Flutter App Development Course',
      'author': 'John Doe',
      'level': 'Beginner',
      'rating': 4.5,
      'price': 19.99,
      'imageUrl': 'https://picsum.photos/seed/1/300/200',
    },
    {
      'title': 'The Complete Java Programming Course',
      'author': 'Jane Doe',
      'level': 'Intermediate',
      'rating': 4.2,
      'price': 29.99,
      'imageUrl': 'https://picsum.photos/seed/2/300/200',
    },
    {
      'title': 'The Complete Python Bootcamp',
      'author': 'Bob Smith',
      'level': 'Advanced',
      'rating': 4.8,
      'price': 39.99,
      'imageUrl': 'https://picsum.photos/seed/3/300/200',
    },
    {
      'title': 'The Complete Web Development Course',
      'author': 'Samantha Johnson',
      'level': 'Beginner',
      'rating': 4.6,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/4/300/200',
    },
    {
      'title': 'The Complete Data Science Bootcamp',
      'author': 'Jack Smith',
      'level': 'Intermediate',
      'rating': 4.4,
      'price': 44.99,
      'imageUrl': 'https://picsum.photos/seed/5/300/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Section'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    label: Text(categories[index]),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Courses',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text('See All'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 200.0,
                    child: Card(
                      elevation: 2.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              courses[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              courses[index]['author'],
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16.0,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  courses[index]['rating'].toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '\$' + '${courses[index]['price']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      child: Text('Enroll'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CourseDetailScreen(
                                                      imageUrl:
                                                          'https://picsum.photos/200/300',
                                                      title: 'Course Title',
                                                      subtitle: 'Subtitle',
                                                      description:
                                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                                      rating: 4.5,
                                                      price: 99.99,
                                                    )));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text('See All'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 200.0,
                    child: Card(
                      elevation: 2.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              courses[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              courses[index]['author'],
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16.0,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  courses[index]['rating'].toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '\$' + '${courses[index]['price']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      child: Text('Enroll'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EnrollSuccessScreen()));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
