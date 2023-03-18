import 'package:flutter/material.dart';
import 'package:hack/Courses/course_details.dart';

class Course {
  final String title;
  final String imageUrl;

  Course({required this.title, required this.imageUrl});
}

final List<Course> courses = [
  Course(title: 'Flutter Development', imageUrl: 'https://picsum.photos/200'),
  Course(title: 'Web Development', imageUrl: 'https://picsum.photos/201'),
  Course(title: 'Machine Learning', imageUrl: 'https://picsum.photos/202'),
  Course(title: 'iOS Development', imageUrl: 'https://picsum.photos/203'),
  Course(title: 'Android Development', imageUrl: 'https://picsum.photos/204'),
];

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Course> _searchResult = [];

  void _onSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResult.clear();
      });
      return;
    }

    final List<Course> results = courses
        .where((course) =>
            course.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _searchResult = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search Courses',
            border: InputBorder.none,
          ),
          onChanged: _onSearch,
        ),
      ),
      body: _searchResult.isEmpty
          ? Center(
              child: Text('No Results Found'),
            )
          : ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                final course = _searchResult[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(
                        imageUrl: 'https://picsum.photos/200/300',
                        title: 'Course Title',
                        subtitle: 'Subtitle',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        rating: 4.5,
                        price: 99.99,
                      ),
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(course.imageUrl),
                      title: Text(course.title),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          // Add logic to add course as friend
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
