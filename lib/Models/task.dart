import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();
enum Priority { high, medium, low }
const Map<Priority,Color>priorityColor = {
  Priority.high : Colors.red,
  Priority.medium : Colors.yellow,
  Priority.low : Colors.green,
};
final Map<Priority,int>completedTask = {
  Priority.high:0,
  Priority.low:0,
  Priority.medium:0,
};
final Map<Priority,int>incompletedTask = {
  Priority.high:0,
  Priority.low:0,
  Priority.medium:0,
};
class TaskModel {
  TaskModel({
    required this.title,
    required this.startDateTime,
    required this.endDateTime,
    required this.priority,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final DateTime startDateTime;
  final DateTime endDateTime;
  Priority priority;
}

