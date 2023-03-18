import 'package:flutter/material.dart';

class LinkedInProfileScreen extends StatefulWidget {
  @override
  _LinkedInProfileScreenState createState() => _LinkedInProfileScreenState();
}

class _LinkedInProfileScreenState extends State<LinkedInProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildProfileSection(),
                _buildExperienceSection(),
                SizedBox(
                  height: 20,
                ),
                _buildEducationSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 70.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(206, 111, 89, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Text(
            'Profile',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/13.jpg',
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jane Doe',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Product Manager at ABC Company',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'San Francisco Bay Area',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '500+ connections',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            child: Container(width: 300, child: Center(child: Text('Connect'))),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(206, 111, 89, 1), // background color
              onPrimary: Colors.white, // text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'About',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Experienced Product Manager with a demonstrated history of working in the internet industry. Skilled in User Experience (UX), Product Management, Mobile Applications, Agile Methodologies, and Product Marketing. Strong product management professional with a Bachelor of Arts (B.A.) focused in Communication from University of California, Berkeley.',
                style: TextStyle(fontSize: 16.0),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experience',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildExperienceItem(
              'Product Manager',
              'ABC Company',
              'Jan 2018 - Present',
            ),
            SizedBox(height: 8.0),
            _buildExperienceItem(
              'Product Manager',
              'XYZ Inc.',
              'Mar 2015 - Dec 2015',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceItem(String title, String subtitle, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 4.0),
        Text(
          date,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildEducationSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          _buildEducationItem(
            'Bachelor of Arts in Communication',
            'University of California, Berkeley',
            'Aug 2011 - May 2015',
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String title, String subtitle, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 4.0),
        Text(
          date,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
