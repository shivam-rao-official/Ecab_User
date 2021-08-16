import 'package:flutter/material.dart';
import 'package:gmaps_demo/Screens/Login/loginScreen.dart';
import 'package:gmaps_demo/Screens/SignUp/signup.dart';
import 'package:gmaps_demo/Screens/bookingPage.dart';
import 'package:gmaps_demo/Screens/homecreen.dart';
import 'package:gmaps_demo/Screens/splash.dart';
import 'package:gmaps_demo/Screens/splash2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      routes: <String, WidgetBuilder>{
        '/splash2': (BuildContext ctxt) => Splash2(),
        '/login': (BuildContext ctxt) => LoginScreen(),
        '/signup': (BuildContext ctxt) => SignupScreen(),
        '/home': (BuildContext ctxt) => HomeScreen(),
        '/bookTrip': (BuildContext ctxt) => TripBooking(),
      },
      home: Splash(),
    );
  }
}
