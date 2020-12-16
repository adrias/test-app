import 'package:firebase_auth/firebase_auth.dart';

class LoginHelper {
  final _auth = FirebaseAuth.instance;
  void register(String name, String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
    _auth.currentUser != null
        ? print("UserCreated")
        : print("User not created");
  }

  void login(String email, String password) {
    _auth.signInWithEmailAndPassword(email: email, password: password);
    _auth.currentUser != null
        ? print('user LoggedIn')
        : print('user not loggedIn');
  }
}
