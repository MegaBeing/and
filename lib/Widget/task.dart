import 'dart:async';

import 'package:and/Calculations/time_to_timer.dart';
import 'package:and/Widget/date_on_task.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class Task extends StatefulWidget {
  Task({super.key, required this.task});

  final TaskModel task;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double _timerWidthPercentage = 0;
  late Duration _durationLeft;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      // Update the widget content
      setState(() {
        _timerWidthPercentage = TimerConfig().percentage(
          TimerConfig().differenceInt(
            DateTime.now(),
            widget.task.endDateTime,
          ),
          TimerConfig().differenceInt(
            widget.task.startDateTime,
            widget.task.endDateTime,
          ),
        );
        _durationLeft = TimerConfig()
            .differenceDuration(DateTime.now(), widget.task.endDateTime);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(5),
      height: 90,
      width: 500,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 15, blurStyle: BlurStyle.outer),
        ],
        borderRadius: BorderRadius.circular(90),
        color: Colors.black,
      ),
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          Container(
            height: 90,
            margin: const EdgeInsets.all(0),
            width: 500 * _timerWidthPercentage,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: priorityColor[widget.task.priority],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateOnTask(date: widget.task.startDateTime,),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(23)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    widget.task.title,
                    style: const TextStyle(color: Colors.white,
                    fontSize: 24),
                  ),
                ),
              ),
              DateOnTask(date: widget.task.endDateTime,),
            ],
          )
        ],
      ),
    );
  }
}
