import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gmaps_demo/Widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _empId;
  var _name;

  Future getEmpId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _empId = prefs.getString('EmpID');
    _name = prefs.getString('Name');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmpId();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Trip Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Satisfy",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: customDrawer(context, _name, _empId),
      body: RefreshIndicator(
        onRefresh: refreshData,
        backgroundColor: Colors.black87,
        strokeWidth: 3,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (snapshot.hasError)
              return Center(
                child: Text('Oops Error Occured'),
              );
            else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.amber[50],
                      title: Row(
                        children: [
                          Row(
                            children: [
                              Text("Origin ->"),
                              SizedBox(width: 10),
                              Text(snapshot.data[index]['origin']),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text("Destination ->"),
                              SizedBox(width: 10),
                              Text(snapshot.data[index]['destination']),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Row(
                            children: [
                              Text("Employee ID ->"),
                              SizedBox(width: 10),
                              Text(snapshot.data[index]['empId']),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text("Raised Date ->"),
                              SizedBox(width: 10),
                              Text(snapshot.data[index]['createdAt']),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
          },
          future: retrieveData(),
        ),
      ),
    );
  }

  Future<void> refreshData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    setState(() {
      retrieveData();
    });
  }

  Future<void> retrieveData() async {
    var res = await Dio().post(
        'https://cab-server.herokuapp.com/trip/viewTrips',
        data: {"empId": _empId});

    return res.data["msg"];
  }
}
