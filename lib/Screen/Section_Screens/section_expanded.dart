import 'package:and/Models/section.dart';
import 'package:and/Widget/Task_Widgets/task.dart';
import 'package:flutter/material.dart';

import '../../Models/task.dart';
import '../../Widget/Section_Widgets/Section_Expanded_Widgets/section_expanded_chart.dart';

class SectionExpanded extends StatefulWidget {
  const SectionExpanded(
      {super.key, required this.section, required this.onRemove});

  final SectionModel section;
  final void Function(TaskModel task) onRemove;

  @override
  State<SectionExpanded> createState() => _SectionExpandedState();
}

class _SectionExpandedState extends State<SectionExpanded> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SectionExpandedChart(
                section: widget.section, completed: widget.onRemove),
            widget.section.taskList.length > 1
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        for (final tasks in widget.section.taskList)
                          Dismissible(
                            key: ValueKey(tasks),
                            background: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                            ),
                            onDismissed: (dir) {
                              widget.onRemove(tasks);
                            },
                            child: Task(
                              task: tasks,
                              completed: widget.onRemove,
                              section: widget.section,
                            ),
                          )
                      ],
                    ),
                  )
                : Container(
              width: 500,
                    alignment: Alignment.center,
                    child: const Text('Empty'),
                  )
          ],
        ),
      ),
    );
  }
}
