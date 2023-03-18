// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hack/firebase/auth.dart';
// import '../constants/constant_colors.dart';
// import 'login_screen.dart';

// class Authenticate extends StatefulWidget {
//   const Authenticate({super.key});

//   @override
//   State<Authenticate> createState() => _AuthenticateState();
// }

// class _AuthenticateState extends State<Authenticate> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     // setState(() {});
//     return const SafeArea(
//       child: Scaffold(
//         body: Content(),
//       ),
//     );
//   }
// }

// class Content extends StatefulWidget {
//   const Content({super.key});

//   @override
//   State<Content> createState() => _ContentState();
// }

// class _ContentState extends State<Content> {
//   TextEditingController phoneController = TextEditingController();
//   bool isLoading = false;
//   bool showOnboarding = true;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     if (showOnboarding) {
//       return Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xff402061).withOpacity(0.556),
//               Color(0xff048BF2).withOpacity(0.8789),
//               Color(0xff048BF2).withOpacity(0.7678),
//               Color(0xff048BF2).withOpacity(0.6567),
//               Color(0xff048BF2).withOpacity(0.5456),
//               Color(0xff402061).withOpacity(0.456),
//               Color(0xff402061).withOpacity(0.345),
//               Color(0xff402061).withOpacity(0.234),
//             ],
//             stops: [0.01, 0.11, 0.21, 0.31, 0.51, 0.71, 0.81, 0.91],
//           ),
//         ),
//         height: height,
//         width: width,
//         child: Stack(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: width * 0.8,
//                   height: height * 0.6,
//                   child: Image.asset(
//                     "assets/avaters/RISE.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: height * 0.1,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     showOnboarding = false;
//                   });
//                 },
//                 child: Container(
//                   width: width * 0.6,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Color(0xffCF6F5A)),
//                   child: SizedBox(
//                     width: width * 0.6,
//                     height: height * 0.06,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(Icons.login),
//                         Text(
//                           "Power Up",
//                           style: GoogleFonts.lexend(
//                             fontWeight: FontWeight.w600,
//                             fontSize: height * 0.03,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return SingleChildScrollView(
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   showOnboarding = !showOnboarding;
//                 });
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(top: 18, left: 15),
//                 alignment: Alignment.topLeft,
//                 height: height * 0.03,
//                 width: width,
//                 child: SvgPicture.asset('assets/icons/Vector.svg'),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.095,
//             ),
//             Container(
//               width: width,
//               alignment: Alignment.topLeft,
//               margin: const EdgeInsets.only(top: 10, left: 32),
//               child: Text(
//                 "Namaste!",
//                 style: GoogleFonts.lexend(fontSize: height * 0.040),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.086,
//             ),
//             SizedBox(
//               width: width * 0.8,
//               child: TextField(
//                   controller: phoneController,
//                   cursorColor: Colors.yellow,
//                   showCursor: true,
//                   decoration: InputDecoration(
//                     hintText: "Your Number",
//                     hintStyle: GoogleFonts.inter(fontSize: height * 0.02),
//                     enabledBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.yellow, width: 2),
//                     ),
//                     focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.yellow, width: 2),
//                     ),
//                     border: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.yellow, width: 2),
//                     ),
//                   )),
//             ),
//             SizedBox(
//               height: height * 0.077,
//             ),
//             SizedBox(
//               width: width * 0.9,
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: 'By logging in, you accept our ',
//                   style: GoogleFonts.inter(
//                     fontSize: height * 0.015,
//                     color: Colors.black,
//                   ),
//                   children: const <InlineSpan>[],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.077,
//             ),
//             GestureDetector(
//               onTap: () {
//                 AuthServices()
//                     .signInWithPhone("+91${phoneController.text}", context);
//                 setState(() {
//                   isLoading = true;
//                 });
//               },
//               child: Container(
//                 width: width * 0.73,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.yellow,
//                 ),
//                 child: SizedBox(
//                   width: width * 0.6,
//                   height: height * 0.06,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       isLoading == true
//                           ? const CircularProgressIndicator()
//                           : Text(
//                               "Continue",
//                               style: GoogleFonts.lexend(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: height * 0.025,
//                                 color: Colors.black,
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.038,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.yellow),
//                   ),
//                   width: width * 0.4,
//                 ),
//                 Container(
//                   child: const Text("OR"),
//                   margin: const EdgeInsets.only(
//                     left: 10,
//                     right: 10,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.yellow),
//                   ),
//                   width: width * 0.4,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: height * 0.038,
//             ),
//             Container(
//               width: width * 0.73,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: const Color.fromRGBO(217, 217, 217, 0.75),
//               ),
//               child: GestureDetector(
//                 onTap: () {},
//                 child: SizedBox(
//                   width: height * 0.317,
//                   height: height * 0.06,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/icons8-whatsapp.svg',
//                         height: height * 0.045,
//                         width: height * 0.035,
//                       ),
//                       Text(
//                         "Sign Up with Whatsapp",
//                         style: GoogleFonts.lexend(
//                           fontWeight: FontWeight.w600,
//                           fontSize: height * 0.018,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.065,
//             ),
//             // RichText(
//             //   textAlign: TextAlign.center,
//             //   text: TextSpan(
//             //     text: 'Joined us before ? ',
//             //     style: GoogleFonts.inter(
//             //       fontSize: height * 0.018,
//             //       color: Colors.black,
//             //     ),
//             //     children: const <InlineSpan>[
//             //       WidgetSpan(
//             //         alignment: PlaceholderAlignment.baseline,
//             //         baseline: TextBaseline.alphabetic,
//             //         child: LinkButton(
//             //             urlLabel: "Login",
//             //             text_color: Colors.yellow,
//             //             size: 0.018,
//             //             url: "https://example.com/terms-and-conditions"),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       );
//       ;
//     }
//   }
// }
