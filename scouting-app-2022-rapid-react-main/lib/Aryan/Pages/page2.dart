import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as tfile;

class page22 extends StatefulWidget {
  const page22({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _page22State createState() => _page22State();
}

class _page22State extends State<page22> {
  int lowballz = 0;
  int highballz = 0;
  int lowmissez = 0;
  int highmissez = 0;
  int lowshotsprevented = 0;
  int highshotsprevented = 0;
  bool presses = false;
  bool presses2 = false;
  bool presses3 = false;
  String time1 = "Not on";
  String time2 = "Not on";
  String time3 = "Not on";
  final stopwatch1 = Stopwatch();
  final stopwatch2 = Stopwatch();
  final stopwatch3 = Stopwatch();

  int move1(int word) {
    return word += 1;
  }

  int move(int word) {
    return word -= 1;
  }

  int _decrement(int vari) {
    setState(() {
      move(vari);
    });
    return vari - 1;
  }

  int _increment(int vari) {
    setState(() {
      move1(vari);
    });
    return vari + 1;
  }

  void first() async{
    setState(() {
      if (!presses) {
        stopwatch1.start();
        time1 = "On " + (stopwatch1.elapsedMilliseconds/1000).toString();
        presses = true;
      } else {
        stopwatch1.stop();
        time1 = "Not On " + (stopwatch1.elapsedMilliseconds/1000).toString();
        tfile.Matchdata.instance.timer1 = stopwatch1.elapsedMilliseconds/1000;

        presses = false;
      }
    });


  }

  void second() async{
    setState(() {
      if (!presses2) {
        stopwatch2.start();
        time2 = "On " + (stopwatch2.elapsedMilliseconds/1000).toString();
        presses2 = true;
      } else {
        stopwatch2.stop();
        time2 = "Not On " + (stopwatch2.elapsedMilliseconds/1000).toString();
        tfile.Matchdata.instance.timer2 = stopwatch2.elapsedMilliseconds/1000;
        presses2 = false;
      }
    });


  }

  void third() async{
    setState(() {
      if (!presses3) {
        stopwatch3.start();
        time3 = "On " + (stopwatch3.elapsedMilliseconds/1000).toString();
        presses3 = true;
      } else {
        stopwatch3.stop();
        tfile.Matchdata.instance.timer3 = stopwatch3.elapsedMilliseconds/1000;
        time3 = "Not on " + (stopwatch3.elapsedMilliseconds/1000).toString();
        presses3 = false;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: [
          ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Teleop",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("                     Lowballs:    "),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.lowballz > 0) {
                          tfile.Matchdata.instance.lowballz -= 1;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                  Text("           " +
                      (tfile.Matchdata.instance.lowballz).toString() +
                      "\t\t\t\t\t\t"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.lowballz < 50) {
                          tfile.Matchdata.instance.lowballz += 1;
                        }
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("                     Lowmisses:  "),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.lowmissez > 0) {
                          tfile.Matchdata.instance.lowmissez -= 1;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                  Text("           " +
                      (tfile.Matchdata.instance.lowmissez).toString() +
                      "\t\t\t\t\t\t"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.lowmissez < 50) {
                          tfile.Matchdata.instance.lowmissez += 1;
                        }
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("                     Highballs:   "),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.highballz > 0) {
                          tfile.Matchdata.instance.highballz -= 1;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                  Text("           " +
                      (tfile.Matchdata.instance.highballz).toString() +
                      "\t\t\t\t\t\t"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.highballz < 50) {
                          tfile.Matchdata.instance.highballz += 1;
                        }
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("                     Highmisses:  "),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.highmissez > 0) {
                          tfile.Matchdata.instance.highmissez -= 1;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                  Text("           " +
                      (tfile.Matchdata.instance.highmissez).toString() +
                      "\t\t\t\t\t\t"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.highmissez < 50) {
                          tfile.Matchdata.instance.highmissez += 1;
                        }
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),
              Text(""),
            ]),
            Text("                           "),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Defence",
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {
                      first();
                    },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  child: Text(tfile.Matchdata.instance.opp1 + "  " + time1),
                ),
                TextButton(
                    onPressed: () {
                      second();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    child: Text(tfile.Matchdata.instance.opp2 + "  " + time2)),
                TextButton(
                    onPressed: () {
                      third();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    child: Text(tfile.Matchdata.instance.opp3 + "  " + time3)),
                /*TextButton(onPressed: (){
                  //tfile.Matchdata.instance.timer1 = stopwatch1.elapsedMilliseconds/1000;
                  //tfile.Matchdata.instance.timer2 = stopwatch2.elapsedMilliseconds/1000;
                  //tfile.Matchdata.instance.timer3 = stopwatch3.elapsedMilliseconds/1000;
                  stopwatch1.reset();
                  stopwatch2.reset();
                  stopwatch3.reset();
                }, child: Text("Finished?")),*/

              ],
            ),
            Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Thenotsame');
                        },
                        child: const Text('Previous Page'),
                      ),
                    ]),
                Text("   "),
                Text("   "),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Thirdpage');
                        },
                        child: const Text('Next Page'),
                      ),
                    ]),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
