import 'package:flutter/material.dart';
import 'package:frontend/UI/SignupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/blocs/userBloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _user.registerUser("userna323123me", "password123", "firstname", "lastname", "email@ghasdks.com");
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center (
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(bottom: 50.0, top: 20.0),
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
              "Login",
              style: GoogleFonts.oswald(
                textStyle: TextStyle(
                  fontSize: 30, 
                  letterSpacing: 5
                )
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
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: "Username / Email"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username / Email is Required";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Password"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password is Required";
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(width: 1.25, color: Colors.black) ),
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20.0),
                          child: FlatButton(
                            onPressed: () {
                              if(_formkey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                              }
                            }, 
                            child: Text("Login")
                          ),
                        ),
                      ],
                    )
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
                FlatButton (onPressed: () {
                  Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                }, child: Text("Sign Up"))
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
