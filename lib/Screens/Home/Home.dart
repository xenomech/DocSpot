import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/bookings.dart';
import 'package:sreevaidyanatham/Screens/Home/bookinglist.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';
// import 'package:sreevaidyanatham/Services/auth.dart';
// import 'package:sreevaidyanatham/Screens/UserScreen/userScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    // final bookings = Provider.of<QuerySnapshot>(context);
    // print(bookings);
    return StreamProvider<List<Bookings>>.value(
      value: DatabaseService().bookings,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Bookinglist(),
          ),
        ),
      ),
    );
  }
}
