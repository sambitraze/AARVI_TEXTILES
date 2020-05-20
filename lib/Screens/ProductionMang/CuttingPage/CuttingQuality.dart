import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class CuttingQuality extends StatefulWidget {
  CuttingQuality({this.date, this.style});

  final String date;
  final String style;

  @override
  _CuttingQualityState createState() => _CuttingQualityState();
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
  index = index * 6;
  for (int i = index; i < index + 6; ++i) {
    newController
        ? controllers.add(TextEditingController())
        : print("Not New Controller");
    list.add(DataCell(TextField(
      controller: controllers[i],
    )));
  }
  return DataRow(cells: list);
}

class _CuttingQualityState extends State<CuttingQuality> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int rows = 0;
  TextEditingController styleNo = TextEditingController(),
      buyer = TextEditingController(),
      fabric = TextEditingController(),
      layNo = TextEditingController(),
      size = TextEditingController(),
      totalPartChecked = TextEditingController(),
      pass = TextEditingController(),
      fail = TextEditingController(),
      garment = TextEditingController();

  TextEditingController date = TextEditingController();

  List<DataRow> getRows() {
    for (int i = 0; i < rows; ++i) rowList.add(getRow(i));
    return rowList;
  }

  @override
  void initState() {
    rows = 0;
    controllers = [];
    if (widget.date != null && widget.style != null) {
      styleNo.text = widget.style;
      fetchDateStr(widget.date);
      // fetchStyle(widget.style);
    }
    super.initState();
  }

  void fetchStyle(String value) async {
    await Firestore.instance
        .collection('aarvi')
        .document(value)
        .get()
        .then((value) {
      if (value.exists) {
        buyer.text = value.data['buyer'];
      }
    });
  }

  void fetchDateStr(String date) async {
    try {
      await Firestore.instance
          .collection('aarvi')
          .document(styleNo.value.text)
          .collection('CuttingQuality')
          .document(date)
          .get()
          .then((value) {
            if(value.exists){
              this.date.text=date;
              var data = value.data;
            }
          });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text('Cutting Quality')),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("Style Number"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .get()
                          .then((value) => buyer.text = value.data['buyer']);
                      setState(() {});
                    } catch (e) {}
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: buyer,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: garment,
                  decoration: TextFieldDec.inputDec("Garment"),
                ),
                SizedBox(
                  height: 10,
                ),
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
                            layNo.text = data['lay_number'] ?? '';
                            size.text = data['size'] ?? '';
                            totalPartChecked.text =
                                data['total_part_checked'] ?? '';
                            pass.text = data['pass'] ?? '';
                            fail.text = data['fail'] ?? '';
                            int len = 0;
                            data['table'].forEach((element) {
                              len++;
                            });
                            for (int i = 0; i < len; i = i + 6) {
                              for (int j = i; j < i + 6; ++j) {
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
                  decoration: TextFieldDec.inputDec("Lay Number"),
                  keyboardType: TextInputType.number,
                  controller: layNo,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Size"),
                  controller: size,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Part Checked"),
                  controller: totalPartChecked,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Pass"),
                  controller: pass,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Fail"),
                  controller: fail,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
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
                                label: Text(
                              "Part Name",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                              label: Text("Notch",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(
                                label: Text("Shape",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Grain",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Placement",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Bowing",
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
                          color: Colors.blueAccent,
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
                          color: Colors.redAccent,
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              print(controllers.length);
                              rows--;
                              if (rows >= 0) {
                                rowList.removeLast();
                                [1, 2, 3, 4, 5, 6].forEach((element) {
                                  controllers.removeLast();
                                });
                              } else {
                                rows = 0;
                              }
                            });
                          },
                        ),
                        IconButton(
                          color: Colors.green,
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
                        'lay_number': layNo.value.text,
                        'size': size.value.text,
                        'total_part_checked': totalPartChecked.value.text,
                        'pass': pass.value.text,
                        'fail': fail.value.text,
                        'table': tableList
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
            ),
          ),
        ),
      ),
    );
  }
}
