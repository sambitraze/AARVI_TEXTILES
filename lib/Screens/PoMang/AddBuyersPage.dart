import 'package:aarvi_textiles/Screens/PoMang/Buyer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

InputDecoration inputDec(String labelText) {
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

SizedBox leaveSpace() {
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
  final xssize = TextEditingController();
  final ssize = TextEditingController();
  final msize = TextEditingController();
  final lsize = TextEditingController();
  final xlsize = TextEditingController();
  final xxlsize = TextEditingController();

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
                  keyboardType: TextInputType.number,
                  decoration: inputDec("Product/Style Number"),
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
                  //add table for diff size
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec('Fabric Details'),
                  onChanged: (val) => fabricDetails = val,
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
                  onChanged: (val) => labelDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: inputDec("Price in ₹"),
                  onChanged: (val) => price = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Packing Details"),
                  onChanged: (val) => packingDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Shipping Address"),
                  onChanged: (val) => shippingDetails = val,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Other"),
                  onChanged: (val) => other = val,
                ),
                leaveSpace(),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('XS')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('S')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('M')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('L')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('XL')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.accessibility_new,
                          size: 50.0,
                        ),
                        Text('XXL')
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: xssize,
                        )
                      ]),
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: ssize,
                        )
                      ]),
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: msize,
                        )
                      ]),
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: lsize,
                        )
                      ]),
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: xlsize,
                        )
                      ]),
                      Column(children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: xxlsize,
                        )
                      ]),
                    ]),
                  ],
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    Buyer buyer = Buyer(
                      name: name,
                      style: style,
                      desc: description,
                      quantity: quantity,
                      sizeBreakup: sizeBreakup,
                      fabricDetails: fabricDetails,
                      printDetails: printDetails,
                      washingDetails: washingDetails,
                      labelDetails: labelDetails,
                      price: price,
                      packingDetails: packingDetails,
                      address: shippingDetails,
                      other: other,
                    );
                    await buyer.setData();
                    await Firestore.instance
                        .collection('aarvi')
                        .document(style)
                        .updateData({
                      'order_sizes': {
                        'xs': xssize.value.text,
                        's': ssize.value.text,
                        'm': msize.value.text,
                        'l': lsize.value.text,
                        'xl': xlsize.value.text,
                        'xxl': xxlsize.value.text
                      }
                    });
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
