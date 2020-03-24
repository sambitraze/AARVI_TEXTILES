import 'package:aarvi_textiles/services/textfieldBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CutOrderPlan extends StatefulWidget {
  @override
  _CutOrderPlanState createState() => _CutOrderPlanState();
}

class _CutOrderPlanState extends State<CutOrderPlan> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final orderQuantity = TextEditingController();
  final color = TextEditingController();
  final lays = TextEditingController();
  final piles = TextEditingController();

  final xssize = TextEditingController();
  final ssize = TextEditingController();
  final msize = TextEditingController();
  final lsize = TextEditingController();
  final xlsize = TextEditingController();
  final xxlsize = TextEditingController();
  final xxsize = TextEditingController();

  var controllersList = List<List<TextEditingController>>();
  var _rows = [
    TableRow(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
          child: Text(
            "Lays",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('XS')
      ]),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('S')
      ]),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('M')
      ]),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('L')
      ]),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('XL')
      ]),
      Column(children: [
        Icon(
          Icons.accessibility_new,
          size: 50.0,
        ),
        Text('XXL')
      ]),
    ]),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Cut Order plan')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                controller: styleNo,
                decoration: TextFieldDec.inputDec("Style No"),
                onEditingComplete: () async {
                  var listOfStrings = [];
                  await Firestore.instance
                      .collection('aarvi')
                      .document(styleNo.value.text)
                      .get()
                      .then((value) {
                    if (value.exists) {
                      var data = value.data;
                      orderQuantity.text = data['order_quantity'] ?? '';
                      color.text = data['cutting_colour'] ?? '';
                      lays.text = data['cutting_no_of_lays'] ?? '0';
                      piles.text = data['cutting_piles_per_day'] ?? '';
                      xssize.text = data['sizes']['xs'] ?? '';
                      msize.text = data['sizes']['m'] ?? '';
                      ssize.text = data['sizes']['s'] ?? '';
                      lsize.text = data['sizes']['l'] ?? '';
                      xlsize.text = data['sizes']['xl'] ?? '';
                      xxlsize.text = data['sizes']['xxl'] ?? '';
                      listOfStrings = data['lays_table'];
                      for (int i = 0; i < (listOfStrings.length); i = i + 6) {
                        var textControllers = List<TextEditingController>();
                        for (int j = 0; j < 6; ++j) {
                          textControllers.add(TextEditingController(
                              text: (listOfStrings[i + j] ?? '0')));
                        }
                        controllersList.add(textControllers);
                        setState(() {
                          _rows.add(TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              child: Text(
                                i.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              controller: controllersList.last[0],
                            ),
                            TextFormField(
                              controller: controllersList.last[1],
                            ),
                            TextFormField(
                              controller: controllersList.last[2],
                            ),
                            TextFormField(
                              controller: controllersList.last[3],
                            ),
                            TextFormField(
                              controller: controllersList.last[4],
                            ),
                            TextFormField(
                              controller: controllersList.last[5],
                            )
                          ]));
                        });
                      }
                    }
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: orderQuantity,
                decoration: TextFieldDec.inputDec("Order Quantity"),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: color,
                decoration: TextFieldDec.inputDec("Colour"),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: lays,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  labelText: "Enter No of Lays",
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.blueAccent,
                        onPressed: () {
                          lays.text = ((int.tryParse(lays.value.text) ?? 0) + 1)
                              .toString();
                          var textControllers = List<TextEditingController>();
                          for (int i = 0; i < 6; ++i) {
                            textControllers.add(TextEditingController());
                          }
                          controllersList.add(textControllers);
                          setState(() {
                            _rows.add(TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                child: Text(
                                  lays.value.text,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFormField(
                                controller: controllersList.last[0],
                              ),
                              TextFormField(
                                controller: controllersList.last[1],
                              ),
                              TextFormField(
                                controller: controllersList.last[2],
                              ),
                              TextFormField(
                                controller: controllersList.last[3],
                              ),
                              TextFormField(
                                controller: controllersList.last[4],
                              ),
                              TextFormField(
                                controller: controllersList.last[5],
                              )
                            ]));
                          });
                        },
                      ),
                      IconButton(
                          color: Colors.redAccent,
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            var number = int.tryParse(lays.value.text);
                            if (number <= 0)
                              lays.text = "0";
                            else {
                              lays.text = (--number).toString();
                              setState(() {
                                if (_rows.length > 1) {
                                  _rows.removeLast();
                                  controllersList.removeLast();
                                }
                              });
                            }
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: piles,
                decoration: TextFieldDec.inputDec("No of Piles Per Day"),
              ),
              SizedBox(height: 10.0),              
              SizedBox(height: 10.0),
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('XS')
                    ]),
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('S')
                    ]),
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('M')
                    ]),
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('L')
                    ]),
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('XL')
                    ]),
                    Column(children: [
                      Icon(
                        Icons.accessibility_new,
                        size: 50.0,
                      ),
                      Text('XXL')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xssize,
                      )
                    ]),
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: ssize,
                      )
                    ]),
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: msize,
                      )
                    ]),
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: lsize,
                      )
                    ]),
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xlsize,
                      )
                    ]),
                    Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xxlsize,
                      )
                    ]),
                  ]),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Table(
                border: TableBorder.all(),
                children: _rows,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Uploading"),
                  ));
                  Map<String, dynamic> stylesList = {
                    'xs': xssize.value.text,
                    's': ssize.value.text,
                    'm': msize.value.text,
                    'l': lsize.value.text,
                    'xl': xlsize.value.text,
                    'xxl': xxlsize.value.text
                  };
                  var listOfStrings = [];
                  controllersList.forEach((element) {
                    element.forEach((_element) {
                      listOfStrings.add(_element.value.text);
                    });
                  });
                  await Firestore.instance
                      .collection("aarvi")
                      .document(styleNo.text)
                      .updateData({
                    'order_quantity': orderQuantity.value.text,
                    'cutting_colour': color.value.text,
                    'cutting_no_of_lays': lays.value.text,
                    'cutting_piles_per_day': piles.value.text,
                    'sizes': stylesList,
                    'lays_table': listOfStrings,
                  });
                  scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Done"),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
