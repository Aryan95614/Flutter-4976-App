import 'package:flutter/material.dart';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as tfile;
import 'package:flutter_mailer/flutter_mailer.dart';

class datacat extends StatefulWidget {
  const datacat({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _datacatState createState() => _datacatState();
}

class _datacatState extends State<datacat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Convert This')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: TextField(
                onChanged: (text) {
                  tfile.Matchdata.instance.comb = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Paste Everything here',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  tfile.Matchdata.instance.formCsv(tfile.Matchdata.instance.comb);
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
