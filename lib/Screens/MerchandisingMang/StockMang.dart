import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController fabDetails = TextEditingController(), availFabric  = TextEditingController(),
   trimDetails = TextEditingController(), availTrim  = TextEditingController();

  bool exist = false;

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
                  RaisedButton(onPressed: () async {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Fetching")));

                    try {
                      await Firestore.instance.collection('aarvi').document(mycontroller.value.text).get().then((value){
                      if(value.exists){
                        var data = value.data;
                        fabDetails.text = data['fabric_details'];
                        availFabric.text = data['fabric_available'];
                        trimDetails.text = data['trim_details'];
                        availTrim.text = data['trim_available'];
                        exist = true;
                      }
                    });
                    } catch (e) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                    if(exist)
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Done")));



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
                                          controller: fabDetails,
                                          decoration:
                                              TextFieldDec.inputDec("Enter Details"),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text("Fabric Available: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: availFabric,
                                          decoration:
                                              TextFieldDec.inputDec("Enter Amount"),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text("Trim Detials: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: trimDetails,
                                          decoration:
                                              TextFieldDec.inputDec("Enter Details"),
                                        ),
                                        SizedBox(height: 10.0),
                                        
                                        Text("Trim Available: "),
                                        SizedBox(height: 10.0),
                                        TextFormField(
                                          controller: availTrim,
                                          decoration:
                                              TextFieldDec.inputDec("Enter Amount"),
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                        onPressed: () async {
                                          try {
                                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Updating"),));
                                            await Firestore.instance.collection('aarvi').document(mycontroller.value.text)
                                            .updateData({
                                              'fabric_details':fabDetails.value.text,
                                              'fabric_available':availFabric.value.text,
                                              'trim_details':trimDetails.value.text,
                                              'trim_available':availTrim.value.text
                                            });
                                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Done"),));
                                          } catch (e) {
                                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString()),));
                                          }
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
