import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parentive/Bloc/login/loginBloc.dart';
import 'package:parentive/Bloc/reg/regBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPassword extends StatefulWidget {
  @override
  _SignUpPasswordState createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final RegExp passRegex =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])[a-zA-Z0-9](?=.*[!@#\$%-_^&*~]).{8,}$');
  bool obscure = false;
  bool obscureConfirm = false;
  _obscureTextConfirm() {
    setState(() {
      obscureConfirm = !obscureConfirm;
    });
  }

  _obscureText() {
    setState(() {
      obscure = !obscure;
    });
  }

  _showSnack(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
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
            }),
      ),
    );
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
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
                    bottom: 38,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create a password \nfor your account",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3/3",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!passRegex.hasMatch(value)) {
                      return 'Entered password is not valid, Please enter valid password!';
                    } else if (value.isEmpty) {
                      return 'Password field cannot be empty';
                    }
                  },
                  obscureText: !obscure,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _obscureText();
                        },
                        child: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      labelText: "Create password",
                      hintMaxLines: 4,
                      hintText:
                          "Should be 8 character long. Contains symbole and one number"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password do not match';
                    } else {
                      return null;
                    }
                  },
                  obscureText: !obscureConfirm,
                  decoration: InputDecoration(
                    hintText: 're-enter password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _obscureTextConfirm();
                      },
                      child: Icon(
                        obscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    labelText: "Confirm password",
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.only(
                    top: 48,
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Color(0xff50BE91),
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    onPressed: () async {
                      // SnackBar(
                      //   content: Text("Sign in as EmailID"),
                      //   action: SnackBarAction(
                      //     label: "Done",
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   ),
                      // );
                      if (_formKey.currentState.validate()) {
                        final _prefs = await SharedPreferences.getInstance();
                        await _prefs.setString(
                            "password", _passwordController.text);
                        var name = _prefs.get("name");
                        var email = _prefs.get("email");
                        var password = _prefs.get("password");
                        BlocProvider.of<RegBloc>(context)
                          ..add(
                            RegPressed(
                              name: name,
                              email: email,
                              password: password,
                            ),
                          );
                        // _auth.createUserWithEmailAndPassword(
                        //     email: email, password: password);

                        _showSnack("Sign in as $email");
                      }
                      // Scaffold.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Sign in as EmailID"),
                      //     action: SnackBarAction(
                      //       label: "Done",
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   ),
                      // );
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
