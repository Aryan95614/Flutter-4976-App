import 'package:flutter/material.dart';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/auto.dart'
    as thatfile;

import 'package:scouting_app_2022_rapid_react/Aryan/Pages/name.dart' as ttfile;
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/page2.dart' as anot;
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/page3.dart' as not;
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/converttocsv.dart' as csv;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Robotics App'),
        routes: {
          '/Index': (context) => MyHomePage(title: 'Robotics Title Page'),
          '/Thesame': (context) => thatfile.Start(title: 'Basic Information'),
          '/Thenotsame': (context) =>
              ttfile.nameenteringandstuff(title: 'Auto'),
          '/Secondpage': (context) => anot.page22(title: "Teleop"),
          '/Thirdpage': (context) => not.page3(title: "Endgame"),
          '/Convert_to_CSV': (context) => csv.datacat(title: 'Convert to CSV',)
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //page 1
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text('Start'),
                onPressed: () {
                  Navigator.pushNamed(context, '/Thenotsame');
                }),
            Text(""),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Convert_to_CSV');
                },
                child: Text("Convert to Csv")),
            //Image(image: AssetImage("rg.jpg"))
          ],
        )));
  }
}
