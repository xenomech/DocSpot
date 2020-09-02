import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    var width = MediaQuery.of(context).size.width;

    void _showapointmentpanel() {
      String _name;
      String _date;
      String _time;
      String _doctor;

      showModalBottomSheet(
          elevation: 5,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (context) {
            return Container(
              height: height * .75,
              child: StreamBuilder<Userdata>(
                  stream: DatabaseService(uid: user.uid).userdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 4,
                            width: 5,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              child: Column(
                            children: [
                              Container(
                                width: width * .75,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlatButton.icon(
                                      onPressed: () => showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2021)),
                                      icon: Icon(Icons.calendar_today),
                                      label: Text(" Pick date ")),
                                  FlatButton.icon(
                                      onPressed: () => showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()),
                                      icon: Icon(Icons.access_time),
                                      label: Text(" Pick time "))
                                ],
                              )
                            ],
                          ))
                        ],
                      );
                    } else {
                      return Container();
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
                        padding: const EdgeInsets.only(right: 170.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 5.0,
                            //       spreadRadius: 3.0,
                            //       color: Colors.grey)
                            // ],
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
                padding: EdgeInsets.only(top: 30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => _showapointmentpanel(),
                  child: Ink(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 100.0,
                            // spreadRadius: 5.0,
                            color: Colors.black)
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
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
