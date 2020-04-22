import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static double _minHeight = 300;
  static double _maxHeight = 800;
  bool _isExtended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        height: _minHeight,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35)
          ),
          color: Color(0xFF0579FF),
        ),
      ),
    );
  }
}
