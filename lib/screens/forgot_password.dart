import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  _showSnack(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xffD6D6D6),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xff000000),
          ),
        ),
        action: SnackBarAction(
            textColor: Color(0xff50BE91),
            label: "Done",
            onPressed: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'onBoarding', (route) => false);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Forgot password",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 8,
                    ),
                    child: Text(
                      "Rest your password.",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    margin: EdgeInsets.only(
                      bottom: 28,
                    ),
                    child: Text(
                      "We will send you and email with the password reset link which will redirect you to password reset page.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!emailRegex.hasMatch(value)) {
                      return "Enter valid Email address";
                    } else if (value.isEmpty) {
                      return 'Form cannot be emplty';
                    }
                    return null;
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Email address",
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.only(top: 48),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    color: Color(0xff50BE91),
                    child: Text(
                      "Send link",
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _showSnack("Sent to ${_controller.text}");
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, 'onBoarding', (route) => false);
                      }
                    },
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
