import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack/pages/otp_page.dart';
import 'package:hack/utils/show_snack_bar.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get userChanges {
    return _auth.authStateChanges();
  }

  User? getFirebaseUser() {
    return _auth.currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? finalUser = result.user;
      await sendEmailVerification(context);
      Navigator.of(context).pop();
      return finalUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      showSnackBar(context, e.message!);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> sendEmailVerification(
    BuildContext context,
  ) async {
    try {
      getFirebaseUser()!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      showSnackBar(context, e.message!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? finalUser = result.user;
      if (!finalUser!.emailVerified) {
        await sendEmailVerification(context);
      }
      Navigator.of(context).pop();
      return finalUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      showSnackBar(context, e.message!);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> signInWithPhone(
    String phoneNumber,
    BuildContext context,
  ) async {
    TextEditingController otpController = TextEditingController();
    print(phoneNumber);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackBar(context, e.message!);
        },
        codeSent: (String verificationId, int? token) async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpPage(
                otpController: otpController,
                onPressed: (String otp) async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otp,
                  );
                  await _auth.signInWithCredential(credential);
                  // Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> signInWithGoogle(
    BuildContext context,
  ) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken,
          accessToken: googleAuth?.accessToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
