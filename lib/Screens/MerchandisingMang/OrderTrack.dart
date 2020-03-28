import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class OrderTrack extends StatefulWidget {
  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
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
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                    enabled: _textEnabled,
                    controller: _styleController,
                    decoration: TextFieldDec.inputDec("Style No"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text("Fetch"),
                    onPressed: () async {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(_styleController.value.text)
                          .get()
                          .then((value) {
                        if (value.exists) {
                          print("HEY");
                          _update = true;
                          buyer.text = value.data['buyer'].toString() ?? '';
                          totalPieces.text = value.data['order_quantity'] ?? '';
                          if (value.data['order_confirmation_date'] == null)
                            orderedDate = null;
                          else
                            orderedDate = (value.data['order_confirmation_date']
                                    as Timestamp)
                                .toDate();
                          if (value.data['order_dispatch_date'] == null)
                            dispatchedDate = null;
                          else
                            dispatchedDate =
                                (value.data['order_dispatch_date'] as Timestamp)
                                    .toDate();
                          orderStatus.text = value.data['order_status'] ?? '';
                        } else {
                          _update = false;
                        }
                      });
                      if (!_update)
                        _snackBarKey.currentState.showSnackBar(SnackBar(
                          content: Text("Style does not exist"),
                        ));
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: buyer,
                    keyboardType: TextInputType.multiline,
                    decoration: TextFieldDec.inputDec("Buyer"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: totalPieces,
                    keyboardType: TextInputType.number,
                    decoration: TextFieldDec.inputDec("Total pieces to be cut"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('$orderedDate'),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                onChanged: (orderedDate) {
                              print('change $orderedDate in time zone ' +
                                  orderedDate.timeZoneOffset.inHours
                                      .toString());
                            }, onConfirm: (val) {
                              print('confirm $val');
                              setState(() {
                                orderedDate = val;
                              });
                            }, currentTime: DateTime.now());
                          },
                          child: Text(
                            'Set Order\nConfirmationDate',
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                      
                  Text('$dispatchedDate'),
                      SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            onChanged: (dispatchedDate) {
                          print('change $dispatchedDate in time zone ' +
                              dispatchedDate.timeZoneOffset.inHours.toString());
                        }, onConfirm: (val) {
                          print('confirm $val');
                          setState(() {
                            dispatchedDate = val;
                          });
                        }, currentTime: DateTime.now());
                      },
                      child: Text(
                        'Set Order\nDispatchDate',
                        textAlign: TextAlign.center,
                      )),
                  
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // add dropdown
                    controller: orderStatus,
                    keyboardType: TextInputType.multiline,
                    decoration: TextFieldDec.inputDec("Status of order"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      _snackBarKey.currentState.showSnackBar(SnackBar(
                      content: Text("Uploading"),
                    ));
                      try {
                        await Firestore.instance
                          .collection('aarvi')
                          .document(_styleController.value.text)
                          .updateData({
                        'order_confirmation_date': orderedDate,
                        'order_dispatch_date': dispatchedDate,
                        'order_status': orderStatus.value.text
                      });
                      } catch (e) {
                      _snackBarKey.currentState.showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                    }
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
