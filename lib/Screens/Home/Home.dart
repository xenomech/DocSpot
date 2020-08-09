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
    final user = Provider.of<User>(context);
    var height = MediaQuery.of(context).size.height;

    void _showapointmentpanel() {
      String _name;
      String _date;
      String _time;
      String _doctor;

      showModalBottomSheet(
          elevation: 5,
          context: context,
          builder: (context) {
            return Container(
              height: 1000,
              child: StreamBuilder<Userdata>(
                  stream: DatabaseService(uid: user.uid).userdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(onChanged: (value) => _name = value),
                            Text("$_name"),
                            Text(_date.toString()),
                          ],
                        ),
                      );
                    }
                  }),
            );
          });
    }

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

    return StreamProvider<Userdata>.value(
      value: DatabaseService(uid: user.uid).userdata,
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Container(
              height: height * .90,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20.0,
                        // spreadRadius: 3.0,
                        color: Colors.black)
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              child: Column(
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
                    height: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 175.0),
                        child: Text(
                          "Your Bookings :",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: Bookinglist(),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text("tryout"),
                    onPressed: () => _showapointmentpanel(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
