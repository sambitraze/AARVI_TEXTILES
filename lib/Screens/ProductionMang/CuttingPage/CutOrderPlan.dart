import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CutOrderPlan extends StatefulWidget {
  @override
  _CutOrderPlanState createState() => _CutOrderPlanState();
}

class _CutOrderPlanState extends State<CutOrderPlan> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final orderQuantity= TextEditingController();
  final color= TextEditingController();
  final lays= TextEditingController();
  final piles= TextEditingController();
  
  final xssize= TextEditingController();
  final ssize= TextEditingController();
  final msize= TextEditingController();
  final lsize= TextEditingController();
  final xlsize= TextEditingController();
  final xxlsize= TextEditingController();
  final xxsize= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Cut Order plan')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                controller: styleNo,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Style No"
                ),
                onEditingComplete:() async {
                  await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) {
                    if(value.exists){
                      var data = value.data;
                      orderQuantity.text = data['order_quantity'] ?? '';
                      color.text = data['color'] ?? '';
                      lays.text = data['cutting_no_of_lays'] ?? '';
                      piles.text = data['cutting_piles_per_day'] ?? '';
                      xssize.text = data['sizes']['xs'] ?? '';
                      msize.text = data['sizes']['m'] ?? '';
                      ssize.text = data['sizes']['s'] ?? '';
                      lsize.text = data['sizes']['l'] ?? '';
                      xlsize.text = data['sizes']['xl'] ?? '';
                      xxlsize.text = data['sizes']['xxl'] ?? '';
                    }
                  });
                } ,
              ),
              TextFormField(
                controller: orderQuantity,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Order Quantity"),
              ),
              TextFormField(
                controller: color,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Colour"),
              ),
              TextFormField(
                controller: lays,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter No of Lays"),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: piles,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter No of Plies Per Day"),
              ),
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow( children: [
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('XS')
                    ]),
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('S')
                    ]),
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('M')
                    ]),
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('L')
                    ]),
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('XL')
                    ]),
                    Column(children:[
                      Icon(Icons.accessibility_new, size: 50.0,),
                      Text('XXL')
                    ]),                    
                  ]),
                  TableRow( children: [
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xssize,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: ssize,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: msize,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: lsize,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xlsize,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: xxlsize,
                      )
                    ]),                                  
                  ]),
                ],
              ),
              MaterialButton(
                //TODO fix button color
                child: Text("Submit"),
                onPressed: () async {
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Uploading"),));
                  Map<String,dynamic> stylesList = {
                    'xs':xssize.value.text,
                    's':ssize.value.text,
                    'm':msize.value.text,
                    'l':lsize.value.text,
                    'xl':xlsize.value.text,
                    'xxl':xxlsize.value.text
                  };
                  await Firestore.instance.collection("aarvi").document(styleNo.text).updateData({
                    'order_quantity':orderQuantity.value.text,
                    'cutting_colour':color.value.text,
                    'cutting_no_of_lays':lays.value.text,
                    'cutting_piles_per_day':piles.value.text,
                    'sizes':stylesList
                  });
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Done"),));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}