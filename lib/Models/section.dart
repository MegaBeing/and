import 'package:and/Models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
const uuid = Uuid();

class SectionModel {
  SectionModel({
    required this.title,
    required this.taskList,
    required this.color,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final Color color;
  final List<TaskModel> taskList;
}
