import 'package:firebase_auth/firebase_auth.dart';
import 'package:sreevaidyanatham/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _fromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  //sign in with email and password

  //sign in anonymously

  Future SignInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      // print(result.toString());
      FirebaseUser user = result.user;
      // print(user);
      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  //signout

}
