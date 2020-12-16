import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parentive/check.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final fb = FirebaseAuth.instance;
  splashTime() async {
    return Timer(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Check()), (route) => false);

      // fb.currentUser != null
      //     ? Navigator.pushNamedAndRemoveUntil(
      //         context, 'HomePage', (route) => false)
      //     : Navigator.pushNamedAndRemoveUntil(
      //         context, 'onBoarding', (route) => false);

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => OnBoarding()),
      //     (route) => true);
    });
  }

  // condition() {
  //   fb.currentUser == null
  //       ? Navigator.pushNamed(context, 'onBoarding')
  //       : Navigator.pushNamedAndRemoveUntil(
  //           context, 'HomePage', (route) => false);
  //   // if (fb.currentUser != null) {
  //   //   Navigator.pushNamedAndRemoveUntil(context, 'HomePage', (route) => false);
  //   // } else {
  //   //   return 'Error';
  //   // }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SplashScreen",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
