import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/firebase/auth.dart';
import 'package:rive/rive.dart';
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
    return const SafeArea(
      child: Scaffold(
        body: Content(),
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
  late RiveAnimationController _btnAnimatioController;

  @override
  void initState() {
    _btnAnimatioController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  bool showOnboarding = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (showOnboarding) {
      return Stack(
          children: [
            Positioned(
              width: width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/Backgrounds/Spline.png"),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
              child: SizedBox(),
            )),
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
              fit: BoxFit.cover,
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: SizedBox(),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to PRAGATI",
                          style: TextStyle(
                              fontSize: height * 0.05,
                              fontFamily: "Poppins",
                              height: 1.2,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: height * 0.016,
                        ),
                        Text(
                          "This app is designed to empower and support rural women by providing them with access to resources, education, and opportunities that can help them improve their lives and the lives of their families.",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Animatedbtn(
                    btnAnimatioController: _btnAnimatioController,
                    press: () {
                      _btnAnimatioController.isActive = true;
                      setState(() {
                        showOnboarding = false;
                      });
                    },
                  ),
                  SizedBox(
                    height: height * 0.016,
                  ),
                  Text(
                      '"Empowering rural women is not just a matter of human rights, it\'s also crucial for sustainable development and economic growth."',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * 0.016,
                  ),
                ],
              ),
            )
          ],
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
                  children: const <InlineSpan>[],
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
class Animatedbtn extends StatelessWidget {
  const Animatedbtn({
    super.key,
    required RiveAnimationController btnAnimatioController,
    required this.press,
  }) : _btnAnimatioController = btnAnimatioController;

  final RiveAnimationController _btnAnimatioController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(children: [
          RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [_btnAnimatioController],
          ),
          Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
