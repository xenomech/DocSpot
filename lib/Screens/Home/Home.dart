import 'package:flutter/material.dart';
import 'package:sreevaidyanatham/Services/auth.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String _bookedtime = "hi there";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Text(_bookedtime),
        RaisedButton(
          onPressed: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
                (value) => {setState(() => _bookedtime = value.toString())});
          },
        )
      ],
    ));
  }
}

//  onPressed: () async {
//         await _auth.Signout();
