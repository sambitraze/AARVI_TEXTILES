import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyProductionReport extends StatefulWidget {
  @override
  _DailyProductionReportState createState() => _DailyProductionReportState();
}
InputDecoration inputDec(String labelText){
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
SizedBox leaveSpace(){
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
  DateTime date;

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
                  decoration: inputDec("Style Number"),
                  controller: styleNo,
                  onEditingComplete: () async {
                    await Firestore.instance.collection('aarvi').document(styleNo.text).get().then((value) {
                      if(value.exists){
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
                  decoration: inputDec("Buyer"),
                  controller: buyer,
                  enabled: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: inputDec("Date"),
                  onChanged: (val) => date = val as DateTime,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: orderQty,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Cut Pieces Received"),
                  controller: totalCut,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Stitch"),
                  controller: todayStitch,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Till Date Stitch"),
                  controller: totalStitch,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Balance"),
                  controller: sewingBalance,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Send to Finsihing"),
                  controller: todayFinish,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Send to Finishing"),
                  controller: totalFinish,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Finishing Balance"),
                  controller: finishBalance,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit") ,
                  onPressed: () async {

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