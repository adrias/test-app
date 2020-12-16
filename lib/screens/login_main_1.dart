import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parentive/screens/email_login_1.dart';
import 'package:parentive/screens/singup_info.dart';

class LoginMain extends StatefulWidget {
  @override
  _LoginMainState createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Log in",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xff000000),
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 53,
                  bottom: 16,
                ),
                child: Text(
                  "Test app",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 24.5,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  "Good to see you again.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  bottom: 350,
                ),
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.mail,
                    color: Color(0xff50BE91),
                  ),
                  label: Text(
                    "Continue with email",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'EmailLogin');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => EmailLogin(),
                    //   ),
                    // );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                color: Color(0xffF5F5F5),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Dont have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'sign up',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(
                              0xff50BE91,
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'Signup');
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => SignUp(),
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
