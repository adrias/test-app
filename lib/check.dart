import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parentive/Bloc/auth/authBloc.dart';
import 'package:parentive/screens/homepage.dart';
import 'package:parentive/screens/sliders_1.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Authenticated) {
          return HomePage();
        } else {
          return OnBoarding();
        }
      },
    );
  }
}
