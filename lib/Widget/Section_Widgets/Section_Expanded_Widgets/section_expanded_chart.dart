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
    int mx = max(max(widget.section.highTasks, widget.section.mediumTasks),
        widget.section.lowTasks);
    return mx;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: width / 2.3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff87e54c),
            Color(0xff5fe2e2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height - 170,
            padding: const EdgeInsets.only(
              top: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ChartBar(color: priorityColor[Priority.high]!,
                  fill: maxTasks == 0 ? 0 : widget.section.highTasks / maxTasks,
                ),
                ChartBar(
                  color: priorityColor[Priority.medium]!,
                  fill:
                      maxTasks == 0 ? 0 : widget.section.mediumTasks / maxTasks,
                ),
                ChartBar(
                  color: priorityColor[Priority.low]!,
                  fill: maxTasks == 0 ? 0 : widget.section.lowTasks / maxTasks,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    margin: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: priorityColor[Priority.high]!.withOpacity(.9),
                    ),
                    alignment: Alignment.center,
                    child: Text('High'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    margin: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: priorityColor[Priority.medium]!.withOpacity(.9),
                    ),
                    alignment: Alignment.center,
                    child: Text('Medium'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    margin: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: priorityColor[Priority.low]!.withOpacity(.9),
                    ),
                    alignment: Alignment.center,
                    child: Text('Low'),
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
