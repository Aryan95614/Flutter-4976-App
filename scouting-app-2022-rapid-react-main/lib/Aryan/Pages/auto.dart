import 'package:flutter/material.dart';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as tfile;

class Start extends StatefulWidget {
  const Start({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String name = "";
  int Match = 0;
  int Team = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Start Page')),
      body: Center(
        child: Column(
          children: [//nothing rn lmao
          ],
        ),
      ),
    );
  }
}
