import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class OpBulletin extends StatefulWidget {
  final String style;
  final String date;
  OpBulletin({this.style, this.date});

  @override
  _OpBulletinState createState() => _OpBulletinState();
}

var controllers = List<TextEditingController>();
var rowList = List<DataRow>();

SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

DataRow getRow(int index, {bool newController = true}) {
  var list = List<DataCell>();
  index = index * 8;
  for (int i = index; i < index + 8; ++i) {
    newController
        ? controllers.add(TextEditingController())
        : print("Not New Controller");
    list.add(DataCell(TextField(
      controller: controllers[i],
    )));
  }
  return DataRow(cells: list);
}

class _OpBulletinState extends State<OpBulletin> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  int rows = 0;
  TextEditingController srlNo = TextEditingController(),
      operationName = TextEditingController(),
      machineType = TextEditingController(),
      sample = TextEditingController(),
      noofOperator = TextEditingController(),
      noofMachihne = TextEditingController(),
      hourlyTarget = TextEditingController(),
      comments = TextEditingController();

  TextEditingController buyer = TextEditingController(),
      garment = TextEditingController(),
      orderQty = TextEditingController(),
      efficency = TextEditingController(),
      target = TextEditingController();
  final styleNo = TextEditingController();
  final date = TextEditingController();

  List<DataRow> getRows() {
    for (int i = 0; i < rows; ++i) rowList.add(getRow(i));
    return rowList;
  }

  fetchStyle(value) async {
    await Firestore.instance
        .collection('aarvi')
        .document(value)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          buyer.text = value.data['buyer'];
          orderQty.text = value.data['order_quantity'];
          efficency.text = value.data['effeciency'];
          garment.text = value.data['garment'];
        });
      }
    });
  }

  void fetchDateStr(String dat) async {
    try {
      await Firestore.instance
          .collection('aarvi')
          .document(styleNo.value.text)
          .collection('OperationBulletin')
          .document(dat)
          .get()
          .then((value) {
        if (value.exists) {
          var data = value;
          efficency.text = data['efficiency'] ?? '';
          target.text = data['target'] ?? '';
          int len = 0;
          data['table'].forEach((element) {
            len++;
          });
          for (int i = 0; i < len; i = i + 8) {
            for (int j = i; j < i + 8; ++j) {
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
    } finally {
      setState(() {});
    }
  }

  @override
  void initState() {
    if (widget.date != null && widget.style != null) {
      styleNo.text = widget.style;
      date.text = widget.date;
      fetchDateStr(widget.date);
      fetchStyle(widget.style);
    }
    rows = 0;
    controllers = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text('Operation bulletin')),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("Style Number"),
                  controller: styleNo,
                  onChanged: ((value) async {
                    await Firestore.instance
                        .collection('aarvi')
                        .document(value)
                        .get()
                        .then((value) {
                      if (value.exists) {
                        buyer.text = value.data['buyer'];
                        orderQty.text = value.data['order_quantity'];
                        efficency.text = value.data['effeciency'];
                        garment.text = value.data['garment'];
                      }
                    });
                  }),
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: buyer,
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
                            .collection('OperationBulletin')
                            .document(DateFormat('dd-MM-yyyy').format(dat))
                            .get()
                            .then((value) {
                          if (value.exists) {
                            var data = value;
                            efficency.text = data['efficiency'] ?? '';
                            target.text = data['target'] ?? '';
                            int len = 0;
                            data['table'].forEach((element) {
                              len++;
                            });
                            for (int i = 0; i < len; i = i + 8) {
                              for (int j = i; j < i + 8; ++j) {
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
                  decoration: TextFieldDec.inputDec("Garment"),
                  controller: garment,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Order Quantity"),
                  controller: orderQty,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Efficiency"),
                  controller: efficency,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Target"),
                  controller: target,
                ),
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
                                label: Text(
                              "SRL NO",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                              label: Text("Operation",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(
                                label: Text("Machine Type",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Sample",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("No of Operators",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("No of Machines",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Hourly Target",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Comments",
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
                                [1, 2, 3, 4, 5, 6, 7, 8].forEach((element) {
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
                      controllers.forEach((element) {
                        print(element.text);
                      });
                      await Firestore.instance
                          .collection('aarvi')
                          .document(int.parse(styleNo.value.text.toString())
                              .toString())
                          .collection('OperationBulletin')
                          .document(date.value.text)
                          .setData({
                        'effeciency': efficency.value.text,
                        'target': target.value.text,
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
            )),
      ),
    );
  }
}
