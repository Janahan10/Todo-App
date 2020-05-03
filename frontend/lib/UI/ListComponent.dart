import 'package:flutter/material.dart';
import 'package:frontend/classes/task.dart';
import 'package:frontend/models/Widgets/todo.dart';
import 'package:frontend/models/global.dart';


class ListComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListComponentState();
}
  
class _ListComponentState extends State<ListComponent> {
  List<Task> toDoList = [];
  @override
  Widget build(BuildContext context) {
    toDoList = getList();
    return Container (
      padding: EdgeInsets.only(top: 280),
      color: Colors.white,
      child: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, i) {
          return ListTile (
            title: ToDo(taskName: toDoList[i].title),
          );
        }

      ),
    );
  }

  List <Task> getList() {

    for (int i = 0; i < 5; i++) {
      toDoList.add(Task('Assignment' + (i+10).toString(), false, i.toString()));
    }
    return toDoList;
  }
}