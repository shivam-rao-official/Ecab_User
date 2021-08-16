import 'package:flutter/material.dart';

Widget customDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            "acount name",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          accountEmail: Text(
            "mail.copm",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          decoration: BoxDecoration(color: Color(0xfffFFC700)),
        ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: TextButton(
        //     onPressed: () {},
        //     child: Text(
        //       "Add Vehicle",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed('/addDriver');
        //     },
        //     child: Text(
        //       "Add Driver",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(),
        Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/bookTrip');
            },
            child: Text(
              "Trip Booking",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(),
        Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(),
      ],
    ),
  );
}
