import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class FinishingPage extends StatefulWidget {
  @override
  _FinishingPageState createState() => _FinishingPageState();
}

SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

class _FinishingPageState extends State<FinishingPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final dateController = TextEditingController();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final qty = TextEditingController();
  final todayrs = TextEditingController(); //Today received from sewing
  final totalrs = TextEditingController(); //Total received from sewing
  final balance = TextEditingController();
  final totalInspected = TextEditingController();
  final totalRework = TextEditingController();
  final totalSendToPress = TextEditingController();
  final totalSendToButtonAttach = TextEditingController();
  final totalSendToPacking = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(title: Text("Finishing-Production Management")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: <Widget>[
                DateTimeField(
                  format: DateFormat('dd-MM-yyyy'),
                  decoration: TextFieldDec.inputDec("Date"),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2100));
                    setState(() {});
                    return dat;
                  },
                  controller: dateController,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Product/Style Number"),
                  controller: styleNo,
                  onEditingComplete: () async {
                    await Firestore.instance
                        .collection('aarvi')
                        .document(styleNo.value.text)
                        .get()
                        .then((value) {
                      if (value.exists) {
                        var data = value.data;
                        buyer.text = data['buyer'] ?? '';
                        qty.text = data['order_quantity'] ?? '';
                        totalrs.text = data['total_sewing'] ?? '';
                        balance.text = data['finishing_balance'] ?? '';
                        totalInspected.text = data['finishing_total_inspected'];
                        totalRework.text = data['total_rework'] ?? '';
                        totalSendToPress.text =
                            data['total_send_pressing'] ?? '';
                        totalSendToButtonAttach.text =
                            data['total_send_button'] ?? '';
                        totalSendToPacking.text =
                            data['total_send_packing'] ?? '';
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: buyer,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: qty,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Today Received from Sewing"),
                  controller: todayrs,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Received from Sewing"),
                  controller: totalrs,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Balance"),
                  controller: balance,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Inspected Piece"),
                  controller: totalInspected,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Rework Piece"),
                  controller: totalRework,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Send to Pressing"),
                  controller: totalSendToPress,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Send to Button Attach"),
                  controller: totalSendToButtonAttach,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Send to Packaging"),
                  controller: totalSendToPacking,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Uploading"),
                    ));
                    try {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .updateData({
                        'finishing_balance': balance.value.text,
                        'finishing_total_inspected': totalInspected.value.text,
                        'total_rework': totalRework.value.text,
                        'total_send_pressing': totalSendToPress.value.text,
                        'total_send_button': totalSendToButtonAttach.value.text,
                        'total_send_packing': totalSendToPacking.value.text,
                      });
                      scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Done"),
                      ));
                    } catch (e) {
                      scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
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
