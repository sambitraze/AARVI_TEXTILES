import 'package:flutter/material.dart';
class FinishingPage extends StatefulWidget {
  @override
  _FinishingPageState createState() => _FinishingPageState();
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
class _FinishingPageState extends State<FinishingPage> {
  String date;
  String styleNo;
  String buyer;
  String qty;
  String todayrs; //Today received from sewing
  String totalrs; //Total received from sewing
  String balance;
  String totalInspected;
  String totalRework;
  String totalSendToPress;
  String totalSendToButtonAttach;
  String totalSendToPacking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aarvi Textiles")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: inputDec("Date"),
                  onChanged: (val) => date = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Product/Style Number"),
                  onChanged: (val) => styleNo = val,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: inputDec("Buyer"),
                  onChanged: (val) => buyer = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => qty = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Received from Finishing"),
                  onChanged: (val) => todayrs = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Received from Finishing"),
                  onChanged: (val)=> totalrs = val,
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
                  decoration: inputDec("Total Inspected Piece"),
                  onChanged: (val) => totalInspected = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Rework Piece"),
                  onChanged: (val) => totalRework = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Send to Pressing"),
                  onChanged: (val) => totalSendToPress = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Send to Button Attach"),
                  onChanged: (val) => totalSendToButtonAttach = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Send to Packaging"),
                  onChanged: (val) => totalSendToPacking = val,
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
