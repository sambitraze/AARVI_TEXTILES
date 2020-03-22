import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';


class FabricEnquiry extends StatefulWidget {
  @override
  _FabricEnquiryState createState() => _FabricEnquiryState();
}

class _FabricEnquiryState extends State<FabricEnquiry> {
  final mycontroller = TextEditingController();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text('Fabric Enquiry')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: mycontroller,
              decoration:TextFieldDec.inputDec("Style No"),
            ),
            RaisedButton(
                onPressed: () async {
                  Styles s = Styles.getObjectFromStyleNo(styleNo: mycontroller.value.text);
                  if(await s.getFabricDetails() == true){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text('Fabric Enquiry'),
                          content: new Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Style No: ' + s.styleNo),
                                Text('Buyer: ' + s.buyer),
                                Text('Fabric Details: ' + s.fabricDetails),
                                Text('GSM: ' + s.gsm),
                                Text('Print Details: ' + s.printDetails),
                                Text('Washing Details: ' + s.washingDetails),
                                Text('Total Fabric Required: ' + s.totalFabricReq),
                                Text('Total Defected Fabric: ' + s.totalDefectedFabric),
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
                  }
                  else{
                   _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Style does not exist"),));
                  }
                },
                child: Text('Search and Enquire'),
              ),
          ],
        ),
      ),
    );
  }
}