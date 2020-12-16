import 'package:flutter/material.dart';
import 'package:parentive/screens/signup_email.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpName extends StatefulWidget {
  @override
  _SignUpNameState createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
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
                        "Whats you name?",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "1/3",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your full name';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Your full name",
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
                          final _pref = await SharedPreferences.getInstance();
                          await _pref.setString("name", _name.text);
                          Navigator.pushNamed(context, 'SingUpEmail');
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => SignUpEmail(),
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
