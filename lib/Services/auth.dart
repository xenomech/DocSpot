import 'package:firebase_auth/firebase_auth.dart';
import 'package:sreevaidyanatham/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creating a user model based on firebase user
  User _fromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, name: user.displayName) : null;
  }

  // Auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _fromfirebaseuser(user));
  }

  // sign in with email and password

  Future signinwithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in anonymously
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

  // register with email and password

  Future registerwithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signout
  Future Signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
