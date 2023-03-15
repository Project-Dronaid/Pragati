import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/firebase/auth.dart';
import '../constants/constant_colors.dart';
import 'login_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // setState(() {});
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: const Content(),
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  bool showOnboarding = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    if (showOnboarding) {
      return Center(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.5,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 229, 0, 0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(children: [
                
              ]),
            ),
            SizedBox(
              height: height * (45 / height),
            ),
            SizedBox(
              height: height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Get all the",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.03),
                      ),
                      Text(
                        "customer info here",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.03),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        "Discover your sales,",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.02,
                        ),
                      ),
                      Text(
                        "Average order value of each",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.02,
                        ),
                      ),
                      Text(
                        "customer and more.",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.02,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showOnboarding = false;
                      });
                    },
                    child: Container(
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      child: SizedBox(
                        width: width * 0.6,
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Text(
                                "Get Started",
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.03,
                                  color: Colors.white,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/Vector (8).svg',
                                height: height * 0.023,
                                width: height * 0.023,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showOnboarding = !showOnboarding;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 18, left: 15),
                alignment: Alignment.topLeft,
                height: height * 0.03,
                width: width,
                child: SvgPicture.asset('assets/icons/Vector.svg'),
              ),
            ),
            SizedBox(
              height: height * 0.095,
            ),
            Container(
              width: width,
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10, left: 32),
              child: Text(
                "Namaste!",
                style: GoogleFonts.lexend(fontSize: height * 0.040),
              ),
            ),
            SizedBox(
              height: height * 0.086,
            ),
            SizedBox(
              width: width * 0.8,
              child: TextField(
                  controller: phoneController,
                  cursorColor: Colors.yellow,
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: "Your Number",
                    hintStyle: GoogleFonts.inter(fontSize: height * 0.02),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                  )),
            ),
            SizedBox(
              height: height * 0.077,
            ),
            SizedBox(
              width: width * 0.9,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By logging in, you accept our ',
                  style: GoogleFonts.inter(
                    fontSize: height * 0.015,
                    color: Colors.black,
                  ),
                  children: const <InlineSpan>[
                    
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.077,
            ),
            GestureDetector(
              onTap: () {
                AuthServices()
                    .signInWithPhone("+91${phoneController.text}", context);
                setState(() {
                  isLoading = true;
                });
              },
              child: Container(
                width: width * 0.73,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow,
                ),
                child: SizedBox(
                  width: width * 0.6,
                  height: height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      isLoading == true
                          ? const CircularProgressIndicator()
                          : Text(
                              "Continue",
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.025,
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.038,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.yellow),
                  ),
                  width: width * 0.4,
                ),
                Container(
                  child: const Text("OR"),
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.yellow),
                  ),
                  width: width * 0.4,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.038,
            ),
            Container(
              width: width * 0.73,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(217, 217, 217, 0.75),
              ),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: height * 0.317,
                  height: height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icons8-whatsapp.svg',
                        height: height * 0.045,
                        width: height * 0.035,
                      ),
                      Text(
                        "Sign Up with Whatsapp",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.065,
            ),
            // RichText(
            //   textAlign: TextAlign.center,
            //   text: TextSpan(
            //     text: 'Joined us before ? ',
            //     style: GoogleFonts.inter(
            //       fontSize: height * 0.018,
            //       color: Colors.black,
            //     ),
            //     children: const <InlineSpan>[
            //       WidgetSpan(
            //         alignment: PlaceholderAlignment.baseline,
            //         baseline: TextBaseline.alphabetic,
            //         child: LinkButton(
            //             urlLabel: "Login",
            //             text_color: Colors.yellow,
            //             size: 0.018,
            //             url: "https://example.com/terms-and-conditions"),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
      ;
    }
  }
}
