import 'package:and/Models/section.dart';
import 'package:and/Models/task.dart';
import 'package:flutter/material.dart';
final DateTime now = DateTime.parse('2024-02-04 12:20:04');
final List<TaskModel>tasks1 = [
  TaskModel(title: 'Test-1', startDateTime: now.subtract(Duration(hours: 1)),endDateTime: now.add(Duration(hours: 1)), priority: Priority.low),
];
final List<TaskModel>tasks2 = [
  TaskModel(title: 'Test-1', startDateTime: now.subtract(Duration(hours: 2)),endDateTime: now.add(Duration(hours: 1)), priority: Priority.high),
];
final List<TaskModel>tasks3 = [
  TaskModel(title: 'Test-1', startDateTime: now.subtract(Duration(hours: 3)),endDateTime: now.add(Duration(hours: 2)), priority: Priority.medium),

];
final List<TaskModel>tasks4 = [
  TaskModel(title: 'Test-1', startDateTime: now.subtract(Duration(hours: 5)),endDateTime: now.add(Duration(hours: 2)), priority: Priority.high),

];
final List<SectionModel>sections = [
  SectionModel(title: 'College', taskList: tasks1,color: Color(0xff39d76b)),
  SectionModel(title: 'Misc', taskList:tasks2,color: Color(0xffccd739)),
  SectionModel(title: 'Algorithm', taskList:tasks3,color: Color(0xffd75639)),
  SectionModel(title: 'Learning', taskList: tasks4,color: Color(0xff39aad7)),
];