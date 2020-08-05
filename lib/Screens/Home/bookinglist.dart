import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/bookings.dart';
import 'package:sreevaidyanatham/Models/user.dart';
// import 'package:sreevaidyanatham/Services/databasemgmt.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Bookinglist extends StatefulWidget {
  Bookinglist({Key key}) : super(key: key);

  @override
  _BookinglistState createState() => _BookinglistState();
}

class _BookinglistState extends State<Bookinglist> {
  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<List<Bookings>>(context);
    final user = Provider.of<User>(context);
    return ListView.builder(itemCount:,)  //stuck machane!
    
  }
}
