import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parentive/utils/customExitAppDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 55.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff50BE91),
                    child: Text("SignOut"),
                    onPressed: () async {
                      final _prefs = await SharedPreferences.getInstance();
                      var name = await _prefs.setString("name", "");
                      var email = await _prefs.setString("email", "");
                      var password = await _prefs.setString("password", "");
                      auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'onBoarding', (route) => false);
                      await _prefs.setString("name", "");
                      print("name : $name");
                      print("email : $email");
                      print("password : $password");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
