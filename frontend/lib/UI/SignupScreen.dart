import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/blocs/userBloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}
  
class _SignupScreenState extends State<SignupScreen> {
  UserBloc _user;

  @override
  void initState() {
    super.initState();
    _user = UserBloc();
  }

  @override
  Widget build(BuildContext context) {
    _user.registerUser("userna323123me", "password123", "firstname", "lastname", "email@ghasdks.com");
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(bottom: 50.0, top: 75.0),
              padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
              decoration: BoxDecoration (
                color: Colors.white,
                border: Border.all(width: 2.0, color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 0.0,
                    offset: Offset(
                      10.0,
                      10.0
                    ),
                  ),
                ]
              ),
              child: Text(
                "Day at a Glance", 
                style: 
                  GoogleFonts.oswald(
                    textStyle: TextStyle(
                      fontSize: 32.0, 
                      letterSpacing: 5
                    )
                  ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Signup",
              style: GoogleFonts.oswald(
                textStyle: TextStyle(
                  fontSize: 30,
                  letterSpacing: 5
                ),
              ),
            ),
            Container (
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration (
                color: Colors.white,
                border: Border.all(width: 2.0, color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 0.0,
                    offset: Offset(
                      10.0,
                      10.0
                    ),
                  ),
                ]
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "First Name"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Last Name"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Username"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1.25, color: Colors.black) ),
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: FlatButton(
                      onPressed: () {}, 
                      child: Text("Signup")
                    ),
                  ),
                ],
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                FlatButton (
                  onPressed: () {}, 
                  child: Text("Login"))
              ],
            )
          ],
        ),
      ),
      )
    );
  }
}

Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    return await prefs.getString("API_Token");
 }
