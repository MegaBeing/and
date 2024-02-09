import 'package:and/Models/section.dart';
import 'package:and/Screen/add_task.dart';
import 'package:and/Screen/Section_Screens/section_expanded.dart';
import 'package:and/Widget/Task_Widgets/task.dart';
import 'package:flutter/material.dart';

import '../../Models/task.dart';

class Section extends StatefulWidget {
  const Section({super.key, required this.section, required this.title});

  final SectionModel section;
  final String title;

  @override
  State<Section> createState() {
    // TODO: implement createState
    return _SectionState();
  }
}

class _SectionState extends State<Section> {
  void _sectionOnTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SectionExpanded(
          section: widget.section,
          completed: _removeTask,
        ),
      ),
    );
  }

  void _removeTask(TaskModel task) {
    setState(() {
      switch (task.priority.name) {
        case 'high':
          {
            widget.section.highTasks--;
          }
          break;
        case 'medium':
          {
            widget.section.mediumTasks--;
          }
          break;
        case 'low':
          {
            widget.section.lowTasks--;
          }
          break;
      }
      widget.section.taskList.remove(task);
    });
  }

  void _addTask() async {
    final data = await Navigator.of(context).push<TaskModel>(
      MaterialPageRoute(
        builder: (ctx) => AddTask(),
      ),
    );
    setState(() {
      switch (data!.priority.name) {
        case 'high':
          {
            widget.section.highTasks++;
          }
          break;
        case 'medium':
          {
            widget.section.mediumTasks++;
          }
          break;
        case 'low':
          {
            widget.section.lowTasks++;
          }
          break;
      }
      widget.section.taskList.add(data);
      widget.section.taskList.sort(
        (a, b) => a.endDateTime.difference(a.startDateTime).compareTo(
              b.endDateTime.difference(b.startDateTime),
            ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(27),
      child: InkWell(
        onTap: _sectionOnTap,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: BoxDecoration(
            color: widget.section.color,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _addTask,
                      child: const Icon(Icons.add_card),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (widget.section.taskList.length > 1) ...[
                Dismissible(
                  key: ValueKey(widget.section.taskList[0]),
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                  ),
                  onDismissed: (dir) {
                    _removeTask(widget.section.taskList[0]);
                  },
                  child: Task(
                    task: widget.section.taskList[0],
                    completed: _removeTask,
                    section: widget.section,
                  ),
                ),
                Dismissible(
                  key: ValueKey(widget.section.taskList[1]),
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                  ),
                  onDismissed: (dir) {
                    _removeTask(widget.section.taskList[1]);
                  },
                  child: Task(
                    task: widget.section.taskList[1],
                    completed: _removeTask,
                    section: widget.section,
                  ),
                ),
              ] else if (widget.section.taskList.length == 1)
                Dismissible(
                  key: ValueKey(widget.section.taskList[0]),
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                  ),
                  onDismissed: (dir) {
                    _removeTask(widget.section.taskList[0]);
                  },
                  child: Task(
                    task: widget.section.taskList[0],
                    completed: _removeTask,
                    section: widget.section,
                  ),
                )
              else
                const Center(
                  child: Text("Empty"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
