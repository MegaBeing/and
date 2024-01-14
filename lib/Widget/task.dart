import 'package:flutter/material.dart';

import '../Models/task.dart';

class Task extends StatelessWidget {
  Task({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Card(
        child: Row(
          children: [
            Text('title'),
            SizedBox(
              width: 10,
            ),
            Text('DateTime')
          ],
        ),
      ),
    );
  }
}
