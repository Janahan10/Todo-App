import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/blocs/userBloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/UI/LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}
  
class _SignupScreenState extends State<SignupScreen> {

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  

  UserBloc _user;
  User user;
  @override
  void initState() {
    super.initState();
    _user = UserBloc();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
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
                  Form (
                    key: _formkey,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(labelText: "First Name"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "First name is Required";
                          }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(labelText: "Last Name"),
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: "Email"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email is Required";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Username"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username is Required";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: passwordController,
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
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: FlatButton(
                            onPressed: () {
                              if(_formkey.currentState.validate()) {
                                user = _user.registerUser(
                                  usernameController.text, 
                                  passwordController.text, 
                                  firstNameController.text, 
                                  lastNameController.text, 
                                  emailController.text
                                );
                              }
                              if (user != null) {
                                saveApiKey(user);
                              }
                              
                            }, 
                            child: Text("Signup")
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                FlatButton (
                  onPressed: () {
                    Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }, 
                  child: Text("Login"))
              ],
            )
          ],
        ),
      ),
      )
    );
  }

  void saveApiKey(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('api_key', user.apiKey);
  }
}


