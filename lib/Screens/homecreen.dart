import 'package:flutter/material.dart';
import 'package:gmaps_demo/Widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {}

  Future<void> refreshData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      drawer: customDrawer(context),
      body: RefreshIndicator(
        onRefresh: refreshData,
        backgroundColor: Colors.black87,
        strokeWidth: 3,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
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
                      title: Text(snapshot.data[index]['title']),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
          },
          future: getData(),
        ),
      ),
    );
  }
}
/*
 Future<void> refreshData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.amber[400],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        backgroundColor: Colors.black87,
        strokeWidth: 3,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
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
                      title: Text(snapshot.data[index]['title']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenNotes(
                              id: snapshot.data[index]['_id'],
                            ),
                          ),
                        );
                      },
                      trailing: IconButton(
                        onPressed: () {
                          deleteData(snapshot.data[index]['_id']);
                          setState(() {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${snapshot.data[index]['title']} deleted',
                                ),
                              ),
                            );
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            }
          },
          future: getData(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber[400],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return NewNotes();
              },
            ),
          );
        },
        label: Text(
          'Create',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        icon: Icon(
          Icons.edit_outlined,
          color: Colors.black87,
        ),
      ),
    );
 */