import 'package:flutter/material.dart';
// import 'package:sreevaidyanatham/Services/auth.dart';
import 'package:sreevaidyanatham/Screens/UserScreen/userScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final AuthService _auth = AuthService();
  String _bookedtime = "hi there";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          children: <Widget>[
            Text("Hi there !"),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserScreen()),
                );
              },
            ),
          ],
        ),
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
