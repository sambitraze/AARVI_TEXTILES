import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class Trimsup extends StatefulWidget {
  @override
  _TrimsupState createState() => _TrimsupState();
}

class _TrimsupState extends State<Trimsup> {
  String supplierType;
    DropdownButton _hintDown() => DropdownButton<String>(
        iconEnabledColor: Colors.blueAccent,
        icon: Icon(Icons.arrow_downward),
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
          "Supplier type!",
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
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trim Suppliers')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: nominatedSupplierController,
                  decoration: TextFieldDec.inputDec("Enter Nominated Supplier"),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                    child: Text("Search"),
                    onPressed: () async {
                      List nominated = [];
                      Firestore.instance
                          .collection('supplier')
                          .where('nominated', isEqualTo: true)
                          .where('type',isEqualTo: 'Trim')
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
                SizedBox(height: 50,),
                TextField(
                  controller: nonNominatedSupplierController,
                  decoration: TextFieldDec.inputDec("Enter Non-Nominated Supplier"),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                    child: Text("Search"),
                    onPressed: () async {
                      print("Searching");
                      List notNominated = [];
                      Firestore.instance
                          .collection('supplier')
                          .where('nominated', isEqualTo: false)
                          .where('type',isEqualTo: 'Trim')
                          .snapshots()
                          .listen((event) {
                        event.documents
                            .forEach((element) => notNominated.add(element['name']));
                        print(notNominated);
                        if (notNominated
                            .contains(nonNominatedSupplierController.value.text)) {
                          print("Not-Nominated");
                        }
                      });
                    },
                  ),
                SizedBox(height: 80,),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextField(
                                controller: suppliernameController,
                                decoration: TextFieldDec.inputDec("Name of Supplier"),
                                onChanged: (suppliernameController) {
                                  supplierName = suppliernameController.toString();
                                  print("$supplierName");
                                },
                              ),
                              TextField(
                                controller: addressController,
                                decoration: TextFieldDec.inputDec("Address"),
                              ),
                              SizedBox(height: 80,),
                              _hintDown(),                              
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
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
                                    'type':"Trim",
                                    'address':addressController.value.text
                                  });
                                },
                                child: Text('Add'),
                          ),
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
        ),
      )
    );
  }
}