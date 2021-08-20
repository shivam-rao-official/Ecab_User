import 'package:flutter/material.dart';
import 'package:gmaps_demo/Screens/Login/loginScreen.dart';
import 'package:gmaps_demo/Screens/SignUp/signup.dart';
import 'package:gmaps_demo/Screens/bookingPage.dart';
import 'package:gmaps_demo/Screens/homecreen.dart';
import 'package:gmaps_demo/Screens/splash.dart';
import 'package:gmaps_demo/Screens/splash2.dart';
import 'package:gmaps_demo/Screens/tripSummary.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var EmpID = prefs.getString('EmpID');
  var PhoneNum = prefs.getString('PhoneNum');
  var Name = prefs.getString('Name');
  var uid = prefs.getString('UID');
  runApp(MyApp(uid: EmpID));
}

class MyApp extends StatelessWidget {
  final String uid;

  MyApp({@required this.uid});
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
        '/tripSummary': (BuildContext ctxt) => TripSummary()
      },
      home: Splash(),
    );
  }
}
