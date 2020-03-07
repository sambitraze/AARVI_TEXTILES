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
  String orderStatus;
  String buyer;
  final _snackBarKey = GlobalKey<ScaffoldState>();
  bool _update = true;
  String totalPieces;
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
                      s = await Styles.getCuttingFromStyleNo(_styleController.value.text);
                      if(s == null){
                        _update = false;
                        print("No record");
                      }
                      else
                        setState(() {
                          print("Exist");
                        });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: 'xyz',
                    onChanged: (val) => buyer = val,
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
                    initialValue: (totalPieces ?? 0).toString(),
                    onChanged: (val) => totalPieces = val,
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
                    onConfirm: (orderedDate) {
                      print('confirm $orderedDate');
                    },
                    currentTime: DateTime(2020, 3, 1, 23, 12, 34));
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
                    onConfirm: (dispatchedDate) {
                      print('confirm $dispatchedDate');
                    },
                    currentTime: DateTime(2020, 3, 1, 23, 12, 34));
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
                    initialValue: 'on its way',
                    onChanged: (val) => buyer = val,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}