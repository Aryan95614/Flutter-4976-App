import 'dart:io';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'dart:async';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:scouting_app_2022_rapid_react/Aryan/Pages/data.dart' as data;

class Matchdata {
  static Matchdata instance = new Matchdata();
  var name = "No Name written";
  var Match = "No Match written";
  var Team = "No Team written";
  var HPshooting = false;
  var HPBalls = 0;
  var HPMisses = 0;
  var lowballs = 0;
  var lowmisses = 0;
  var highballs = 0;
  var opp1 = "No first opponent, ";
  var opp2 = "No second opponent, ";
  var opp3 = "No third opponent, ";
  var highmisses = 0;
  var lowballz = 0;
  var lowmissez = 0;
  var highballz = 0;
  var highmissez = 0;
  var lowshotsprevented = 0;
  var highshotsprevented = 0;
  var climb = 0;
  var fouls = 0;
  var Yellow = false;
  var Red = false;
  var moved = false;
  var breakdown = false;
  var repaired = false;
  var fallen = false;
  var timer1 = 0.0;
  var timer2 = 0.0;
  var timer3 = 0.0;
  var timer4 = 0.0;
  int current = 1;
  var choice = "NONE YET, ";
  var comb = "";

  String Answer = "";
  List<String> recipents = ["2898399494"];

  String returnString(var subject, bool type) {
    if (type) {
      return "1" + ", ";
    } else if (!type) {
      return "0" + ", ";
    }
    return "NULL";
  }

  String returnbString(var subject) {
    if (subject) {
      return "true, ";
    } else if (!subject) {
      return "false, ";
    }
    return "NULL";
  }

  String retu(String thing) {
    return thing + ", ";
  }

  String retub(String thing) {
    if (thing == "") {
      return "No color for now, ";
    } else
      return "$thing";
  }

  String retuc(String thing) {
    if (thing == "") {
      return "No Name written, ";
    } else
      return "$thing";
  }

  //update this function below
  void addEdges() {
    name = "No Name written";
    Match = "No Match written";
    Team = "No Team written";
    HPshooting = false;
    HPBalls = 0;
    HPMisses = 0;
    lowballs = 0;
    lowmisses = 0;
    highballs = 0;

    opp1 = "No first opponent, ";
    opp2 = "No second opponent, ";
    opp3 = "No third opponent, ";
    highmisses = 0;
    lowballz = 0;
    lowmissez = 0;
    highballz = 0;
    highmissez = 0;
    lowshotsprevented = 0;
    highshotsprevented = 0;
    climb = 0;
    fouls = 0;
    Yellow = false;
    Red = false;
    moved = false;
    breakdown = false;
    repaired = false;
    fallen = false;
    timer1 = 0.0;
    timer2 = 0.0;
    timer3 = 0.0;
    timer4 = 0.0;
    current = 1;
    choice = "NONE YET, ";
    comb = "";


    //String.split(", );
  }

  void getFile(List<List<dynamic>> getInfos) async {

    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File(dir + "/filename.csv");

    String csv = const ListToCsvConverter().convert(getInfos);
    f.writeAsString(csv);
    print("done");
  }

  formCsv(String input) async {
    List<String> splitted = input.split(';');
    late List<List<dynamic>> totall = [];
    for (String x in splitted) {
      List<String> row = x.split(', ');
      totall.add(row);
    }
    String dir = (await getApplicationDocumentsDirectory()).path + "/filename.csv";
    getFile(totall);
    //(['${directory.path}/image.jpg'], text: 'Great picture');
    Share.shareFiles(['$dir'], text: 'Robotics Csv File');

  }



  sendEmail() async {
    String thing = (await getApplicationDocumentsDirectory()).path + "/filename.csv";
    try {
      MailOptions mailOptions = MailOptions(
        body: 'Here is a CSV File:\t',
        subject: '[URGENT] ROBOTICS [URGENT]',
        recipients: ['1cookale@hdsb.ca'],
        isHTML: false,
        bccRecipients: [],
        //['other@example.com'],
        ccRecipients: [],
        //['third@example.com'],

        attachments: [ thing,],
      );

      MailerResponse response = await FlutterMailer.send(mailOptions);
      switch (response) {
        case MailerResponse.sent:
          print('Sent Message');
          break;
        case MailerResponse.android:
          print("Here 3");
          break;
        default:
          print('This was the default code running');
      }
    }
    catch(exception){
      print(exception);
    }
  }





}
