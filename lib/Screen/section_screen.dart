import 'package:and/Widget/section.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class SectionScreen extends StatelessWidget {
  final List<TaskModel> section_1 = [
    TaskModel(id: '1', title: 'butter', description: 'bring butter', dateTime: DateTime.now(), priority: Priority.high)
  ];
  final List<TaskModel> section_2 = [];
  final List<TaskModel> section_3 = [];
  final List<TaskModel> section_4 = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var a = MediaQuery.of(context).viewInsets.horizontal;
    var b = MediaQuery.of(context).viewInsets.vertical;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Section(taskList: section_1, title: 'section 1'),
              const Spacer(),
              Section(taskList: section_1, title: 'section 2'),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Section(taskList: section_1, title: 'section 3'),
              const Spacer(),
              Section(taskList: section_1, title: 'section 4'),
            ],
          ),
        ],
      ),
    );
  }
}
