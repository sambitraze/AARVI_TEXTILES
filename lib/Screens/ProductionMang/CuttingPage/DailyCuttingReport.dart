import 'package:flutter/material.dart';

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
  String styleNo,buyer,orderQty,fabricReq,fabricRec,fabricBalance,todayCut,totalCut,cutBalance,todayIssuedSewing,
  totalIssuedSewing,sewingBalance;
  DateTime date;
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
                  onChanged: (val) => styleNo = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Buyer"),
                  onChanged: (val) => buyer = val,
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
                  onChanged: (val) => orderQty = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Required"),
                  onChanged: (val) => fabricReq = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Received"),
                  onChanged: (val)=> fabricRec = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fabric Balance"),
                  onChanged: (val) => fabricBalance = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Cut"),
                  onChanged: (val) => todayCut = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Cut"),
                  onChanged: (val) => totalCut = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Cut Balance"),
                  onChanged: (val) => cutBalance = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Issued to Sewing"),
                  onChanged: (val) => totalIssuedSewing = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Issued to Sewing"),
                  onChanged: (val) => totalIssuedSewing = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Sewing Balance"),
                  onChanged: (val) => sewingBalance = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit") ,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}