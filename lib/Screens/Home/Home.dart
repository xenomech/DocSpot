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

    void _showappointmentpanel() {
      final bookings = Provider.of<Userdata>(context);

      String _name;
      DateTime _date;

      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: bookings.name,
                      onChanged: (value) => _name = value,
                    ),
                    // TextFormField(
                    //   onTap: () {
                    //     showDatePicker(
                    //             context: context,
                    //             initialDate: DateTime.now(),
                    //             firstDate: DateTime.now(),
                    //             lastDate: DateTime(2021))
                    //         .then((value) => _date = value);
                    //   },
                    //   initialValue: _date.toString(),
                    // ),
                    Text("$_name"),
                    Text(_date.toString()),
                  ],
                ),
              ),
            );
          });
    }

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
            Container(
              height: 300,
              child: Bookinglist(),
            ),
            RaisedButton(
              child: Text("tryout"),
              onPressed: () => _showappointmentpanel(),
            )
          ],
        ),
      ),
    );
  }
}
