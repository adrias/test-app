import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authEvent.dart';
part 'authState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  final _auth = FirebaseAuth.instance;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is UserCheck) {
      yield AuthInitial();
      if (_auth.currentUser != null) {
        yield Authenticated();
      } else {
        yield NotAuthenticated();
      }
    }
    //   if (event is UserCheck) {
    //      AuthResult authResult = await FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: user.email, password: user.password)
    //     .catchError((error) => print(error.code));

    // if (authResult != null) {
    //   FirebaseUser firebaseUser = authResult.user;

    //   if (firebaseUser != null) {
    //     print("Log In: $firebaseUser");
    //     authNotifier.setUser(firebaseUser);
    //   }
    // }
    //   }
  }
}
