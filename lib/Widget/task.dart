import 'package:and/Calculations/time_to_timer.dart';
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

  @override
  Widget build(BuildContext context) {
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
    Duration durationLeft =  TimerConfig().differenceDuration(DateTime.now(), widget.task.endDateTime);
    String durationString = '${durationLeft.inMinutes} : ${durationLeft.inSeconds.remainder(60)}';
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 500,
            ),
            Container(
              height: 100,
              width: 500 * _timerWidthPercentage,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
            Container(
              height: 100,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      widget.task.title,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const Spacer(
                  ),
                  Card(
                    margin: EdgeInsets.only(right: 40),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        durationString,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
