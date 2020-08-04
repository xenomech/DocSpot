import 'package:firebase_auth/firebase_auth.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creating a user model based on firebase user
  User _fromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
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
  Future signInAnon() async {
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
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      //create a document for the new user
      await DatabaseService(uid: user.uid)
          .updateUserData([null], 'name', [null], [null]);

      return _fromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
