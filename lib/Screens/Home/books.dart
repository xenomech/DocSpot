import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  final int books;
  final String doctor;
  final String time;
  final String date;
  Books({this.books, this.doctor, this.time, this.date});

  @override
  Widget build(BuildContext context) {
    if (books == null) {
      return Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text("No bookings yet!"),
        ),
      );
    } else {
      return Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.greenAccent[100],
            radius: 25.0,
            child: Text(
              "$books",
              style: TextStyle(color: Colors.black),
            ),
          ),
          title: Text(
            "$doctor",
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          subtitle: Text("Date : $date\nTime : $time",
              style: TextStyle(
                fontSize: 15,
              )),
        ),
      );
    }
  }
}
