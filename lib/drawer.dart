import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
        Text("aswin"),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("gggggggggggg"),
        )
      ],
    );
  }
}
