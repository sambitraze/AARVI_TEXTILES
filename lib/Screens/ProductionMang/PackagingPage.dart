import 'package:flutter/material.dart';
class PackagingPage extends StatefulWidget {
  @override
  _PackagingPageState createState() => _PackagingPageState();
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
class _PackagingPageState extends State<PackagingPage> {
  String date;
  String styleNo;
  String buyer;
  String qty;
  String todayrf; //Today received from finishing
  String totalrf; //Total received from finishing
  String balance;
  String totalPack;
  String todayDispatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Packing-Production Management")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
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
                  onChanged: (val) => todayrf = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Received from Finishing"),
                  onChanged: (val)=> totalrf = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Balance"),
                  onChanged: (val) => balance = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Packed"),
                  onChanged: (val) => totalPack = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Today Dispatch"),
                  onChanged: (val) => todayDispatch = val,
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
