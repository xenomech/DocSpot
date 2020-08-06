import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  final int books;
  Books({this.books});

  @override
  Widget build(BuildContext context) {
    if (books == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            title: Text("No bookings yet!"),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Text("$books"),
              ),
              title: Text("")),
        ),
      );
    }
  }
}
