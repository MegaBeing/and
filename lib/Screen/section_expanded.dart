import 'package:and/Models/section.dart';
import 'package:and/Widget/Section_Expanded_Widgets/section_expanded_chart.dart';
import 'package:and/Widget/task.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class SectionExpanded extends StatefulWidget {
  const SectionExpanded(
      {super.key, required this.section, required this.completed});

  final SectionModel section;
  final void Function(TaskModel task) completed;

  @override
  State<SectionExpanded> createState() => _SectionExpandedState();
}

class _SectionExpandedState extends State<SectionExpanded> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.section.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SectionExpandedChart(section: widget.section, completed: widget.completed),
                SizedBox(width: 20,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final tasks in widget.section.taskList)
                        Task(task: tasks, completed: widget.completed),
                    ],
                  ),
                ),
              ],
            )
          ),
        );

  }
}