import 'package:flutter/material.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  int id = 0;
  int id1 = 0;
  int currentPos = 1;
  int answer = 0;
  int something = 0;
  String dropdownValue = 'Addition';

  String thing(String choice){
    String some = '';
    if(choice == 'Addition'){
      some = (id+id1).toString();
    }
    if(choice == 'Subtraction'){
      some = (id-id1).toString();
    }
    if(choice == 'Multiplication'){
      some = (id*id1).toString();
    }
    if(choice == 'Division'){
      some = (id/id1).toString();
    }
    return some;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Welcome to the Calc App\n\n'),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      obscureText: false,
                      onChanged: (text) {
                        id = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Write Here',
                        hintText: '1st Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      obscureText: false,
                      onChanged: (text) {
                        id1 = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Write Here',
                        hintText: '2nd Number',
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Addition', 'Subtraction', 'Multiplication', 'Division']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  Text(thing(dropdownValue)),
                ])));
  }

}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
  String getters(){
    return _MyStatefulWidgetState().getter();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Addition';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Addition', 'Subtraction', 'Multiplication', 'Division']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }
  String getter(){
    return dropdownValue;
  }
}
