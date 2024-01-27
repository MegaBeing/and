import 'package:and/Widget/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/task_data.dart';
import '../Models/task.dart';

class Section extends StatefulWidget {
  Section({super.key, required this.taskList, required this.title});

  final List<TaskModel> taskList;
  final String title;

  @override
  State<Section> createState() {
    // TODO: implement createState
    return _SectionState();
  }
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 350,
        width: 550,
        decoration: BoxDecoration(
          color: const Color(0xffa32a2a),
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Task(task: tasks[0]),
          Task(task: tasks[0])
        ]),
      ),
    );
  }
}
