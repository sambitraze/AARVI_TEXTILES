import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PolybagSup extends StatefulWidget {
  @override
  _PolybagSupState createState() => _PolybagSupState();
}

class _PolybagSupState extends State<PolybagSup> {
  String supplierType;
    DropdownButton _hintDown() => DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            value: "Nominated",
            child: Text(
              "Nominated",
            ),
          ),
          DropdownMenuItem<String>(
            value: "Non-Nominated",
            child: Text(
              "Non-Nominated",
            ),
          ),
        ],
        onChanged: (value) {
          print("value: $value");
          setState(() {
            value = value;
          });
          supplierType = value;
        },
        hint: Text(
          "Please select Supplier type!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
      String supplierName;
      final suppliernameController = TextEditingController();
  final nominatedSupplierController = TextEditingController();
  final nonNominatedSupplierController = TextEditingController();
  String nominatedMessage = '';
  String nonNominatedMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polybag Suppliers')),
      body: Center(
        child:Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  controller: nominatedSupplierController,
                  decoration: InputDecoration(
                    labelText: "Enter Nominated Supplier",
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.brown,width: 2)
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                    child: Text("Search"),
                    onPressed: () async {
                      List nominated = [];
                      Firestore.instance
                          .collection('supplier')
                          .where('nominated', isEqualTo: true)
                          .where('type',isEqualTo: 'Polybag')
                          .snapshots()
                          .listen((event) {
                        event.documents
                            .forEach((element) => nominated.add(element['name']));
                        if (nominated
                            .contains(nominatedSupplierController.value.text)) {
                          print("Nominated");
                        }
                      });
                    },
                  ),
                SizedBox(height: 10,),
                TextField(
                  controller: nonNominatedSupplierController,
                  decoration: InputDecoration(
                    labelText: "Enter  Non-Nominated Supplier",
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.brown,width: 2)
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                    child: Text("Search"),
                    onPressed: () async {
                      List notNominated = [];
                      Firestore.instance
                          .collection('supplier')
                          .where('nominated', isEqualTo: false)
                          .where('type',isEqualTo: 'Polybag')
                          .snapshots()
                          .listen((event) {
                        event.documents
                            .forEach((element) => notNominated.add(element['name']));
                        if (notNominated
                            .contains(nonNominatedSupplierController.value.text)) {
                          print("Not-Nominated");
                        }
                      });
                    },
                  ),
                SizedBox(height: 10,),
                RaisedButton(
                    child: Text("Add Supplier"),
                    onPressed: () async {
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text('Add Supplier'),
                        content: new Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextField(
                                controller: suppliernameController,
                                decoration: InputDecoration(
                                  labelText: "Enter Name of Supplier",
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color:Colors.brown,width: 2)
                                  ),
                                ),
                                onChanged: (suppliernameController) {
                                  supplierName = suppliernameController.toString();
                                  print("$supplierName");
                                },
                              ),
                              SizedBox(height: 10,),
                              _hintDown(),
                              RaisedButton(
                                onPressed: () async {
                                  await Firestore.instance
                                      .collection('supplier')
                                      .document(
                                      suppliernameController.value.text)
                                      .setData({
                                    'name': suppliernameController.value.text,
                                    'nominated': supplierType == 'Nominated'
                                        ? true
                                        : false,
                                    'type':"Polybag"
                                  });
                                },
                                child: Text('Add'),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
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
                  ),
              ],
            ),
          ),
        )
      ),
    );
  }
}