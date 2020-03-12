import 'package:flutter/material.dart';

class MachineReq extends StatefulWidget {
  @override
  _MachineReqState createState() => _MachineReqState();
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
class _MachineReqState extends State<MachineReq> {
  String styleNo,buyer,orderQty,numberOfOperations,machineType,totalMachineReq;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Machine Requirements    ")),
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
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => orderQty = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Number of Operation"),
                  onChanged: (val) => numberOfOperations = val,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Machine Type"),
                  onChanged: (val)=> machineType = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Machine Required"),
                  onChanged: (val) => totalMachineReq = val,
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