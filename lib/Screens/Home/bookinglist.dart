import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Screens/Home/books.dart';
import 'package:sreevaidyanatham/Shared/loading_widget.dart';

class Bookinglist extends StatefulWidget {
  @override
  _BookinglistState createState() => _BookinglistState();
}

class _BookinglistState extends State<Bookinglist> {
  @override
  Widget build(BuildContext context) {
    bool loading = true;
    bool isempty = true;

    final bookings = Provider.of<Userdata>(context);
    final user = Provider.of<User>(context);

    try {
      if (bookings.uid == user.uid) {
        print(bookings);
        setState(() {
          setState(() {
            isempty = bookings.numberofbookings.isEmpty;
            loading = false;
          });
        });
      }
    } catch (e) {
      print(e);
    }
    if (isempty) {
      return loading
          ? Loading()
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Books(
                  books: null,
                );
              },
            );
    } else {
      return loading
          ? Loading()
          : ListView.builder(
              itemCount: bookings.numberofbookings.length,
              itemBuilder: (BuildContext context, int index) {
                return Books(books: bookings.numberofbookings[index]);
              },
            );
    }
  }
}
