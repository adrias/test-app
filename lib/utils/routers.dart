import 'package:flutter/material.dart';
import 'package:parentive/screens/email_login_1.dart';
import 'package:parentive/screens/forgot_password.dart';
import 'package:parentive/screens/homepage.dart';
import 'package:parentive/screens/login_main_1.dart';
import 'package:parentive/screens/signup_email.dart';
import 'package:parentive/screens/signup_name.dart';
import 'package:parentive/screens/signup_password.dart';
import 'package:parentive/screens/singup_info.dart';
import 'package:parentive/screens/sliders_1.dart';
import 'package:parentive/screens/splashScreen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case 'onBoarding':
        return MaterialPageRoute(builder: (_) => OnBoarding());
        break;
      case 'Login':
        return MaterialPageRoute(builder: (_) => LoginMain());
        break;
      case 'Signup':
        return MaterialPageRoute(builder: (_) => SignUp());
        break;
      case 'EmailLogin':
        return MaterialPageRoute(builder: (_) => EmailLogin());
        break;
      case 'ForgotPassword':
        return MaterialPageRoute(builder: (_) => ForgotPassword());
        break;
      case 'HomePage':
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case 'SignUpName':
        return MaterialPageRoute(builder: (_) => SignUpName());
        break;
      case 'SingUpEmail':
        return MaterialPageRoute(builder: (_) => SignUpEmail());
        break;
      case 'SignUpPassword':
        return MaterialPageRoute(builder: (_) => SignUpPassword());
        break;
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          );
        });
    }
  }
}
