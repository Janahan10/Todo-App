import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/blocs/userBloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'ToDo App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: LoginScreen(),
		);
	}
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}
  
class _LoginScreenState extends State<LoginScreen> {
  UserBloc _user;

  @override
  void initState() {
    super.initState();
    _user = UserBloc();
  }

  @override
  Widget build(BuildContext context) {
    // _user.registerUser("userna323123me", "password123", "firstname", "lastname", "email@ghasdks.com");
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(bottom: 75.0, top: 100.0),
              padding: const EdgeInsets.fromLTRB(75, 25, 75, 25),
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
                style: TextStyle(fontSize: 32.0),
                textAlign: TextAlign.center,
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
                    decoration: InputDecoration(labelText: "Username / Email"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20.0),
                    child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {}, 
                      child: Text("Login")
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    ),
                  ),
                ],
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                FlatButton (onPressed: () {}, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    return await prefs.getString("API_Token");
 }
