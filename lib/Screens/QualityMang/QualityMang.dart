import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class QualityMang extends StatefulWidget {
  @override
  _QualityMangState createState() => _QualityMangState();
}

var controllers = <TextEditingController>[];
var rowList = List<DataRow>();

SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

DataRow getRow(int index, {bool newController = true}) {
  var list = List<DataCell>();
  index = index * 10;
  for (int i = index; i < index + 10; ++i) {
    newController
        ? controllers.add(TextEditingController())
        : print("Not New Controller");
    list.add(DataCell(TextField(
      controller: controllers[i],
    )));
  }
  return DataRow(cells: list);
}

class _QualityMangState extends State<QualityMang> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int rows = 0;
  TextEditingController defects = TextEditingController(),
      firsthour = TextEditingController(),
      secondhour = TextEditingController(),
      thirdhour = TextEditingController(),
      fourthhour = TextEditingController(),
      fifthhour = TextEditingController(),
      sixthhour = TextEditingController(),
      seventhhour = TextEditingController(),
      eigthhour = TextEditingController(),
      total = TextEditingController();

  String buyer;
  final checker = TextEditingController();
  final orderQty = TextEditingController();
  final styleNo = TextEditingController();
  final lineNo = TextEditingController();
  final date = TextEditingController();
  final tpc = TextEditingController();
  final tdp = TextEditingController();
  final tpp = TextEditingController();
  final td = TextEditingController();
  final dhu = TextEditingController();

  List<DataRow> getRows() {
    for (int i = 0; i < rows; ++i) rowList.add(getRow(i));
    return rowList;
  }

  @override
  void initState() {
    rows = 0;
    controllers = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quality Mangement')),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("line Number"),
                  controller: styleNo,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Style No"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try {
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {});
                    } catch (e) {}
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: styleNo,
                ),
                leaveSpace(),
                DateTimeField(
                    controller: date,
                    format: DateFormat('dd-MM-yyyy'),
                    decoration: TextFieldDec.inputDec("Date"),
                    onShowPicker: (context, currentValue) async {
                      final dat = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2100));
                      try {
                        await Firestore.instance
                            .collection('aarvi')
                            .document(styleNo.value.text)
                            .collection('CuttingQuality')
                            .document(DateFormat('dd-MM-yyyy').format(dat))
                            .get()
                            .then((value) {
                          if (value.exists) {
                            var data = value;
                            // layNo.text = data['lay_number'] ?? '';
                            // size.text = data['size'] ?? '';
                            // totalPartChecked.text = data['total_part_checked'] ?? '';
                            // pass.text = data['pass'] ?? '';
                            // fail.text = data['fail'] ?? '';
                            int len = 0;
                            data['table'].forEach((element) {
                              len++;
                            });
                            for (int i = 0; i < len; i = i + 10) {
                              for (int j = i; j < i + 10; ++j) {
                                controllers.add(TextEditingController());
                                controllers[j].text = data['table'][j];
                                print(controllers[j].text);
                              }
                              rowList.add(getRow(rows++, newController: false));
                            }
                          }
                        });
                      } catch (e) {
                        _scaffoldState.currentState.showSnackBar(SnackBar(
                          content: Text(e.toString()),
                        ));
                      }
                      setState(() {});
                      return dat;
                    }),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Order Qty"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try {
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {});
                    } catch (e) {}
                  },
                ),
                leaveSpace(),
                leaveSpace(),
                Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text("Defects",
                                style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ),                            
                            DataColumn(
                                label: Text("1ST HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("2ND HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("3RD HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("4TH HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("5TH HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("6TH HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("7TH HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("8TH HOUR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("tOTAL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)))
                            
                            
                          ],
                          rows: rowList,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              print("Rows = " + rows.toString());
                              rowList.add(getRow(rows++));
                              print(controllers.length);
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              print(controllers.length);
                              rows--;
                              if (rows >= 0) {
                                rowList.removeLast();
                                [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach((element) {
                                  controllers.removeLast();
                                });
                              } else {
                                rows = 0;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            setState(() {
                              controllers = [];
                              rows = 0;
                              rowList = [];
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                leaveSpace(),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Checker Name"),
                  controller: checker,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Pieces Checked"),
                  controller: tpc,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Defected Pieces"),
                  controller: tdp,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Pass Pieces"),
                  controller: tpp,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Defects"),
                  controller: td,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("DHU %"),
                  controller: dhu,
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    _scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Uploading"),
                    ));
                    try {
                      var tableList = [];
                      controllers.forEach((element) {
                        tableList.add(element.value.text);
                      });
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .collection('CuttingQuality')
                          .document(date.value.text)
                          .setData({
                        //set the data
                      });
                    } catch (e) {
                      _scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                    controllers.forEach((element) {
                      print(element.value.text);
                    });
                    _scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Done"),
                    ));
                  },
                )
              ],
            )),
      ),
    );
  }
}
