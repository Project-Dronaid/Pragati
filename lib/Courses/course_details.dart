import 'package:flutter/material.dart';
import 'package:hack/Courses/success.dart';

class CourseDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final double rating;
  final double price;

  CourseDetailScreen({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCF6F5A),
        title: Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    rating.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffCF6F5A))),
                onPressed: () {
                  // Add logic to enroll in the course
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnrollSuccessScreen(
                        title: title,
                        description: description,
                      ),
                    ),
                  );
                },
                child: Text('Enroll Now'),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
