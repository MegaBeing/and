import 'package:and/Models/section.dart';
import 'package:and/Widget/Section_Expanded_Widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:and/Models/task.dart';

class SectionExpandedChart extends StatefulWidget {
  const SectionExpandedChart(
      {super.key, required this.section, required this.completed});

  final SectionModel section;
  final void Function(TaskModel task) completed;

  @override
  State<SectionExpandedChart> createState() {
    // TODO: implement createState
    return _SectionExpandedChartState();
  }
}

class _SectionExpandedChartState extends State<SectionExpandedChart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: 600,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height:660,
            child: Row(
              children: [
                for (final priority in Priority.values)
                  ChartBar(
                    fillCompleted: widget.section.totalTasks == 0
                        ? 0
                        : completedTask[priority]! / widget.section.totalTasks,
                    fillIncompleted: widget.section.totalTasks == 0
                        ? 0
                        : incompletedTask[priority]! /
                            widget.section.totalTasks,
                  )
              ],
            ),
          ),
          SizedBox(
            height:50,
            child: Row(
              children: [
                for (final priority in Priority.values)
                  Expanded(
                    child: Column(
                      children: [
                        Text(priority.name),
                        const SizedBox(height:10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('completed'),
                            Text('uncompleted'),
                          ],
                        )
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
