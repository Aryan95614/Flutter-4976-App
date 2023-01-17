import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart' as messag;
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as tfile;
import 'package:share_plus/share_plus.dart';

class page3 extends StatefulWidget {
  const page3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _page3State createState() => _page3State();
}

class _page3State extends State<page3> {
  int Yellow = 0;
  int Red = 0;
  bool submit = false;
  bool pressed = false;
  bool presses4 = false;
  final stopwatch = Stopwatch();
  List<String> numbers = ["2898399494"];
  String time4 = "Not on";
  void first() async{
    setState(() {
      if (!presses4) {
        stopwatch.start();
        time4 = "On " + (stopwatch.elapsedMilliseconds/1000).toString();
        presses4 = true;
      } else {
        stopwatch.stop();
        time4 = "Not On " + (stopwatch.elapsedMilliseconds/1000).toString();
        tfile.Matchdata.instance.timer1 = stopwatch.elapsedMilliseconds/1000;

        presses4 = false;
      }
    });


  }
  String Change(bool val) {
    if (val) {
      return '1, ';
    } else {
      return '0, ';
    }
  }

  String num(int v) {
    return "$v" + ", ";
  }

  String changg(String char) {
    if (char == "") {
      return ", ";
    }
    return char;
  }

  String switchs(String recieved){
    if(recieved == "No first opponent, " || recieved == "No second opponent, " || recieved == "No third opponent, "){
      return "0, ";
    }
    return recieved + ", ";
  }

  String getInfo() {
    return (
        tfile.Matchdata.instance.Team +
            ", " +
            tfile.Matchdata.instance.Match +
            ", " +
            changg(tfile.Matchdata.instance.choice) +
            Change(tfile.Matchdata.instance.moved) +
            num(tfile.Matchdata.instance.lowballs) +
            num(tfile.Matchdata.instance.lowmisses) +
            num(tfile.Matchdata.instance.highballs) +
            num(tfile.Matchdata.instance.highmisses) +
            num(tfile.Matchdata.instance.lowballz) +
            num(tfile.Matchdata.instance.lowmissez) +
            num(tfile.Matchdata.instance.highballz) +
            num(tfile.Matchdata.instance.highmissez) +


            switchs(tfile.Matchdata.instance.opp1 )+
            tfile.Matchdata.instance.timer1.toString() + ", " +
            switchs(tfile.Matchdata.instance.opp2 )+
            tfile.Matchdata.instance.timer2.toString() + ", " +
            switchs(tfile.Matchdata.instance.opp3 )+
            tfile.Matchdata.instance.timer3.toString() + ", " +

            tfile.Matchdata.instance.timer4.toString() + ", " +
            num(tfile.Matchdata.instance.climb) +
            Change(tfile.Matchdata.instance.fallen) +
            num(tfile.Matchdata.instance.fouls) +
            Change(tfile.Matchdata.instance.Yellow) +
            Change(tfile.Matchdata.instance.Red) +
            Change(tfile.Matchdata.instance.breakdown) +
            Change(tfile.Matchdata.instance.repaired));
  }

  void sendInfo() async {
    """print('ran 2');
    String msg = getInfo();
    Share.share(msg, subject: "Robotics Information");
    """;
    //print(msg);
    //print(this.numbers);
    String msg = getInfo();
    print(msg);
    try {
      String send_result = await messag
          .sendSMS(message: msg, recipients: this.numbers)
          .catchError((err) {
        print(err);
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Text(
            "",
            textAlign: TextAlign.center,
          ),
          Text(
            "",
            textAlign: TextAlign.center,
          ),
          Text(
            "",
            textAlign: TextAlign.center,
          ),
          Text(" "),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {

                first();
              }, child: Text("Climber timer: " + time4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Climbing Level:    "),
                  ElevatedButton(

                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.climb > 0) {
                          tfile.Matchdata.instance.climb -= 1;
                        }
                      });
                    },
                    child: Text("-"),
                  ),

                  Text("           " +
                      (tfile.Matchdata.instance.climb).toString() +
                      "\t\t\t\t\t\t"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (tfile.Matchdata.instance.climb < 4) {
                          tfile.Matchdata.instance.climb += 1;
                        }
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Did they fall?: "),
                Checkbox(
                  value: tfile.Matchdata.instance.fallen,
                  onChanged: (bool? t) {
                    setState(() {
                      tfile.Matchdata.instance.fallen = t!;
                    });
                  },
                ), //C
              ]),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextField(
                  onChanged: (text) {
                    tfile.Matchdata.instance.fouls = int.parse(text);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: tfile.Matchdata.instance.fouls.toString(),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Any Yellow Cards?: "),
                Checkbox(
                  value: tfile.Matchdata.instance.Yellow,
                  onChanged: (bool? t) {
                    setState(() {
                      tfile.Matchdata.instance.Yellow = t!;
                    });
                  },
                ), //C
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Any Red Cards?: "),
                Checkbox(
                  value: tfile.Matchdata.instance.Red,
                  onChanged: (bool? t) {
                    setState(() {
                      tfile.Matchdata.instance.Red = t!;
                    });
                  },
                ), //C
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Brokedown?: "),
                Checkbox(
                  value: tfile.Matchdata.instance.breakdown,
                  onChanged: (bool? t) {
                    setState(() {
                      tfile.Matchdata.instance.breakdown = t!;
                    });
                  },
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Recovered?: "),
                Checkbox(
                  value: tfile.Matchdata.instance.repaired,
                  onChanged: (bool? t) {
                    setState(() {
                      tfile.Matchdata.instance.repaired = t!;
                    });
                  },
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Secondpage');
                          },
                          child: const Text('Previous Page'),
                        ),
                      ]),
                  Text("   "),
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //tfile.Matchdata.instance.printVariables();
                            if(submit) {
                              tfile.Matchdata.instance.addEdges();
                              Navigator.pushNamed(context, '/Index');
                              submit = false;
                            }
                          },
                          child: const Text('New Match(Deletes all Info)'),
                        ),
                      ]),
                  Text("   "),
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            sendInfo();
                            submit = true;
                            //Navigator.pushNamed(context, '/Index');
                          },
                          child: const Text('Submit'),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
