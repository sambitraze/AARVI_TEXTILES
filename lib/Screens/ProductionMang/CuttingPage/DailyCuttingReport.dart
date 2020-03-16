import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyCuttingReport extends StatefulWidget {
  @override
  _DailyCuttingReportState createState() => _DailyCuttingReportState();
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

class _DailyCuttingReportState extends State<DailyCuttingReport> {
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final orderQty = TextEditingController();
  final fabricReq = TextEditingController();
  final fabricRec = TextEditingController();
  final fabricBalance = TextEditingController();
  final todayCut = TextEditingController();
  final totalCut = TextEditingController();
  final cutBalance = TextEditingController();
  final todayIssuedSewing = TextEditingController();
  final totalIssuedSewing = TextEditingController();
  final sewingBalance = TextEditingController();
  int total;
  final date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Cutting Report")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: inputDec("Style Number"),
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance.collection('aarvi').document(value).get().then((value) {
                      if(value.exists){
                        print("Got");
                        var data = value.data;
                        buyer.text = data['buyer'] ?? '';
                        orderQty.text = data['order_quantity'] ?? '0';
                        fabricReq.text = data['fabric_required'] ?? '0';
                        fabricRec.text = data['fabric_received'] ?? '0';
                        fabricBalance.text = data['fabric_balance'] ?? '0';
                        totalCut.text = data['cutting_total_cut'] ?? '0';
                        total = int.parse(totalCut.text);
                        cutBalance.text = data['cut_balance'] ?? '0';
                        totalIssuedSewing.text = data['total_issued_sewing'] ?? '0';
                        sewingBalance.text = data['sewing_balance'] ?? '0';
                      }
                    });
                    setState(() {
                      print("HI");
                    });
                  },
                ),
                leaveSpace(),
                TextFormField(
                  enabled: false,
                  decoration: inputDec("Buyer"),
                  controller: buyer,
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeField(format: DateFormat('dd-MM-yyyy'),
                  controller: date,
                  decoration: inputDec("Date"),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(context: context, initialDate: DateTime.now(),
                     firstDate: DateTime(1970), lastDate: DateTime(2100));
                    await Firestore.instance.collection('aarvi').document(styleNo.value.text).collection('DailyCuttingReport').
                      document(DateFormat('dd-MM-yyyy').format(dat)).get().then((value) {
                        if(value.exists){
                          var data = value.data;
                          todayCut.text = data['today_cut'] ?? '';
                          todayIssuedSewing.text = data['today_issued_sewing'] ?? '';
                        }
                      });
                    setState(() {
                      print("Dat"+dat.toString());
                      print("control"+date.value.text);
                    });
                    return dat;
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: orderQty,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Required"),
                  controller: fabricReq,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Received"),
                  controller: fabricRec,
                  keyboardType: TextInputType.number,
                  onChanged: ((value){
                    fabricBalance.text = (int.parse(fabricReq.text) - int.parse(fabricRec.text)).toString();
                    setState(() {

                    });
                  }),
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Balance"),
                  controller: fabricBalance,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Cut"),
                  controller: todayCut,
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      totalCut.text = (int.parse(value) + total).toString();
                    });
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Cut"),
                  controller: totalCut,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Cut Balance"),
                  controller: cutBalance,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Issued to Sewing"),
                  controller: todayIssuedSewing,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Issued to Sewing"),
                  controller: totalIssuedSewing,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Sewing Balance"),
                  controller: sewingBalance,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit") ,
                  onPressed: () async {
                    await Firestore.instance.collection('aarvi').document(styleNo.value.text).collection('DailyCuttingReport')
                        .document(date.value.text).setData({
                      'fabric_required':fabricRec.value.text,
                      'fabric_received':fabricRec.value.text,
                      'fabric_balance':fabricBalance.value.text,
                      'today_cut':todayCut.value.text,
                      'cutting_total_cut':totalCut.value.text,
                      'cut_balance':cutBalance.value.text,
                      'today_issued_sewing':todayIssuedSewing.value.text,
                      'total_issued_sewing':totalIssuedSewing.value.text,
                      'sewing_balance':sewingBalance.value.text
                    });
                    //TODO do math part and fetching and date
                    await Firestore.instance.collection('aarvi').document(styleNo.value.text).updateData({
                      'fabric_required':fabricRec.value.text,
                      'fabric_received':fabricRec.value.text,
                      'fabric_balance':fabricBalance.value.text,
                      'cutting_total_cut':totalCut.value.text,
                      'cut_balance':cutBalance.value.text,
                      'total_issued_sewing':totalIssuedSewing.value.text,
                      
                    });
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