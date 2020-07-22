import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Screens/Authenticate/Authenticate.dart';
// import 'package:sreevaidyanatham/Screens/Authenticate/Register.dart';
// import 'package:sreevaidyanatham/Screens/Authenticate/Sign_in.dart';
import 'package:sreevaidyanatham/Screens/Home/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return wether home or authenticate!
    // return Authenticate();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
