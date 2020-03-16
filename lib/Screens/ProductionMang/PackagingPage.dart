import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackagingPage extends StatefulWidget {
  @override
  _PackagingPageState createState() => _PackagingPageState();
}

InputDecoration inputDec(String labelText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    labelText: labelText,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown, width: 2.0),
    ),
  );
}

SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

class _PackagingPageState extends State<PackagingPage> {
  final dateController = TextEditingController();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final qty = TextEditingController();
  final todayrf = TextEditingController(); //Today received from finishing
  final totalrf = TextEditingController(); //Total received from finishing
  final balance = TextEditingController();
  final totalPack = TextEditingController();
  final todayDispatch = TextEditingController();
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(title: Text("Packing-Production Management")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: inputDec("Product/Style Number"),
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance
                        .collection('aarvi')
                        .document(value)
                        .get()
                        .then((value) {
                      if (value.exists) {
                        var data = value.data;
                        buyer.text = data['buyer'] ?? '';
                        qty.text = data['order_quantity'] ?? '';
                        totalrf.text = data['total_send_packing'] ?? '';
                        balance.text = data['packing_balance'] ?? '';
                        totalPack.text = data['total_pack'];
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  format: DateFormat('dd-MM-yyyy'),
                  decoration: inputDec("Date"),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2100));
                    Firestore.instance
                        .collection('aarvi')
                        .document(styleNo.value.text)
                        .collection('Packing')
                        .document(DateFormat('dd-MM-yyyy').format(dat))
                        .get()
                        .then((value) {
                      if (value.exists) {
                        var data = value.data;
                        todayrf.text = data['today_received_finishing'];
                        todayDispatch.text = data['today_dispatch'];
                      }
                    });
                    setState(() {});
                    return dat;
                  },
                  controller: dateController,
                ),
                TextFormField(
                  decoration: inputDec("Buyer"),
                  controller: buyer,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: qty,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Received from Finishing"),
                  controller: todayrf,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Received from Finishing"),
                  controller: totalrf,
                  keyboardType: TextInputType.number,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Balance"),
                  controller: balance,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Packed"),
                  controller: totalPack,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Dispatch"),
                  controller: todayDispatch,
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    scaffoldState.currentState.showSnackBar((SnackBar(content: Text("Uploading"),)));
                    try{
                      await Firestore.instance.collection('aarvi').document(styleNo.value.text).updateData({
                        'packing_balance':balance.value.text,
                        'total_pack':totalPack.value.text
                      });
                      await Firestore.instance.collection('aarvi').document(styleNo.value.text).
                        collection('Packing').document(dateController.value.text).setData({
                        'today_dispatch':todayDispatch.value.text,
                        'today_received_finishing':todayrf.value.text
                      });
                    }catch(e){
                      scaffoldState.currentState.showSnackBar((SnackBar(content: Text(e.toString()),)));
                    }
                    scaffoldState.currentState.showSnackBar((SnackBar(content: Text("Done!"),)));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
