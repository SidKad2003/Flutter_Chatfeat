import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sign_up_login/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isVerified = false;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      sentVerificationEmail();

      Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future sentVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResend = false);
      await Future.delayed(const Duration(seconds: 6));
      setState(() => canResend = true);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Failed to send verification email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isVerified) {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? HomePage()
      : Stack(
      children: <Widget>[
        Center(
          child: Image.asset('assests/img/Signup Page Background.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Verify your email',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(224, 44, 43, 43)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'We have sent a verification email to your email address\nPlease verify your email to continue!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(207, 78, 78, 78)),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: sentVerificationEmail,
                    child: const Text('Resend verification email'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 56, 106, 32)),
                      minimumSize: MaterialStateProperty.resolveWith(
                          (states) => Size(247, 48)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.currentUser!.delete();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 56, 106, 32)),
                      minimumSize: MaterialStateProperty.resolveWith(
                          (states) => Size(247, 48)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    child: const Text('Go back and cancel Email verification'),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
}
