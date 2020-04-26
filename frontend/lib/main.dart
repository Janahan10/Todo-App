import 'package:flutter/material.dart';
import 'package:frontend/UI/ListComponent.dart';
import 'models/global.dart';
import 'UI/ListComponent.dart';

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

	static double minHeight = 300;
	static double maxHeight = 450;
	bool _isExtended = false;
	Offset _offset = Offset(0, minHeight);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				alignment: Alignment.topCenter,
				children: <Widget>[
					ListComponent(),
					GestureDetector (
						onPanUpdate: (details) {
							print(_offset.dy);
							print(_MyHomePageState.maxHeight);
							_offset = Offset(0, _offset.dy + details.delta.dy);
							if (_offset.dy < _MyHomePageState.minHeight) {
								_offset = Offset(0, _MyHomePageState.minHeight);
								_isExtended = false;
							} else if (_offset.dy > _MyHomePageState.maxHeight) {
								_offset = Offset(0, _MyHomePageState.maxHeight);
								_isExtended = true;
							}
							setState(() {});
						},
						child: AnimatedContainer (
							duration: Duration.zero,
							curve: Curves.easeOut,
							height: _offset.dy,
							alignment: Alignment.center,
							decoration: BoxDecoration(
								color: blueColor,
								boxShadow: [
									BoxShadow(color: Colors.grey.withOpacity(1),
										spreadRadius: 5, 
										blurRadius: 10,
									),
								],
								borderRadius: BorderRadius.only(
									bottomLeft: Radius.circular(30),
									bottomRight: Radius.circular(30),
								),
							),
						),
					),
				],
			),
		);
	}
}
	