import 'package:flutter/material.dart';

enum Priority { high, medium, low }
const priorityColor = {
  Priority.high : Colors.red,
  Priority.medium : Colors.yellow,
  Priority.low : Colors.green,
};
class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDateTime,
    required this.endDateTime,
    required this.priority,
  });

  final String id;
  final String title;
  final String description;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final Priority priority;

}
