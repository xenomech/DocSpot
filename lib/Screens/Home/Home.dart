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
              height: height * .85,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30.0,
                      // spreadRadius: 3.0,
                      color: Colors.black)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 30.0, top: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Hi there",
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
                        padding: const EdgeInsets.only(right: 160.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  spreadRadius: 3.0,
                                  color: Colors.grey)
                            ],
                          ),
                          child: Text(
                            "Your Bookings :",
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Bookinglist(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 30, left: 60, right: 60),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => _showapointmentpanel(),
                  child: Ink(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10.0,
                            // spreadRadius: 5.0,
                            color: Colors.black)
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Book now !     ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
