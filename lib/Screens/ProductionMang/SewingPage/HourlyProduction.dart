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
      });
    });
  }
  bool loaded = false;

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

  void writeValue(String data) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    //todo: replace above two lines with actual path for downloading firebase files.
    final file = File('$path/$fileName');
    file.writeAsStringSync(data, mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Production report')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: !loaded ? CircularProgressIndicator(): Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: inputDec('Line No'),
                    controller: lineNo,
                   
                  ),
                  FlatButton(
                    color: Colors.grey[300],
                    onPressed: () {
                      setState(() {
                        fileName = lineNo.text + '.txt';
                        print(fileName);
                      });                      
                    //TODO: implement cloud store pull json file and set line no and date.
                   },
                   child: Text('fetch')
                  ),
                  JsonTable(
                    response,
                    showColumnToggle: true,
                    tableHeaderBuilder: (String header) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.grey[300]
                        ),
                        child: Text(
                          header,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w700,fontSize: 14.0,color: Colors.black87),
                        ),
                      );
                    },
                    tableCellBuilder: (value) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(border: Border.all(width: 0.5,color: Colors.grey.withOpacity(0.5))),
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1.copyWith(fontSize: 14.0, color: Colors.grey[900]),
                        ),
                      );
                    },
                    allowRowHighlight: true,
                    rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                    paginationRowCount: 8,
                  ),
                  FlatButton(
                    onPressed: () {
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add Data'),
                          content: new SingleChildScrollView(                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () async {
                                    date = await showRoundedDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(DateTime.now().year - 1),
                                      lastDate: DateTime(DateTime.now().year + 1),
                                      borderRadius: 16,
                                    );
                                    print(date);
                                  },
                                  child: Text('Add Date'),
                                ),
                                TextField(
                                  controller: operatorname,
                                  decoration: popUpDec('Operator'),
                                ),
                                TextField(
                                  controller: operationname,
                                  decoration: popUpDec('Operation'),
                                ),
                                TextField(
                                  controller: styleNo,
                                  decoration: popUpDec('Style No'),
                                ),
                                TextField(
                                  controller: firstHour,
                                  decoration: popUpDec('1ST Hour'),
                                ),
                                TextField(
                                  controller: secondHour,
                                  decoration: popUpDec('2ND Hour'),
                                ),
                                TextField(
                                  controller: thirdHour,
                                  decoration: popUpDec('3RD Hour'),
                                ),
                                TextField(
                                  controller: fouthHour,
                                  decoration: popUpDec('4TH Hour'),
                                ),
                                TextField(
                                  controller: fifthHour,
                                  decoration: popUpDec('5TH Hour'),
                                ),
                                TextField(
                                  controller: sixthHour,
                                  decoration: popUpDec('6TH Hour'),
                                ),
                                TextField(
                                  controller: seventhHour,
                                  decoration: popUpDec('7TH Hour'),
                                ),
                                TextField(
                                  controller: eightHour,
                                  decoration: popUpDec('8TH Hour'),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: () {
                                setState(() {
                                  newData = ',{' + '"DATE":"' + date.toString() +'","OPERATOR":"' + operatorname.text + '","OPERTAION":"' + operationname.text + '","STYLE NO":"' + styleNo.text +'","1ST HOUR":"' + firstHour.text +
                                 '","2ND HOUR":"'+ secondHour.text + '","3RD HOUR":"' + thirdHour.text + '","4TH HOUR":"' + fouthHour.text + '","5TH HOUR":"' + fifthHour.text + '","6TH HOUR":"' + sixthHour.text + '","7TH HOUR":"' + seventhHour.text +
                                  '","8TH HOUR":"' + eightHour.text + '"}' ;
                                });
                                  print(newData);
                                  //add custom write to file 
                              },
                              child: new Text('Add')
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: new Text('close')
                            )
                          ],
                        );
                      },
                    );
                    }, 
                    child: Text('Add New'))
                ],
              )
      ),
    );
  }   
}

