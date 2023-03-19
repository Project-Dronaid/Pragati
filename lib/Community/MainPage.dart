import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hack/Community/community.dart';
import 'package:hack/constants/constantString.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

final _patientQuery = TextEditingController();

class _MainPageState extends State<MainPage> {
  String onSelected = "Explore";
  int _selectedIndex = 0;
  int countJoined = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    void _onItemTapped(int index) {
      print(index);
      if (index == 0) {
        setState(() {
          _selectedIndex = index;
        });
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    }

    List<Widget> _chatMessages = [
      BotMessageWidget(
        width: width,
        message:
            'Hello!\nI\'m your Rural Virtual Women. Ask any queries in the chat or select the options below to begin',
      ),
      OwnMessageWidget(
        message:
            "What are the key drivers of growth for my business, and how can I capitalize on them?",
      ),
      BotMessageWidget(
          width: width,
          message:
              "Increase customer awareness. Develop effective marketing and branding campaigns to get your product or service"),
      OwnMessageWidget(
        message:
            "What are the biggest challenges or obstacles to growth, and how can I address them?",
      ),
      BotMessageWidget(
          width: width,
          message:
              "The biggest challenge to growth for any business is finding the resources to expand, whether those be financial, human, or something else. Some common obstacles to growth include lack of capital, limited personnel or resources, inadequate infrastructure, inefficient processes, and regulatory issues."),
      OwnMessageWidget(
        message:
            "What is the market demand for my products or services, and how can I increase my market share?",
      ),
      BotMessageWidget(
          width: width,
          message:
              "Market demand for a product or service can be determined in a variety of ways. The most reliable way is to conduct market research and surveys to see what customers think about your offering and what they need from it."),
      OwnMessageWidget(
        message:
            "What are the competition and market trends, and how can I position myself to stay competitive?",
      ),
      BotMessageWidget(
          width: width,
          message:
              "Competition and market trends are constantly changing and shifting, so it is important to stay on top of what the competition is doing."),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F1),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(26.0),
            topLeft: Radius.circular(26.0),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: 'Chat',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xffCE6E59),
          unselectedItemColor: Color(0xff7C7C7C),
          onTap: _onItemTapped,
        ),
      ),
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
                _selectedIndex == 0
                    ? Column(
                        children: [
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: onSelected != "Community"
                                              ? Color(0xffFAF8F1)
                                              : Color(0xffCF6F5A)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                          onSelected != "Community"
                              ? SizedBox(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: communitesNames.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02,
                                        vertical: height * 0.02,
                                      ),
                                      child: Container(
                                        height: height * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(26.0),
                                            topLeft: Radius.circular(26.0),
                                            bottomRight: Radius.circular(26.0),
                                            bottomLeft: Radius.circular(26.0),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
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
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        communitiesImages[
                                                            index]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(26.0),
                                                    topLeft:
                                                        Radius.circular(26.0),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(26.0),
                                                    bottomLeft:
                                                        Radius.circular(26.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              communitesNames[
                                                                  index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      height *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '${communitiesMembers[index]} Members',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff7C7C7C),
                                                            fontSize:
                                                                height * 0.016,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: height *
                                                                    0.008),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                if (commJoined[
                                                                    index])
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Community(
                                                                                indexpoint: index,
                                                                                name: communitesNames[index],
                                                                              )));
                                                                setState(() {
                                                                  if (!commJoined[
                                                                      index]) {
                                                                    countJoined++;
                                                                    selectedCommIndex
                                                                        .add(
                                                                            index);
                                                                  }

                                                                  commJoined[
                                                                          index] =
                                                                      true;
                                                                });
                                                                Future.delayed(
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () {
                                                                  setState(() {
                                                                    onSelected =
                                                                        "Community";
                                                                  });
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: commJoined[
                                                                          index]
                                                                      ? Color(
                                                                          0xFFFAF8F1)
                                                                      : Color(
                                                                          0xffCF6F5A),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.4),
                                                                      offset:
                                                                          const Offset(
                                                                        0.5,
                                                                        0.5,
                                                                      ),
                                                                      blurRadius:
                                                                          2.0,
                                                                      spreadRadius:
                                                                          1.0,
                                                                    ), //BoxShadow
                                                                    //BoxShadow
                                                                  ],
                                                                ),
                                                                height: height *
                                                                    0.032,
                                                                width:
                                                                    width * 0.2,
                                                                child: Center(
                                                                  child: Text(
                                                                    !commJoined[
                                                                            index]
                                                                        ? 'JOIN'
                                                                        : 'GO',
                                                                    style: TextStyle(
                                                                        color: !commJoined[index]
                                                                            ? Color(
                                                                                0xffFAF8F1)
                                                                            : Color(
                                                                                0xffCF6F5A),
                                                                        fontSize:
                                                                            height *
                                                                                0.018,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics: ClampingScrollPhysics(),
                                          itemCount: countJoined,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.02,
                                                  vertical: height * 0.02),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Community(
                                                                indexpoint:
                                                                    selectedCommIndex[
                                                                        index],
                                                                name: communitesNames[
                                                                    selectedCommIndex[
                                                                        index]],
                                                              )));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
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
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          communitesNames[
                                                              selectedCommIndex[
                                                                  index]],
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontSize:
                                                                  height * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                        Row(children: [
                                                          Expanded(
                                                            child: CircleAvatar(
                                                              radius: height *
                                                                  0.045,
                                                              backgroundImage:
                                                                  AssetImage(commImg[
                                                                      selectedCommIndex[
                                                                          index]]),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ...messageComm[
                                                                        selectedCommIndex[
                                                                            index]]
                                                                    .split(
                                                                        "\n\n")
                                                                    .map(
                                                                        (e) =>
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                const Text(" - "),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    "${e}\n",
                                                                                    style: TextStyle(color: Color(0xffCF6F5A), fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ))
                                                                    .toList(),
                                                              ],
                                                            ),
                                                          )
                                                        ]),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                                ),
                        ],
                      )
                    : Column(children: [
                        Container(
                          child: Column(children: [
                            SizedBox(
                              height: height * 0.9,
                              child: ListView.builder(
                                itemCount: _chatMessages.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return _chatMessages[index];
                                },
                              ),
                            ),
                          ]),
                        ),
                      ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
