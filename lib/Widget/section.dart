import 'package:flutter/cupertino.dart';

import '../Models/task.dart';

class Section extends StatefulWidget{
  Section({super.key, required this.taskList});
  final List<TaskModel> taskList;
  @override
  State<Section> createState() {
    // TODO: implement createState
    return _SectionState();
  }
}

class _SectionState extends State<Section>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(itemCount: widget.taskList.length, itemBuilder: (BuildContext context, int index) {
        return Text('item');
      },),
    );
  }
}