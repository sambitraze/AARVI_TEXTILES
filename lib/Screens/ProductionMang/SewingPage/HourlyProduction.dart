import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class SewingHourlyProduction extends StatefulWidget {
  @override
  _SewingHourlyProductionState createState() => _SewingHourlyProductionState();
}
class _SewingHourlyProductionState extends State<SewingHourlyProduction> {
  InputDecoration inputDec(String labelText){
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      labelText: labelText,
      enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.brown, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown, width: 2.0),
      ),
    );
  }
  InputDecoration popUpDec(String label) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.brown,width: 2)),
    );
  }
  SizedBox leaveSpace(){
    return SizedBox(
     height: 10,
    );
  }
  final lineNo = TextEditingController();
  String filePath = "assets/HPR.json";
  @override
  void initState() {
    loadVaue();
    super.initState();
  }
  dynamic response;
  void loadVaue() async{
    await DefaultAssetBundle.of(context).loadString(filePath).then((s) {
      setState(() {
        response = json.decode(s);
        print(response);
        loaded = true;
        // list = response;
        // print(list);
      });
    });
  }
  bool loaded = false;
  // List<Map> list;

  DateTime date;
  final operatorname = TextEditingController();
  final operationname = TextEditingController();
  final styleNo = TextEditingController();
  final firstHour = TextEditingController();
  final secondHour = TextEditingController();
  final thirdHour = TextEditingController();
  final fouthHour = TextEditingController();
  final fifthHour = TextEditingController();
  final sixthHour = TextEditingController();
  final seventhHour = TextEditingController();
  final eightHour = TextEditingController();
  
  String fileName;
  String newData;


  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production report')),
      body: Container(),
    );
  }   
}

