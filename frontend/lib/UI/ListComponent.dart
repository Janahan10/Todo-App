import 'package:flutter/material.dart';
import 'package:frontend/models/Widgets/todo.dart';
import 'package:frontend/models/global.dart';


class ListComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListComponentState();
}
  
class _ListComponentState extends State<ListComponent> {
  List<ToDo> toDoList = [];
  @override
  Widget build(BuildContext context) {
    toDoList = getList();
    return Container (
      color: Colors.white,
      child: _buildReorderableListSimple(context),
    );
  }

  Widget _buildListTile(BuildContext context, ToDo item) {
    return ListTile (
      key: Key(item.keyValue),
      title: Text(item.taskName),
    );
  }

  Widget _buildReorderableListSimple(BuildContext context) {

    return ReorderableListView (
      padding: EdgeInsets.only(
        top: 10.0
      ),
      children: toDoList.map((ToDo item) => _buildListTile(context, item)).toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          ToDo item = toDoList[oldIndex];
          toDoList.remove(item);
          toDoList.insert(newIndex, item);
        });
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ToDo item = toDoList.removeAt(oldIndex);
      toDoList.insert(newIndex, item);
    });
  } 

  List <Widget> getList() {

    for (int i = 0; i < 10; i++) {
      toDoList.add(ToDo(keyValue: i.toString(), taskName: "Data Structures Assignment 1"));
    }
    return toDoList;
  }
}





