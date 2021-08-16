import 'package:flutter/material.dart';
import 'package:gmaps_demo/Widgets/inputField.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _empId;
  String _passwd;

  final _formKey = GlobalKey<FormState>();
  static var counter = 1;
  bool obscure = true;
  bool obscureCount() {
    counter++;
    return counter % 2 != 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/icons/taxi.png'),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 4,
                ),
                /**
                 *    Email Field
                 */

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Emp ID",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fillColor: Color(0xffC4C4C4).withOpacity(.2),
                      filled: true,
                    ),
                    onChanged: (val) {
                      _empId = val;
                    },
                    onSaved: (val) {
                      _empId = val;
                    },
                    // ignore: missing_return
                    validator: (val) {
                      if (val.isEmpty) return 'Employee ID is Required';
                    },
                  ),
                ),

                /**
                 *    Password Field
                 */
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: counter % 2 == 0
                            ? Icon(Icons.panorama_fish_eye_outlined)
                            : Icon(Icons.circle),
                        onPressed: () {
                          setState(() {
                            obscure = obscureCount();
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    obscureText: obscure,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (val) {
                      _passwd = val;
                    },
                    onSaved: (val) {
                      _passwd = val;
                    },
                    // ignore: missing_return
                    validator: (val) {
                      if (val.isEmpty)
                        return 'Password is Required';
                      else if (val.length < 6)
                        return 'Password must be of length 6';
                    },
                  ), //Password Field Ends
                ),
                SizedBox(height: 30),
                MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0,
                      right: 40,
                      left: 40,
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Color(0xfff2400FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    // setState(() {
                    //   getData();
                    // });
                    if (_formKey.currentState.validate()) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account?"),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    var url = Uri.parse("http://10.0.2.2:5000/user/api/login");

    var req = await http.post(url, body: {
      "empId": _empId,
      "password": _passwd,
    });
    print(req.statusCode);
    if (req.statusCode == 200) {
      print(req.body);
    } else {
      print("Wrong Credentials.");
    }
  }
}
