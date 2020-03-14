import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class OrderTrack extends StatefulWidget {
  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  final _formKey = GlobalKey<FormState>();
  final _styleController = TextEditingController();
  bool _textEnabled = true;
  DateTime orderedDate;
  DateTime dispatchedDate;
  final orderStatus = TextEditingController();
  final buyer = TextEditingController();
  final _snackBarKey = GlobalKey<ScaffoldState>();
  bool _update = true;
  final totalPieces = TextEditingController();
  Styles s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      appBar: AppBar(title: Text('Order Tracking')),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,30,20,20),
              child: Column(
                children: <Widget>[
                  SizedBox(height:10),
                  TextFormField(
                    enabled: _textEnabled,
                    controller: _styleController,
                    decoration: InputDecoration(
                      labelText: "Enter Style",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                   SizedBox(height: 10,),
                  RaisedButton(
                    child: Text("Fetch"),
                    onPressed: () async {
                      await Firestore.instance.collection('aarvi').document(_styleController.value.text).get().then((value) {
                        if(value.exists){
                          print("HEY");
                          _update = true;
                          buyer.text = value.data['buyer'].toString() ?? '';
                          totalPieces.text = value.data['order_quantity'] ?? '';
                          if(value.data['order_confirmation_date']==null)
                            orderedDate = null;
                          else
                            orderedDate = (value.data['order_confirmation_date'] as Timestamp).toDate();
                          if(value.data['order_dispatch_date']==null)
                            dispatchedDate = null;
                          else
                            dispatchedDate = (value.data['order_dispatch_date'] as Timestamp).toDate();
                          orderStatus.text = value.data['order_status'] ?? '';
                        }
                        else{
                          _update = false;
                        }
                      });
                      if(!_update)
                       _snackBarKey.currentState.showSnackBar(SnackBar(content: Text("Style does not exist"),));
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: buyer,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "Name of Buyer",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: totalPieces,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Total Pieces to be Cut",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                    DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (orderedDate) {
                        print('change $orderedDate in time zone ' +
                        orderedDate.timeZoneOffset.inHours.toString());
                    }, 
                    onConfirm: (val) {
                      print('confirm $val');
                      setState(() {
                        orderedDate = val;
                      });
                    },
                    currentTime: DateTime.now());
                  },
                  child: Text(
                    'set Order ConfirmationDate',
                    style: TextStyle(color: Colors.blue),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('$orderedDate'),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                    DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (dispatchedDate) {
                        print('change $dispatchedDate in time zone ' +
                        dispatchedDate.timeZoneOffset.inHours.toString());
                    }, 
                    onConfirm: (val) {
                      print('confirm $val');
                      setState(() {
                        dispatchedDate = val;
                      });
                    },
                    currentTime: DateTime.now());
                  },
                  child: Text(
                    'set Order DispatchDate',
                    style: TextStyle(color: Colors.blue),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('$dispatchedDate'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // add dropdown
                    controller: orderStatus,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "Status of order",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      await Firestore.instance.collection('aarvi').document(_styleController.value.text).updateData({
                        'order_confirmation_date':orderedDate,
                        'order_dispatch_date':dispatchedDate,
                        'order_status':orderStatus.value.text
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}