import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreevaidyanatham/Models/user.dart';
import 'package:sreevaidyanatham/Screens/wrapper.dart';
import 'package:sreevaidyanatham/Services/auth.dart';
import 'package:sreevaidyanatham/Shared/loading_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.lightGreen,
          accentColor: Colors.lightGreenAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: splashscr(),
      ),
    );
  }
}

class splashscr extends StatefulWidget {
  splashscr({Key key}) : super(key: key);

  @override
  _splashscrState createState() => _splashscrState();
}

class _splashscrState extends State<splashscr> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Image.asset('Assets/Images/logo.png'), Loading()],
        ),
      ),
    );
  }
}
