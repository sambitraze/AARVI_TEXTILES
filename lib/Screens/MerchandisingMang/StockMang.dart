import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class StockMang extends StatefulWidget {
  @override
  _StockMangState createState() => _StockMangState();
}

class _StockMangState extends State<StockMang> {
  final mycontroller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Styles s;

  String fabDetails;
  String availFabric;
  String trimDetails;
  String availTrim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Stock Management')),
        body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: mycontroller,
                    decoration: TextFieldDec.inputDec("Style No"),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(onPressed: () {
                    //TODO: get data from db and initialise four variables.
                  }, child: Text('Search')),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: AlertDialog(
                                  title: new Text('STOCK'),
                                  content: new Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Fabric Detials: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration:
                                              TextFieldDec.inputDec("ENter Details"),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text("Fabric Available: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration:
                                              TextFieldDec.inputDec("Enter Amount"),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text("Trim Detials: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration:
                                              TextFieldDec.inputDec("Enter Details"),
                                        ),
                                        SizedBox(height: 10.0),
                                        
                                        Text("Trim Available: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          decoration:
                                              TextFieldDec.inputDec("Enter Amount"),
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
                                          //TODO: upload updated detials
                                        },
                                        child: new Text('update')),
                                    new FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: new Text('close'))
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text('View')),
                ],
              )),
        ));
  }
}
