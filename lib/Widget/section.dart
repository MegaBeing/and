import 'package:and/Models/section.dart';
import 'package:and/Screen/add_task.dart';
import 'package:and/Widget/task.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

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
  void _addTask() async {
    final data = await Navigator.of(context).push<TaskModel>(
      MaterialPageRoute(
        builder: (ctx) => AddTask(),
      ),
    );
    widget.section.taskList.add(data!);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(27),
      child: InkWell(
          onTap: () {},
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
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: 10),
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
                  Task(task: widget.section.taskList[0]),
                  Task(task: widget.section.taskList[1]),
                ] else if (widget.section.taskList.length == 1)
                  Task(task: widget.section.taskList[0])
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
