import 'dart:math';

import 'package:and/Models/section.dart';
import 'package:and/Widget/Section_Widgets/Section_Expanded_Widgets/chart_bar.dart';
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
  int get maxTasks {
    int mx = max(max(widget.section.highTasks,widget.section.mediumTasks),widget.section.lowTasks);
    return mx;
  }
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
            height: 660,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                  ChartBar(
                    fill: maxTasks == 0
                        ? 0
                        :  widget.section.highTasks / maxTasks,
                  ),ChartBar(
                    fill: maxTasks == 0
                        ? 0
                        :  widget.section.mediumTasks / maxTasks,
                  ),ChartBar(
                    fill: maxTasks == 0
                        ? 0
                        :  widget.section.lowTasks / maxTasks,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                for (final priority in Priority.values)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      child: Text(priority.name),
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
