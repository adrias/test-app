import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parentive/screens/login_main_1.dart';
import 'package:parentive/screens/signup_name.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 26,
                    bottom: 23,
                  ),
                  child: Text(
                    "Test app",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.only(
                    bottom: 9,
                  ),
                  child: Text(
                    "Create a account.",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.54,
                  margin: EdgeInsets.only(
                    bottom: 190,
                  ),
                  child: Text(
                    "Track share collaborate for your child with special needs.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  color: Color(0xff50BE91),
                  child: Text(
                    "Lets start",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'SignUpName');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => SignUpName(),
                    //   ),
                    // );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 150,
                ),
                padding: EdgeInsets.only(top: 15),
                color: Color(0xffF5F5F5),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'log in',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(
                              0xff50BE91,
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'Login');
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => LoginMain(),
                              //   ),
                              // );
                            },
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
    );
  }
}
