import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parentive/Bloc/login/loginBloc.dart';
import 'package:parentive/screens/forgot_password.dart';
import 'package:parentive/screens/homepage.dart';
import 'package:parentive/screens/singup_info.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final RegExp passRegex =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])[a-zA-Z0-9](?=.*[!@#\$%-_^&*~]).{8,}$');
  String _email, _password;
  final auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.only(
                      top: 6,
                      bottom: 32,
                    ),
                    child: Text(
                      "Login with your email",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter valid email address';
                    } else if (value.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    hintText: 'Enter your email address',
                  ),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                // SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (!passRegex.hasMatch(value)) {
                      return 'Password must contain "8 Character Password with lowercase, uppercase letters, numbers and at least one lowercase letter and one uppercase letter"';
                    } else if (value.isEmpty) {
                      return 'Password field cannot be empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintMaxLines: 4,
                    hintText:
                        'Password must contain "8 Character Password with lowercase, uppercase letters, numbers and at least one lowercase letter and one uppercase letter"',
                  ),
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'ForgotPassword', (route) => false);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ForgotPassword(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 24,
                      bottom: 48,
                    ),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff50BE91),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.only(
                    bottom: 180,
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff50BE91),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    onPressed: () {
                      try {
                        if (_formKey.currentState.validate()) {
                          // auth
                          //     .signInWithEmailAndPassword(
                          //         email: _email, password: _password)
                          //     .then((value) {
                          //   CircularProgressIndicator();
                          // });

                          BlocProvider.of<LoginBloc>(context)
                            ..add(
                              LoginPressed(email: _email, password: _password),
                            );
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'HomePage', (route) => false);
                        }
                      } catch (e) {
                        print(e);
                        _showSnack(e);
                      }
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
      ),
    );
  }
}
