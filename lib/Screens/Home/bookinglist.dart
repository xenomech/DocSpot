import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Screens/Home/books.dart';
// import 'package:sreevaidyanatham/Services/databasemgmt.dart';
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
    bool emptyornot = true;

    final bookings = Provider.of<Userdata>(context);
    final user = Provider.of<User>(context);

    try {
      if (bookings.uid == user.uid) {
        print(bookings);
        setState(() {
          setState(() => emptyornot = bookings.numberofbookings.isEmpty);
          setState(() => loading = false);
        });
      }
    } catch (e) {
      print(e);
    }
    if (emptyornot) {
      return loading
          ? Loading()
          : new Expanded(
              child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Books(
                  books: null,
                );
              },
            ));
    } else {
      return loading
          ? Loading()
          : new Expanded(
              child: ListView.builder(
              itemCount: bookings.numberofbookings.length,
              itemBuilder: (BuildContext context, int index) {
                return Books(books: bookings.numberofbookings[index]);
              },
            ));
    }
  }
}
//  Container(
//             padding: EdgeInsets.all(20),
//             width: 320,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                     blurRadius: 20.0,
//                     // spreadRadius: 3.0,
//                     color: Colors.grey.shade400)
//               ],
//             ),)
