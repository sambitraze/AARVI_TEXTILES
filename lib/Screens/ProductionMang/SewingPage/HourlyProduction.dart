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
  @override
  void initState() {
    loadVaue();
    super.initState();
  }
  dynamic response;
  void loadVaue() async{
    await DefaultAssetBundle.of(context).loadString("assets/HPR.json").then((s) {
      setState(() {
        response = json.decode(s);
        print(response);
      });
      });
    // var jsonResult = jsonDecode(jsonData);
    // print(jsonResult);
    // return jsonResult;
  }
  // dynamic json;
  // bool loaded = false;
  // void setJson() async {
  //   json = await loadVaue();
  //   setState(() {
  //     loaded = true;
  //   });
  // }
  // @override
  // void initState() {
  //   setJson();
  //   // TODO: implement initState
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production Report')),
      body: Container(
        child: Column(
          children: <Widget>[
            // JsonTable(response),
             FlatButton(onPressed: (){loadVaue();}, child: Text('hel')),
          ],
        )
        // child: Column(
        //   children: <Widget>[
        //     FlatButton(onPressed: (){loadVaue();}, child: Text('hel')),
            
        //   ],
        // )
      ),
    );
  }
}