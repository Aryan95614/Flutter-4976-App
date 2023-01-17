import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as tfile;

class nameenteringandstuff extends StatefulWidget {
  const nameenteringandstuff({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _nameenteringandstuffState createState() => _nameenteringandstuffState();
}

class _nameenteringandstuffState extends State<nameenteringandstuff> {
  int HPshooting = 0;
  Text choice = Text("         Red         ");
  Text choice1 = Text("         Blue         ");

  int move1(int word) {
    return word += 1;
  }

  int move(int word) {
    word -= 1;
    if (word < 0) word = 0;
    return word;
  }

  int _decrement(int vari) {
    setState(() {
      move(vari);
    });
    return vari - 1;
  }

  int _increment(int vari) {
    setState(() {
      if (vari >= 0) move1(vari);
    });
    return vari + 1;
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      //page 1
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: PageView(
        children: [
          ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextField(
                  onChanged: (text) {
                    tfile.Matchdata.instance.Team = text;
                  },

                  decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    hintText: tfile.Matchdata.instance.Team, //'Team Number',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextField(
                  onChanged: (text) {
                    tfile.Matchdata.instance.Match = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: tfile.Matchdata.instance.Match,
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Team:\n"),
                TextButton(
                  //isButtonPressed ? Colors.green : Colors.red
                  child: choice,

                  style: TextButton.styleFrom(
                    primary: Colors.red,
                    // Text Color
                  ),
                  onPressed: () {
                    setState(() {
                      tfile.Matchdata.instance.choice = "Red, ";
                    });
                  },
                ),
                TextButton(
                  child: choice1,
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    // Text Color
                  ),
                  onPressed: () {
                    setState(() {
                      tfile.Matchdata.instance.choice = "Blue, ";
                    });
                  },
                ),
              ],
            ),
            Text(
              "You've selected: \t",
              textAlign: TextAlign.center,
            ),
            Text(tfile.Matchdata.instance.choice,
              textAlign: TextAlign.center,),

            Text(""),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: TextField(
                onChanged: (text) {
                  tfile.Matchdata.instance.opp1 = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: tfile.Matchdata.instance.opp1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: TextField(
                onChanged: (text) {
                  tfile.Matchdata.instance.opp2 = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: tfile.Matchdata.instance.opp2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: TextField(
                onChanged: (text) {
                  tfile.Matchdata.instance.opp3 = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: tfile.Matchdata.instance.opp3,
                ),
              ),
            ),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Left Tarmac?: "),
              Checkbox(
                value: tfile.Matchdata.instance.moved,
                onChanged: (bool? t) {
                  setState(() {
                    tfile.Matchdata.instance.moved = t!;
                  });
                },
              ),
            ]),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("lowballs:\t    "),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.lowballs > 0) {
                      tfile.Matchdata.instance.lowballs -= 1;
                    }
                  });
                },
                child: Text("-"),
              ),
              Text("           " +
                  (tfile.Matchdata.instance.lowballs).toString() +
                  "\t\t\t\t\t\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.lowballs < 50) {
                      {
                        tfile.Matchdata.instance.lowballs += 1;
                      }
                    }
                  });
                },
                child: Text("+"),
              ),
            ]),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("lowmisses:\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.lowmisses > 0) {
                      tfile.Matchdata.instance.lowmisses -= 1;
                    }
                  });
                },
                child: Text("-"),
              ),
              Text("           " +
                  (tfile.Matchdata.instance.lowmisses).toString() +
                  "\t\t\t\t\t\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.lowmisses < 50) {
                      tfile.Matchdata.instance.lowmisses += 1;
                    }
                  });
                },
                child: Text("+"),
              ),
            ]),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("highballs:\t   "),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.highballs > 0) {
                      tfile.Matchdata.instance.highballs -= 1;
                    }
                  });
                },
                child: Text("-"),
              ),
              Text("           " +
                  (tfile.Matchdata.instance.highballs).toString() +
                  "\t\t\t\t\t\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.highballs < 50) {
                      tfile.Matchdata.instance.highballs += 1;
                    }
                  });
                },
                child: Text("+"),
              ),
            ]),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("highmisses:\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.highmisses > 0) {
                      tfile.Matchdata.instance.highmisses -= 1;
                    }
                  });
                },
                child: Text("-"),
              ),
              Text("           " +
                  (tfile.Matchdata.instance.highmisses).toString() +
                  "\t\t\t\t\t\t"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (tfile.Matchdata.instance.highmisses < 50) {
                      tfile.Matchdata.instance.highmisses += 1;
                    }
                  });
                },
                child: Text("+"),
              ),
            ]),
            Text(""),
            Text(""),

            Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("   "),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Secondpage');
                        },
                        child: const Text('Next Page'),
                      ),
                    ]),
                Text("   "),
              ],
            ),
            Text(""),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Thesame');
                    },
                    child: const Text('Return to Main Screen'),
                  ),
                ]),
          ]),
        ],
      ),
    );
  }
}
