import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/bookings.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';
import 'package:sreevaidyanatham/Shared/loading_widget.dart';
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
    bool loading = true;

    Bookings currentuser = new Bookings();
    final bookings = Provider.of<List<Bookings>>(context);
    final user = Provider.of<User>(context);

    try {
      for (var bookings_itrated in bookings) {
        if (bookings_itrated.uid == user.uid) {
          print("yes machanne!");
          setState(() {
            currentuser = bookings_itrated;
            setState(() => loading = false);
          });
        }
      }
    } catch (e) {
      print(e);
    }
    return loading
        ? Loading()
        : Container(
            child: Center(child: Text(currentuser.uid)),
          );
  }
}
