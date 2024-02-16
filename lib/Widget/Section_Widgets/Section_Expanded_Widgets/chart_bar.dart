import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.color,
    required this.fill,
  });

  final Color color;
  final double fill;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: FractionallySizedBox(
        heightFactor: fill,
        widthFactor: 0.8, // 0 <> 1
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(.9),
                color.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
