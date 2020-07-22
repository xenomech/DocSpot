import 'package:flutter/material.dart';
import 'package:sreevaidyanatham/Screens/Authenticate/Register.dart';
// import 'package:sreevaidyanatham/Screens/Authenticate/Register.dart';
import 'package:sreevaidyanatham/Services/auth.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // TextField setup
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, top: 150.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ".",
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Container(
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      "Enter Email and Password to Login",
                      style: TextStyle(
                          fontSize: 15.0, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20.0,
                              // spreadRadius: 3.0,
                              color: Colors.grey.shade400)
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) => value.contains('.com')
                                  ? null
                                  : 'Pls provide a valid E-Mail',
                              onChanged: (value) {
                                setState(() => email = value);
                              },
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) => value.length > 8
                                  ? null
                                  : 'Password must be more than 8 charachters',
                              onChanged: (value) {
                                setState(() => password = value);
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            print(email);
                          }
                        },
                        child: Ink(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  // spreadRadius: 3.0,
                                  color: Colors.grey.shade400)
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Dont Have an Account ?",
                      style: TextStyle(
                          fontSize: 15.0, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Ink(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  // spreadRadius: 3.0,
                                  color: Colors.grey.shade400)
                            ],
                            // color: Colors.white,
                          ),
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              // color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.green),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[],
                ))
          ],
        ),
      ),
    );
  }
}
