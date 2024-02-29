import 'package:and/Models/section.dart';
import 'package:and/Models/task.dart';
import 'package:flutter/material.dart';

final List<TaskModel> tasks1 = [];
final List<TaskModel> tasks2 = [];
final List<TaskModel> tasks3 = [];
final List<TaskModel> tasks4 = [];
final List<SectionModel> sections = [
  SectionModel(title: 'College', taskList: tasks1, color: const Color(0xffff9843)),
  SectionModel(title: 'Misc', taskList: tasks2, color: const Color(0xffFFDD95)),
  SectionModel(title: 'Algorithm', taskList: tasks3, color: const Color(0xff86A7FC)),
  SectionModel(title: 'Learning', taskList: tasks4, color: const Color(0xff3468C0)),
];