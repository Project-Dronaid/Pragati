import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key, required this.indexpoint, required this.name});
  final int indexpoint;
  final String name;
  @override
  State<Community> createState() => _CommunityState();
}

List<String> _commImg = [
  "assets/CommImg/bsa.jpeg",
  "assets/CommImg/wg.jpeg",
  "assets/CommImg/smg.avif",
  "assets/CommImg/mg.jpeg",
  "assets/CommImg/cws.jpeg",
  "assets/CommImg/eg.jpeg",
  "assets/CommImg/lco.jpeg"
];

List<String> _commInfo = [
  "These are groups of entrepreneurs who come together to network, share ideas, and collaborate on projects. Examples include the Chamber of Commerce, local business associations, and industry-specific associations.",
  "These are groups of women who come together to support each other in their personal and professional lives. Examples include women's business networks, Women in Business groups, and women's leadership groups.",
  "There are many online communities on platforms such as Facebook and LinkedIn that are dedicated to entrepreneurship and business. Joining these groups can provide access to a large network of peers and mentors.",
  "These include groups such as the Rotary Club, Lions Club, and Kiwanis Club. They are often focused on community service but also provide networking opportunities for entrepreneurs.",
  "These are shared workspaces where entrepreneurs can rent a desk or office space. They often provide networking events and workshops for members.",
  "Many universities, community colleges, and non-profit organizations offer entrepreneurship programs and workshops for aspiring entrepreneurs. These can be a great way to learn new skills and connect with other entrepreneurs.",
  "There are many mentorship programs available for entrepreneurs, such as SCORE, which pairs entrepreneurs with experienced business professionals."
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

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    print(widget.indexpoint);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffCF6F5A),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Color(0xffFAF8F1),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.3,
                      decoration: BoxDecoration(
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
                        image: DecorationImage(
                          image: AssetImage(_commImg[widget.indexpoint]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          // topRight: Radius.circular(22.0),
                          // topLeft: Radius.circular(22.0),
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xffA5503E).withOpacity(0.4),
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
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffA5503E).withOpacity(0.4),
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
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              Container(
                                height: height * 0.05,
                                width: width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffA5503E).withOpacity(0.4),
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
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: height * 0.02,
                        right: width * 0.01,
                        child: Padding(
                            padding: EdgeInsets.only(left: width * 0.06),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Color(0xffFAF8F1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.032),
                            ))),
                  ],
                ),
                Container(
                  height: height * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xffFAF8F1)),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035, vertical: height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _communitiesMembers[widget.indexpoint] +
                                      ' Members',
                                  style: TextStyle(
                                      color: Color(0xff7C7C7C),
                                      fontSize: height * 0.020,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Community(
                              //               indexpoint: index,
                              //               name:
                              //                   _communitesNames[
                              //                       index],
                              //             )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xffA5503E),
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
                              height: height * 0.06,
                              width: width * 0.4,
                              child: Center(
                                child: Text(
                                  'Join group ➡️',
                                  style: TextStyle(
                                      color: Color(0xffFAF8F1),
                                      fontSize: height * 0.024,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About this group",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                _commInfo[widget.indexpoint],
                                style: TextStyle(
                                    color: Color(0xff7C7C7C),
                                    fontFamily: "Poppins",
                                    fontSize: height * 0.02),
                              ),
                            ],
                          ),
                          DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  TabBar(
                                    indicatorColor: Color(0xffCE6E59),
                                    labelColor: Color(0xffCE6E59),
                                    unselectedLabelColor: Color(0xff7C7C7C),
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          'Discussions',
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Resources',
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Sessions',
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Members',
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
