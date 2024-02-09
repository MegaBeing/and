import 'dart:math';

import 'package:and/Models/task.dart';
import 'package:and/Widget/Task_Widgets/date_on_task.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() {
    // TODO: implement createState
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  final _taskKey = GlobalKey<FormState>();
  String _enteredTaskTitle = '';
  Priority _enteredPriority = Priority.low;
  DateTime? _startDate;
  DateTime? _endDate;

  void _saveTask() {
    if (_taskKey.currentState!.validate()) {
      _taskKey.currentState!.save();
      Navigator.of(context).pop(
        TaskModel(
          title: _enteredTaskTitle,
          startDateTime: _startDate!,
          endDateTime: _endDate!,
          priority: _enteredPriority,
        ),
      );
    }
  }

  void _selectDateRanger() async {
    final now = DateTime.now();

    final firstDate = now;
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: now,
    );
    setState(() {
      _startDate = pickedDate!.start;
      _endDate = pickedDate.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Form(
        key: _taskKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left:20,right: 20),
                    child: TextFormField(
                      initialValue: _enteredTaskTitle,
                      maxLength: 25,
                      decoration: const InputDecoration(
                        label: Text('title'),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.trim().length > 25) {
                          return 'Must be between 1 and 25 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredTaskTitle = value!;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                Expanded(
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        _enteredPriority = value!;
                      });
                    },
                    value: _enteredPriority,
                    decoration: const InputDecoration(
                      label: Text('Priority'),
                    ),
                    items: [
                      for (final priority in Priority.values)
                        DropdownMenuItem(
                          value: priority,
                          child: Row(
                            children: [
                              Container(
                                color: priorityColor[priority],
                                height: 10,
                                width: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(priority.name),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (_startDate == null)
                    ? const Icon(Icons.align_horizontal_left)
                    : DateOnTask(date: _startDate!),
                ElevatedButton(
                  onPressed: _selectDateRanger,
                  child: const Icon(Icons.calendar_month_rounded),
                ),
                (_endDate == null)
                    ? const Icon(Icons.align_horizontal_right)
                    : DateOnTask(date: _endDate!)
              ],
            ),
            const SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _taskKey.currentState!.reset();
                  },
                  child: const Text('Reset'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Save'),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
