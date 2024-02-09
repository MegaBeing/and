import 'package:flutter/material.dart';

class DateOnTask extends StatelessWidget {
  DateOnTask({super.key, required, required this.date});

  final DateTime date;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                date.day.toString(),
              ),
            ),
          ),
          Text(
            months[date.month - 1],
            style: const TextStyle(color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
