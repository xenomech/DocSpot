import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/bookings.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bookinglist extends StatefulWidget {
  bookinglist({Key key}) : super(key: key);

  @override
  _bookinglistState createState() => _bookinglistState();
}

class _bookinglistState extends State<bookinglist> {
  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<List<Bookings>>(context);
    bookings.forEach((element) {
      print("uid" + element.uid);
      print("name" + element.name);
      print("date");
      print(element.date);
      print("time");
      print(element.time);
      print("numberofbookings");
      print(element.numberofbookings);
    });

    return Container();
  }
}
