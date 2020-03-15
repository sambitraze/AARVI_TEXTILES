import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_table/json_table.dart';

class SewingHourlyProduction extends StatefulWidget {
  @override
  _SewingHourlyProductionState createState() => _SewingHourlyProductionState();
}
class _SewingHourlyProductionState extends State<SewingHourlyProduction> {
  
 static Future<String> getFileData() async {
  String data = await rootBundle.loadString('assets/data.txt');
  print(data);         
  return data;
  }
  
  
  final String jsonSample = getFileData().toString();
  @override
  Widget build(BuildContext context) {    
    // var json = jsonDecode(jsonSample);
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production Report')),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () async{
                getFileData();
                print(jsonSample);
                
              },
              child: Text('print')
            ),
            // JsonTable(json,)
          ],
        ),
      ),
    );
  }
}