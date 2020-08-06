import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';

class Appointment extends StatefulWidget {
  Appointment({Key key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Userdata>(
      stream: DatabaseService(uid: user.uid).userdata,
      builder: (context, snapshot) {},
    );
  }
}
