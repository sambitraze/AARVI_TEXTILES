import 'package:flutter/material.dart';

class SewingHourlyProduction extends StatefulWidget {
  @override
  _SewingHourlyProductionState createState() => _SewingHourlyProductionState();
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
class _SewingHourlyProductionState extends State<SewingHourlyProduction> {
  String styleNo,buyer,orderQty,totalCutPiecesRecieved,todayStitch,tillDateStitch,balance,todaySendToFinishing,totalSendToFinishing,finishingBalance;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Production Report")),
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
                  decoration: inputDec("Total Cut Pieces Received"),
                  onChanged: (val) => totalCutPiecesRecieved = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Stitch"),
                  onChanged: (val)=> todayStitch = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Till Date Stitch"),
                  onChanged: (val) => tillDateStitch = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Balance"),
                  onChanged: (val) => balance = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Send to Finsihing"),
                  onChanged: (val) => todaySendToFinishing = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Send to Finishing"),
                  onChanged: (val) => totalSendToFinishing = val,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Finishing Balance"),
                  onChanged: (val) => finishingBalance = val,
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