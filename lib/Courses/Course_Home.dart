import 'package:flutter/material.dart';
import 'package:hack/Courses/course_details.dart';
import 'package:hack/Courses/gridview_detail.dart';
import 'package:hack/Courses/search_page.dart';
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
    'Office Productivity'
  ];

  List<Map<String, dynamic>> dev_courses = [
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
  List<Map<String, String>> devCourseDescriptions = [
    {
      'title': 'The Complete Flutter App Development Course',
      'description':
          'Learn how to build beautiful and functional mobile apps using Flutter, a popular cross-platform development framework.'
    },
    {
      'title': 'The Complete Java Programming Course',
      'description':
          'Master the fundamentals of Java programming, including data types, control structures, and object-oriented concepts.'
    },
    {
      'title': 'The Complete Python Bootcamp',
      'description':
          'Get up to speed with Python, one of the most widely used programming languages in the world, and learn how to write powerful scripts and applications.'
    },
    {
      'title': 'The Complete Web Development Course',
      'description':
          'Explore the world of web development, from HTML and CSS to JavaScript and server-side programming, and build your own dynamic web applications.'
    },
    {
      'title': 'The Complete Data Science Bootcamp',
      'description':
          'Develop a comprehensive understanding of data science, including statistical analysis, machine learning, and data visualization, and learn how to apply these skills to real-world problems.'
    },
    {
      'title': 'Introduction to Business Management',
      'description':
          'Gain a solid foundation in the principles of business management, including organizational behavior, human resources, and strategic planning.'
    },
    {
      'title': 'Accounting for Small Business Owners',
      'description':
          'Learn the basics of accounting, financial statements, and bookkeeping, and get practical advice for managing the finances of a small business.'
    },
    {
      'title': 'Marketing Strategies for Entrepreneurs',
      'description':
          'Discover effective marketing strategies and tactics for small businesses and startups, including social media marketing, email campaigns, and content marketing.'
    },
    {
      'title': 'Effective Communication in Business',
      'description':
          'Develop your communication skills in a business context, including verbal and written communication, public speaking, and interpersonal communication.'
    },
    {
      'title': 'Financial Planning for Retirement',
      'description':
          'Learn about the different types of retirement plans, investment strategies, and tax implications, and get practical advice for planning your retirement.'
    },
  ];
  List<Map<String, dynamic>> business_courses = [
    {
      'title': 'Introduction to Business Management',
      'author': 'John Smith',
      'level': 'Beginner',
      'rating': 4.2,
      'price': 19.99,
      'imageUrl': 'https://picsum.photos/seed/6/300/200',
    },
    {
      'title': 'Accounting for Small Business Owners',
      'author': 'Jane Johnson',
      'level': 'Intermediate',
      'rating': 4.5,
      'price': 29.99,
      'imageUrl': 'https://picsum.photos/seed/7/300/200',
    },
    {
      'title': 'Marketing Strategies for Entrepreneurs',
      'author': 'Bob Brown',
      'level': 'Advanced',
      'rating': 4.8,
      'price': 39.99,
      'imageUrl': 'https://picsum.photos/seed/8/300/200',
    },
    {
      'title': 'Effective Communication in Business',
      'author': 'Samantha Lee',
      'level': 'Beginner',
      'rating': 4.6,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/9/300/200',
    },
    {
      'title': 'Financial Planning for Retirement',
      'author': 'Jack Johnson',
      'level': 'Intermediate',
      'rating': 4.4,
      'price': 44.99,
      'imageUrl': 'https://picsum.photos/seed/10/300/200',
    },
  ];
  List<Map<String, dynamic>> businesscourseDescriptions = [
    {
      'title': 'Introduction to Business Management',
      'description':
          'This course provides an introduction to the principles and practices of business management. Topics covered include planning, organizing, leading, and controlling.'
    },
    {
      'title': 'Accounting for Small Business Owners',
      'description':
          'This course covers the basics of accounting for small business owners, including bookkeeping, financial statements, and tax preparation.'
    },
    {
      'title': 'Marketing Strategies for Entrepreneurs',
      'description':
          'In this course, you will learn marketing strategies that are specifically designed for entrepreneurs. Topics covered include market research, product development, and advertising.'
    },
    {
      'title': 'Effective Communication in Business',
      'description':
          'This course teaches the essential skills of communication in a business context. Topics covered include listening, speaking, and writing.'
    },
    {
      'title': 'Financial Planning for Retirement',
      'description':
          'This course provides an overview of financial planning for retirement. Topics covered include budgeting, investing, and retirement accounts.'
    },
  ];
  List<Map<String, dynamic>> accountingCourses = [
    {
      'title': 'Principles of Accounting',
      'author': 'John Smith',
      'level': 'Beginner',
      'rating': 4.2,
      'price': 19.99,
      'imageUrl': 'https://picsum.photos/seed/11/300/200',
    },
    {
      'title': 'Financial Accounting',
      'author': 'Jane Johnson',
      'level': 'Intermediate',
      'rating': 4.5,
      'price': 29.99,
      'imageUrl': 'https://picsum.photos/seed/12/300/200',
    },
    {
      'title': 'Managerial Accounting',
      'author': 'Bob Brown',
      'level': 'Advanced',
      'rating': 4.8,
      'price': 39.99,
      'imageUrl': 'https://picsum.photos/seed/13/300/200',
    },
    {
      'title': 'Tax Accounting',
      'author': 'Samantha Lee',
      'level': 'Intermediate',
      'rating': 4.6,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/14/300/200',
    },
    {
      'title': 'Auditing and Assurance Services',
      'author': 'Jack Johnson',
      'level': 'Advanced',
      'rating': 4.4,
      'price': 44.99,
      'imageUrl': 'https://picsum.photos/seed/15/300/200',
    },
  ];
  List<Map<String, String>> accountingcourseDescriptions = [
    {
      'title': 'Principles of Accounting',
      'description':
          'An introductory course that covers the basics of accounting, including financial statements, debits and credits, and bookkeeping.'
    },
    {
      'title': 'Financial Accounting',
      'description':
          'An intermediate-level course that covers more advanced accounting topics, such as cash flow analysis, inventory management, and tax accounting.'
    },
    {
      'title': 'Managerial Accounting',
      'description':
          'A course that focuses on the use of accounting information in making business decisions, including cost analysis, budgeting, and performance evaluation.'
    },
    {
      'title': 'Tax Accounting',
      'description':
          'A course that covers the tax laws and regulations that affect individuals and businesses, including income tax, sales tax, and payroll tax.'
    },
    {
      'title': 'Auditing and Assurance Services',
      'description':
          'A course that covers the principles and practices of auditing, including risk assessment, internal controls, and audit reports.'
    },
  ];
  List<Map<String, dynamic>> officeCourses = [
    {
      'title': 'Microsoft Excel - Basic to Advanced',
      'author': 'Jenny Lee',
      'level': 'Beginner ',
      'rating': 4.7,
      'price': 49.99,
      'imageUrl': 'https://picsum.photos/seed/21/300/200',
    },
    {
      'title': 'Microsoft Word - Essential Skills',
      'author': 'David Nguyen',
      'level': 'Beginner',
      'rating': 4.4,
      'price': 29.99,
      'imageUrl': 'https://picsum.photos/seed/22/300/200',
    },
    {
      'title': 'Microsoft PowerPoint - Advanced Techniques',
      'author': 'Sarah Johnson',
      'level': 'Intermediate ',
      'rating': 4.6,
      'price': 39.99,
      'imageUrl': 'https://picsum.photos/seed/23/300/200',
    },
    {
      'title': 'Google Sheets - Essential Skills',
      'author': 'Michael Lee',
      'level': ' Intermediate',
      'rating': 4.3,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/24/300/200',
    },
    {
      'title': 'Google Docs - Advanced Techniques',
      'author': 'Linda Kim',
      'level': ' Advanced',
      'rating': 4.8,
      'price': 44.99,
      'imageUrl': 'https://picsum.photos/seed/25/300/200',
    },
  ];
  List<Map<String, String>> officeCoursesDescriptions = [
    {
      'title': 'Microsoft Excel for Beginners',
      'description':
          'Learn the basics of Microsoft Excel, including data entry, formatting, and basic functions.'
    },
    {
      'title': 'Advanced Microsoft Excel',
      'description':
          'Build on your Excel skills with advanced topics such as pivot tables, advanced formulas, and data analysis.'
    },
    {
      'title': 'Microsoft PowerPoint for Presentations',
      'description':
          'Learn how to create effective and engaging presentations using Microsoft PowerPoint, including design principles and presentation delivery tips.'
    },
    {
      'title': 'Microsoft Word for Business',
      'description':
          'Master Microsoft Word for business use, including document formatting, mail merge, and collaboration tools.'
    },
    {
      'title': 'Google Workspace Essentials',
      'description':
          'Learn how to use Google Workspace (formerly G Suite) productivity tools, including Gmail, Google Drive, and Google Docs.'
    },
    {
      'title': 'Project Management with Microsoft Project',
      'description':
          'Learn how to use Microsoft Project to plan and manage projects, including task scheduling, resource allocation, and budget tracking.'
    },
    {
      'title': 'Time Management for Productivity',
      'description':
          'Develop time management skills to increase productivity and reduce stress, including strategies for prioritizing tasks, managing distractions, and improving focus.'
    },
    {
      'title': 'Communication Skills for Professionals',
      'description':
          'Develop effective communication skills for the workplace, including email etiquette, public speaking, and conflict resolution.'
    },
    {
      'title': 'Data Analysis with Tableau',
      'description':
          'Learn how to use Tableau for data visualization and analysis, including creating interactive dashboards and charts.'
    },
    {
      'title': 'Social Media Marketing for Businesses',
      'description':
          'Learn how to use social media platforms such as Facebook, Twitter, and Instagram for business marketing and branding purposes.'
    },
  ];
  List<Map<String, dynamic>> enrolled_courses = [
    {
      'title': 'The Complete Web Development Course',
      'author': 'Samantha Johnson',
      'level': 'Beginner',
      'rating': 4.6,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/4/300/200',
      'category': 'development'
    },
    {
      'title': 'Marketing Strategies for Entrepreneurs',
      'author': 'John Smith',
      'level': 'Intermediate',
      'rating': 4.4,
      'price': 29.99,
      'imageUrl': 'https://picsum.photos/seed/6/300/200',
      'category': 'marketing'
    },
    {
      'title': 'Introduction to Business Management',
      'author': 'Jane Doe',
      'level': 'Beginner',
      'rating': 4.5,
      'price': 19.99,
      'imageUrl': 'https://picsum.photos/seed/7/300/200',
      'category': 'management'
    },
    {
      'title': 'The Complete Python Bootcamp',
      'author': 'Bob Smith',
      'level': 'Advanced',
      'rating': 4.8,
      'price': 39.99,
      'imageUrl': 'https://picsum.photos/seed/3/300/200',
      'category': 'development'
    },
    {
      'title': 'Financial Planning for Entrepreneurs',
      'author': 'Sarah Johnson',
      'level': 'Intermediate',
      'rating': 4.6,
      'price': 34.99,
      'imageUrl': 'https://picsum.photos/seed/8/300/200',
      'category': 'management'
    },
    {
      'title': 'Social Media Marketing for Small Businesses',
      'author': 'David Lee',
      'level': 'Intermediate',
      'rating': 4.2,
      'price': 24.99,
      'imageUrl': 'https://picsum.photos/seed/9/300/200',
      'category': 'marketing'
    },
  ];
  List<Map<String, String>> enrolledCoursesDescriptions = [
    {
      'title': 'The Complete Web Development Course',
      'description':
          'Learn the complete web development stack from HTML and CSS to JavaScript and React.'
    },
    {
      'title': 'Marketing Strategies for Entrepreneurs',
      'description':
          'Discover the marketing strategies that successful entrepreneurs use to grow their businesses.'
    },
    {
      'title': 'Introduction to Business Management',
      'description':
          'Learn the basics of business management, including planning, organizing, and leading.'
    },
    {
      'title': 'The Complete Python Bootcamp',
      'description':
          'Get up to speed with Python, one of the most popular programming languages used in data science and web development.'
    },
    {
      'title': 'Financial Planning for Entrepreneurs',
      'description':
          'Learn how to manage your personal and business finances, and plan for a secure financial future.'
    },
    {
      'title': 'Social Media Marketing for Small Businesses',
      'description':
          'Explore the world of social media marketing and learn how to use it to grow your small business.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCF6F5A),
        title: Text('Learning Section'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
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
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseGridViewScreen(
                                courses: dev_courses,
                                courseDescriptions: devCourseDescriptions,
                              ),
                            ),
                          );
                        }
                        break;
                      case 1:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseGridViewScreen(
                                courses: business_courses,
                                courseDescriptions: businesscourseDescriptions,
                              ),
                            ),
                          );
                        }
                        break;
                      case 2:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseGridViewScreen(
                                courses: accountingCourses,
                                courseDescriptions:
                                    accountingcourseDescriptions,
                              ),
                            ),
                          );
                        }
                        break;
                      case 3:
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseGridViewScreen(
                                courses: officeCourses,
                                courseDescriptions: officeCoursesDescriptions,
                              ),
                            ),
                          );
                        }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Color(0xffCF6F5A),
                      label: Text(
                        categories[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
                  'Currently Enrolled',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xffCF6F5A)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseGridViewScreen(
                          courses: enrolled_courses,
                          courseDescriptions: enrolledCoursesDescriptions,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: enrolled_courses.length,
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
                                image: NetworkImage(
                                    enrolled_courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              enrolled_courses[index]['title'],
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
                              enrolled_courses[index]['author'],
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
                                  enrolled_courses[index]['rating'].toString(),
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
                                  '\$' + '${enrolled_courses[index]['price']}',
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
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xffCF6F5A))),
                                      child: Text('Resume'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CourseDetailScreen(
                                                      imageUrl:
                                                          'https://picsum.photos/200/300',
                                                      title:
                                                          devCourseDescriptions[
                                                              index]['title']!,
                                                      subtitle:
                                                          'Premium Course',
                                                      description:
                                                          devCourseDescriptions[
                                                                  index]
                                                              ['description']!,
                                                      rating: enrolled_courses[
                                                          index]['rating'],
                                                      price: enrolled_courses[
                                                          index]['price'],
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
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xffCF6F5A)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseGridViewScreen(
                          courses: dev_courses,
                          courseDescriptions: devCourseDescriptions,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dev_courses.length,
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
                                image: NetworkImage(
                                    dev_courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              dev_courses[index]['title'],
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
                              dev_courses[index]['author'],
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
                                  dev_courses[index]['rating'].toString(),
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
                                  '\$' + '${dev_courses[index]['price']}',
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
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xffCF6F5A))),
                                      child: Text('Enroll'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EnrollSuccessScreen(
                                                      title:
                                                          devCourseDescriptions[
                                                              index]['title']!,
                                                      description:
                                                          devCourseDescriptions[
                                                                  index]
                                                              ['description']!,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Top course in ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Development',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffCF6F5A)),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xffCF6F5A)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseGridViewScreen(
                          courses: dev_courses,
                          courseDescriptions: devCourseDescriptions,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dev_courses.length,
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
                                image: NetworkImage(
                                    dev_courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              dev_courses[index]['title'],
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
                              dev_courses[index]['author'],
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
                                  dev_courses[index]['rating'].toString(),
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
                                  '\$' + '${dev_courses[index]['price']}',
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
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xffCF6F5A))),
                                      child: Text('Enroll'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EnrollSuccessScreen(
                                                      title:
                                                          devCourseDescriptions[
                                                              index]['title']!,
                                                      description:
                                                          devCourseDescriptions[
                                                                  index]
                                                              ['description']!,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Top course in ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Business',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffCF6F5A)),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xffCF6F5A)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseGridViewScreen(
                          courses: business_courses,
                          courseDescriptions: businesscourseDescriptions,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: business_courses.length,
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
                                image: NetworkImage(
                                    business_courses[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              business_courses[index]['title'],
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
                              business_courses[index]['author'],
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
                                  business_courses[index]['rating'].toString(),
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
                                  '\$' + '${business_courses[index]['price']}',
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
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xffCF6F5A))),
                                      child: Text('Enroll'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CourseDetailScreen(
                                                      imageUrl:
                                                          'https://picsum.photos/200/300',
                                                      title:
                                                          businesscourseDescriptions[
                                                              index]['title']!,
                                                      subtitle:
                                                          'Premium Course',
                                                      description:
                                                          businesscourseDescriptions[
                                                                  index]
                                                              ['description']!,
                                                      rating: business_courses[
                                                          index]['rating'],
                                                      price: business_courses[
                                                          index]['price'],
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
        ],
      ),
    );
  }
}
