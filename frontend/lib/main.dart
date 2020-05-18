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
    _user.registerUser("username", "password123", "firstname", "lastname", "email@emailers.com");
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Text('Login Page Flutter Firebase  Content'),
      ),
    );
  }
}

Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    return await prefs.getString("API_Token");
 }
