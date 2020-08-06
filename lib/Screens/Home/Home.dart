import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Screens/Home/bookinglist.dart';
import 'package:sreevaidyanatham/Services/databasemgmt.dart';
import 'package:sreevaidyanatham/Services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showuserspanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton.icon(
                      color: Colors.red,
                      onPressed: () {
                        _auth.signout();
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.exit_to_app),
                      label: Text("Sign out"))
                ],
              ),
            );
          });
    }

    final user = Provider.of<User>(context);

    return StreamProvider<Userdata>.value(
      value: DatabaseService(uid: user.uid).userdata,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30.0, top: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hi there !",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _showuserspanel(),
                    child: Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Bookinglist(),
          ],
        ),
      ),
    );
  }
}
