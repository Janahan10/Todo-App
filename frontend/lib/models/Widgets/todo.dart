
import 'package:flutter/material.dart';
import 'package:frontend/models/global.dart';

class ToDo extends StatelessWidget {
  final String taskName;
  final String keyValue;
  ToDo({this.taskName, this.keyValue});
  
  @override
  Widget build(BuildContext context) {
    
    return Container (
      key: Key(keyValue),
      height: 108,
      width: 345,
      margin: EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10
      ),
      decoration: BoxDecoration (
        color: Colors.white,
        boxShadow: [
					BoxShadow(
            color: Colors.grey,
						spreadRadius: 2, 
            blurRadius: 5,
						offset: new Offset(3, 4)
					),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        )
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 32, 11),
            child: Text (
              taskName,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(65, 0, 32, 11),
            padding: EdgeInsets.fromLTRB(22, 1, 22, 1),
            decoration: BoxDecoration(
              color: subTasksColor,
            ),
            child: Text('3 Subtasks'),
          ),
        ],
      ) 
    );
  }
}