import 'package:flutter/material.dart';
import 'package:sreevaidyanatham/Services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text("sign out"),
            onPressed: () async {
              await _auth.Signout();
            }),
      ),
    );
  }
}
