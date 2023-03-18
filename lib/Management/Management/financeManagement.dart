import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hack/Management/Management/provider.dart';
import 'package:hack/constants/constant_colors.dart';
import 'package:provider/provider.dart';

import 'addTransaction.dart';

class financeHomepage extends StatefulWidget {
  const financeHomepage();
  // final BuildContext context;
  @override
  State<financeHomepage> createState() => _financeHomepageState();
}

class _financeHomepageState extends State<financeHomepage> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    int totalBal = data.income - data.expense;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //var scaffoldKey;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 248, 241, 1),
      key: scaffoldKey,
      drawer: Drawer(
          child: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(250, 248, 241, 1)),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.06, vertical: height * 0.05),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(206, 111, 89, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.015),
              child: Center(
                child: Text(
                  "Portfolio",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      )),
      body: SafeArea(
          child: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: height * 0.28,
                      width: width,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(206, 111, 89, 0.9),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width * 0.07),
                            bottomRight: Radius.circular(width * 0.07)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 25),
                            child: IconButton(
                              onPressed: () =>
                                  scaffoldKey.currentState!.openDrawer(),
                              icon: Icon(
                                Icons.list,
                                size: width*0.09,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 30),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Good ${data.timeOfDay()}!',
                                    textStyle:  TextStyle(
                                      fontSize: width*0.09,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(milliseconds: 200),
                                displayFullTextOnTap: false,
                                stopPauseOnTap: false,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color.fromRGBO(250, 248, 241, 1),
                      height: height * 0.15,
                    )
                  ],
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.85,
                    height: height * 0.25,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(206, 111, 89, 1),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: height * 0.15),
                    padding: EdgeInsets.all(height * 0.02),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Total Balance",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w600),
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "₹ $totalBal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.w700),
                            )),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13,
                                      //backgroundColor: Color.fromRGBO(231, 142, 129, 1.0),
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: Colors.white,
                                        size: width * 0.05,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.03),
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.045,
                                        color: const Color.fromARGB(
                                            255, 216, 216, 216),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₹ ${data.income}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.045,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13,
                                      //backgroundColor: Color.fromRGBO(231, 142, 129, 1.0),
                                      backgroundColor: Colors.red,
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                        size: width * 0.05,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.03),
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.045,
                                        color: const Color.fromARGB(
                                            255, 216, 216, 216),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₹ ${data.expense}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.045,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions History',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const addTransaction()));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(360)),
                            border: Border.all(color: Colors.green),
                            color: Colors.greenAccent.withOpacity(0.5)),
                        child: Text(
                          "Add Transaction",
                          style: TextStyle(
                              color: const Color.fromRGBO(79, 121, 66, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.038),
                        )),
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: data.t.length,
                  itemBuilder: (BuildContext context, int index) {
                    String weekday = "";
                    switch (data.t[index].d!.weekday) {
                      case 1:
                        weekday = "Monday";
                        break;
                      case 2:
                        weekday = "Tuesday";
                        break;
                      case 3:
                        weekday = "Wednesday";
                        break;
                      case 4:
                        weekday = "Thursday";
                        break;
                      case 5:
                        weekday = "Friday";
                        break;
                      case 6:
                        weekday = "Saturday";
                        break;
                      case 7:
                        weekday = "Sunday";
                        break;
                    }

                    return ListTile(
                      leading: Icon(
                        (data.t[index].type == 1)
                            ? (Icons.upload)
                            : (Icons.download),
                        color: (data.t[index].type == 1)
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(
                        "${data.t[index].name}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${weekday}  ${data.t[index].d!.year}-${data.t[index].d!.month}-${data.t[index].d!.day}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        "${data.t[index].val}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: (data.t[index].type == 1)
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    );
                  }),
            ),

            // Expanded(
            //   child: ListView.builder(
            //
            //       itemCount: test.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //             leading:  Icon(Icons.add),
            //             trailing:  Text(
            //               "DRONAID",
            //               style: TextStyle(color:  Colors.red, fontSize: 15),
            //             ),
            //             title: Text(test[index])
            //         );
            //       }
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
