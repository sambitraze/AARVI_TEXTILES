import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

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
SizedBox leaveSpace(){
  return SizedBox(
    height: 10,
  );
}
  final styleNo = TextEditingController();
  String lineNo = 'ab1';
  DateTime date;
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
        loaded = true;
      });
    });
  }
  bool loaded = false;

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production report')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: !loaded ? CircularProgressIndicator(): Column(
                children: [
                  TextFormField(
                    decoration: inputDec('Style No'),
                    controller: styleNo,
                  ),
                  FlatButton(
                    color: Colors.grey[300],
                    onPressed: () async{
                      setState(() {
                        lineNo =  'abc';
                        date = null;
                      });
                    //TODO: implement cloud store pull json file and set line no and date.
                   },
                   child: Text('fetch')
                  ),
                  Text('Line NO: $lineNo'),
                  leaveSpace(),
                  Text('Date: $date'),
                  JsonTable(
                    response,
                    showColumnToggle: true,
                    tableHeaderBuilder: (String header) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            color: Colors.grey[300]),
                        child: Text(
                          header,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Colors.black87),
                        ),
                      );
                    },
                    tableCellBuilder: (value) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.grey.withOpacity(0.5))),
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 14.0, color: Colors.grey[900]),
                        ),
                      );
                    },
                    allowRowHighlight: true,
                    rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                    paginationRowCount: 8,
                  ),
                ],
              )
      ),
    );
  }   
}