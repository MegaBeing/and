import 'package:and/Models/section.dart';
import 'package:and/Widget/task.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class SectionExpanded extends StatefulWidget {
  const SectionExpanded(
      {super.key, required this.section, required this.completed});

  final SectionModel section;
  final void Function(TaskModel task) completed;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SectionExpandedState();
  }
}

class _SectionExpandedState extends State<SectionExpanded> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.section.title),),
      body: Center(
        child: Container(
          height: 1000,
          width: 1000,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.builder(itemCount: widget.section.taskList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 90),
              itemBuilder: (ctx, index) => Task(
                  task: widget.section.taskList[index],
                  completed: widget.completed),
            ),
          ),
        ),
      ),
    );
  }
}
