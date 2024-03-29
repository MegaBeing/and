import 'package:and/Data/task_data.dart';
import 'package:and/Widget/Section_Widgets/section.dart';
import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var a = MediaQuery.of(context).size.width;
    var b = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("And Listy",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        actions: [
          Container(
            margin: const EdgeInsets.only(right:10),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Generate'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
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
      ),
    );
  }
}
