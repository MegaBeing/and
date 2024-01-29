import 'package:and/Models/task.dart';
final DateTime now = DateTime.now();

final tasks = [
  TaskModel(id: '1', title: 'Test-1', description: 'Test-1', startDateTime: now.subtract(Duration(hours: 2)),endDateTime: now.add(Duration(hours: 2)), priority: Priority.high),
];