import 'package:flutter/material.dart';
import 'package:parentive/screens/signup_email.dart';
import 'package:parentive/screens/signup_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpEmail extends StatefulWidget {
  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff000000),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Whats your \nemail address?",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "2/3",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter your valid';
                    } else if (value.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email address",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 24),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.26,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      color: Color(0xff50BE91),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          final _prefs = await SharedPreferences.getInstance();
                          await _prefs.setString("email", _email.text);
                          Navigator.pushNamed(context, 'SignUpPassword');
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => SignUpPassword(),
                          //   ),
                          // );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
