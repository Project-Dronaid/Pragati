import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hack/Community/community.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String onSelected = "Explore";
  List<String> _communitesNames = [
    'Business Associations',
    'Women\'s groups',
    'Social media groups',
    'Local Community organisations',
    'Co-working spaces',
    'Entrepreneurship programs',
    'Mentorship programs'
  ];
  List<String> _communitiesImages = [
    'assets/Communities/BusinessAssociation.jpeg',
    'assets/Communities/WomensGroups.jpeg',
    'assets/Communities/SocialMedia.jpeg',
    'assets/Communities/LocalCommunity.jpeg',
    'assets/Communities/coworkingspace.jpeg',
    'assets/Communities/EntrepreneurshipProgram.jpeg',
    'assets/Communities/MentorshipPrograms.jpeg',
  ];
  List<String> _communitiesMembers = [
    '124',
    '102',
    '189',
    '100',
    '152',
    '210',
    '115',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F1),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.04, horizontal: width * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.05,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffFAF8F1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(
                              0.5,
                              0.5,
                            ),
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          //BoxShadow
                        ],
                      ),
                      child: Icon(Icons.person),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffFAF8F1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(
                                  0.5,
                                  0.5,
                                ),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                          ),
                          child: Icon(Icons.search),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffFAF8F1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(
                                  0.5,
                                  0.5,
                                ),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                          ),
                          child: Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Communites",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.04,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            "Get expert advice, ask questions",
                            style: TextStyle(
                                color: Color(0xff7C7C7C),
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.04),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              onSelected = "Explore";
                            });
                          },
                          child: Container(
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: onSelected != "Explore"
                                  ? Color(0xffFAF8F1)
                                  : Color(0xffCF6F5A),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "🚀 Explore",
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.02,
                                    color: onSelected == "Explore"
                                        ? Colors.white
                                        : Color(0xff7C7C7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              onSelected = "Community";
                            });
                          },
                          child: Container(
                            height: height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: onSelected != "Community"
                                    ? Color(0xffFAF8F1)
                                    : Color(0xffCF6F5A)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "☝️ My community",
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.02,
                                    color: onSelected == "Community"
                                        ? Colors.white
                                        : Color(0xff7C7C7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // for (int i = 0;
                        //     i < _onselected.length;
                        //     i++) {
                        //   if (i == index) {
                        //     _onselected[i] = true;
                        //   } else {
                        //     _onselected[i] = false;
                        //   }
                        // }
                      });
                    },
                    child: CarouselSlider.builder(
                      itemCount: _communitesNames.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) =>
                              Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(26.0),
                              topLeft: Radius.circular(26.0),
                              bottomRight: Radius.circular(26.0),
                              bottomLeft: Radius.circular(26.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(
                                  0.5,
                                  0.5,
                                ),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(_communitiesImages[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(26.0),
                                      topLeft: Radius.circular(26.0),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(26.0),
                                      bottomLeft: Radius.circular(26.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.035),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                _communitesNames[index],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: height * 0.025,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${_communitiesMembers[index]} Members',
                                          style: TextStyle(
                                              color: Color(0xff7C7C7C),
                                              fontSize: height * 0.016,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Community(
                                                          indexpoint: index,
                                                          name:
                                                              _communitesNames[
                                                                  index],
                                                        )));
                                          },
                                          child: Text(
                                            'Join group ➡️',
                                            style: TextStyle(
                                                color: Color(0xffCF6F5A),
                                                fontSize: height * 0.024,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        viewportFraction: 0.65,
                        height: height * 0.6,
                        autoPlay: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
