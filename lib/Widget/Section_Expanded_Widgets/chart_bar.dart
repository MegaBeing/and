import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fillCompleted,
    required this.fillIncompleted,
  });

  final double fillIncompleted;
  final double fillCompleted;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        FractionallySizedBox(
          heightFactor: fillCompleted, // 0 <> 1
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
          ),
        ),
        SizedBox(width: 5,),
        FractionallySizedBox(
          heightFactor: fillIncompleted, // 0 <> 1
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
