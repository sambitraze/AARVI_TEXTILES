import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

class SewingHourlyProduction extends StatefulWidget {
  @override
  _SewingHourlyProductionState createState() => _SewingHourlyProductionState();
}
class _SewingHourlyProductionState extends State<SewingHourlyProduction> {
  dynamic loadValue () async {    
    String jsonData = await DefaultAssetBundle.of(context).loadString("assets/HPR.json"); 
    dynamic jsonResult = jsonDecode(jsonData);
    print(jsonResult);
    return jsonResult;
  }
  @override
  Widget build(BuildContext context) {
    dynamic json = loadValue();
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production Report')),
      body: Container(
      child: Column(
        children: <Widget>[
          JsonTable(
            json,
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
                    paginationRowCount: 4,
          )
        ],
      ),
      ),
    );
  }
}