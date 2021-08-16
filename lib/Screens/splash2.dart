import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFFF5D0),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/icons/taxi.png'),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'eCab',
              style: TextStyle(
                fontFamily: "Satisfy",
                fontSize: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}


/**
 * 
 Center(
          child: Image(
            image: AssetImage('assets/icons/taxi.png'),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
 */