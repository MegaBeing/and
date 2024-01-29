import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Widget/section.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class SectionScreen extends StatelessWidget {
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
              Section(taskList: tasks, title: 'section 1'),
              const Spacer(),
              Section(taskList: tasks, title: 'section 2'),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Section(taskList: tasks, title: 'section 3'),
              const Spacer(),
              Section(taskList: tasks, title: 'section 4'),
            ],
          ),
        ],
      ),
    );
  }
}
