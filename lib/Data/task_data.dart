import 'package:and/Models/section.dart';
import 'package:and/Models/task.dart';
import 'package:flutter/material.dart';

final List<TaskModel> tasks1 = [];
final List<TaskModel> tasks2 = [];
final List<TaskModel> tasks3 = [];
final List<TaskModel> tasks4 = [];
final List<SectionModel> sections = [
  SectionModel(title: 'College', taskList: tasks1, color: Color(0x5439d76b),totalTasks: 0),
  SectionModel(title: 'Misc', taskList: tasks2, color: Color(0x9eccd739),totalTasks: 0),
  SectionModel(title: 'Algorithm', taskList: tasks3, color: Color(0xa4d75639),totalTasks: 0),
  SectionModel(title: 'Learning', taskList: tasks4, color: Color(0x9a39aad7),totalTasks: 0),
];
