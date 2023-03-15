import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  late TextEditingController otpController;
  late Function onPressed;
  late String mobileNumber;
  OtpPage({
    super.key,
    required this.otpController,
    required this.onPressed,
    required this.mobileNumber,
  });
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  margin: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                  ),
                  // height: height * 0.01,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                      ),
                    ],
                  ),
                ),
                Text(
                  "OTP",
                  style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                // Image.asset(
                //   'assets/images/otp.png',
                //   height: height * 0.3,
                //   width: width * 0.5,
                // ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Verification Code",
                  style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "We have sent a one-time-password \nto your Mobile number",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  widget.mobileNumber,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  // androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  onCompleted: (pin) {
                    widget.otpController.text = pin;
                    widget.onPressed(pin);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
