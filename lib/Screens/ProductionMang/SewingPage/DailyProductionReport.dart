import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class DailyProductionReport extends StatefulWidget {
  @override
  _DailyProductionReportState createState() => _DailyProductionReportState();
}

class _DailyProductionReportState extends State<DailyProductionReport> {
  Future<String> _loadHPRAsset() async {
  return await rootBundle.loadString('assets/HPR.json');
  }
  Future loadHPR() async {
  String jsonHPR = await _loadHPRAsset();
  print(jsonHPR);
  }
  @override
  Widget build(BuildContext context) {
    Future<String> _loadHPRAsset() async {
      return await rootBundle.loadString('assets/HPR.json');
    }
    Future loadHPR() async {
      String jsonHPR = await _loadHPRAsset();
      print(jsonHPR);
      return jsonHPR;
    }
    
    // var json = await loadHPR();
    return Scaffold(
      appBar: AppBar(title: Text('Daily Production report')),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () async{                
                setState(() {
                  
                });
                
              },
            child: Text('fetch')
            ),
            // JsonTable(
            //   json,
            //   showColumnToggle: true,
            //   tableHeaderBuilder: (String header) {
            //     return Container(
            //       padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            //       decoration: BoxDecoration(
            //         border: Border.all(width: 0.5),
            //         color: Colors.grey[300]),
            //         child: Text(
            //           header,
            //           textAlign: TextAlign.center,
            //           style: Theme.of(context).textTheme.display1.copyWith(
            //             fontWeight: FontWeight.w700,
            //             fontSize: 14.0,
            //             color: Colors.black87),
            //         ),
            //     );
            //   },
            // tableCellBuilder: (value) {
            //   return Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 4.0, vertical: 2.0),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             width: 0.5,
            //               color: Colors.grey.withOpacity(0.5))),
            //               child: Text(
            //                 value,
            //                 textAlign: TextAlign.center,
            //                 style: Theme.of(context).textTheme.display1.copyWith(
            //                   fontSize: 14.0, color: Colors.grey[900]),
            //                 ),
            //   );
            // },
            // allowRowHighlight: true,
            // rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
            // paginationRowCount: 4,
            // ),
          ],
        ),
      ),
    );
  }
}