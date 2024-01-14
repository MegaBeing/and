import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            Text('section_1'),
            SizedBox(width: 20,),
            Text('section_2'),
          ],
        ),
        Row(
          children: [
            Text('section_3'),
            SizedBox(width: 20,),
            Text('section_4'),
          ],
        ),
      ],
    );
  }
}
