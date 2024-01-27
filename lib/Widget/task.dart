import 'package:flutter/material.dart';

import '../Models/task.dart';

class Task extends StatelessWidget {
  const Task({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Container(
        height:119,
        child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
          ),
          semanticContainer: true,
          margin: const EdgeInsets.only(top:20,left: 20,right:20,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}
