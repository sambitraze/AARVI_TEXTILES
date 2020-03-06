import 'package:aarvi_textiles/Screens/PoMang/Buyer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class AddBuyersPage extends StatefulWidget {
  @override
  _AddBuyersPageState createState() => _AddBuyersPageState();
}

class _AddBuyersPageState extends State<AddBuyersPage> {
  String name = '';
  String style = '';
  String description = '';
  String quantity = '';
  String sizeBreakup = '';
  String fabricDetails = '';
  String printDetails = '';
  String washingDetails = '';
  String labelDetails = '';
  String price = '';
  String packingDetails = '';
  String shippingDetails = '';
  String other = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Buyer"),
      ),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: inputDec("Buyer Name"),
                  onChanged: (val) => name = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Product/Style Name"),
                  onChanged: (val) => style = val,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: inputDec("Description"),
                  maxLines: 3,
                  onChanged: (val) => description = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => quantity = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Size Breakup"),
                  onChanged: (val) => sizeBreakup = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec('Fabric Details'),
                  onChanged: (val) => fabricDetails,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Print Details"),
                  onChanged: (val) => printDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec('Washing Details'),
                  onChanged: (val) => washingDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Label/Tag Details"),
                  onChanged: (val) => packingDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: inputDec("Price in ₹"),
                  onChanged: (val) => price = val,
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit") ,
                  onPressed: () async {
                    Buyer buyer = Buyer(name: name,style: style,desc: description,quantity: int.parse(quantity),sizeBreakup: sizeBreakup);
                    await buyer.setData();
                    Navigator.pop(context);
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