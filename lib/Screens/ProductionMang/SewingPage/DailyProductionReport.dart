import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class DailyProductionReport extends StatefulWidget {
  @override
  _DailyProductionReportState createState() => _DailyProductionReportState();
}



SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}

class _DailyProductionReportState extends State<DailyProductionReport> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final orderQty = TextEditingController();
  final totalCut = TextEditingController();
  final todayStitch = TextEditingController();
  final totalStitch = TextEditingController();
  final todayFinish = TextEditingController();
  final totalFinish = TextEditingController();
  final finishBalance = TextEditingController();
  final sewingBalance = TextEditingController();
  final date = TextEditingController();
  final garment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(title: Text("Daily Production Report")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("Style Number"),
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
                        orderQty.text = data['order_quantity'] ?? '0';
                        totalCut.text = data['total_issued_sewing'] ?? '0';
                        totalStitch.text = data['sewing_total_stitch'] ?? '0';
                        sewingBalance.text = data['sewing_balance'] ?? '0';
                        totalFinish.text = data['sewing_total_send_to_finish'];
                        finishBalance.text = data['finish_balance'];
                      }
                    });
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: buyer,
                  enabled: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: garment,
                  decoration: TextFieldDec.inputDec("Garment"),
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  format: DateFormat('dd-MM-yyyy'),
                  controller: date,
                  decoration: TextFieldDec.inputDec('Date'),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2100));
                    try{
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .collection('DailyProductionReport')
                          .document(DateFormat('dd-MM-yyyy').format(dat))
                          .get()
                          .then((value) {
                        if (value.exists) {
                          var data = value.data;
                          todayStitch.text = data['today_stitch'] ?? '';
                          todayFinish.text = data['today_send_finishing'] ?? '';
                        }
                      });
                    }catch(e){

                    }
                    setState(() {
                      print("Dat" + dat.toString());
                      print("control" + date.value.text);
                    });
                    return dat;
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: orderQty,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Cut Pieces Received"),
                  controller: totalCut,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Today Stitch"),
                  controller: todayStitch,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Till Date Stitch"),
                  controller: totalStitch,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Balance"),
                  controller: sewingBalance,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Today Send to Finsihing"),
                  controller: todayFinish,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Send to Finishing"),
                  controller: totalFinish,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Finishing Balance"),
                  controller: finishBalance,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    try {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .updateData({
                        'total_issued_sewing': totalCut.value.text,
                        'sewing_total_stitch': totalStitch.value.text,
                        'sewing_balance': sewingBalance.value.text,
                        'sewing_total_send_to_finish': totalFinish.value.text,
                        'finish_balance': finishBalance.value.text,
                      });
                      print(date.value.text);
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .collection('DailyProductionReport')
                          .document(date.value.text)
                          .setData({
                        'today_stitch': todayStitch.value.text,
                        'today_send_finishing': todayFinish.text
                      });
                    } catch (e) {}
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
