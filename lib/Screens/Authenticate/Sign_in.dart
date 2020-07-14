import 'package:flutter/material.dart';
import 'package:sreevaidyanatham/Services/auth.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("signinanonymously"),
          onPressed: () async {
            dynamic result = await _auth.SignInAnon();
            if (result == null) {
              print("sign in error");
            } else {
              print("signed in");
              // print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
