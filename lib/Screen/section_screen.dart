import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Data/task_data.dart';
import 'package:and/Widget/section.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class SectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var a = MediaQuery.of(context).viewInsets.horizontal;
    var b = MediaQuery.of(context).viewInsets.vertical;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 410,
        ),
        itemBuilder: (ctx, index) => Section(
          section: sections[index],
          title: sections[index].title,
        ),
        itemCount: sections.length,
      ),
    );
  }
}

