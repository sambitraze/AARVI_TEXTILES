import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CutOrderPlan extends StatefulWidget {
  @override
  _CutOrderPlanState createState() => _CutOrderPlanState();
}

class _CutOrderPlanState extends State<CutOrderPlan> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String styleNo;
  String orderQuantity;
  String color;
  String lays;
  String piles;
  
  String xssize;
  String ssize;
  String msize;
  String lsize;
  String xlsize;
  String xxlsize;
  String xxsize;

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
                onChanged: (val) {
                  styleNo = val;
                  print('$styleNo');
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Style No"),
              ),
              TextFormField(
                onChanged: (val) {
                  orderQuantity = val;
                  print('$orderQuantity');
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Order Quantity"),
              ),
              TextFormField(
                onChanged: (val) {
                  color = val;
                  print('$color');
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter Colour"),
              ),
              TextFormField(
                onChanged: (val) {
                  lays = val;
                  print('$color');
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Enter No of Lays"),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  piles = val;
                  print('$piles');
                },
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
                        onChanged: (val) => xssize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => ssize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => msize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => lsize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => xlsize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => xxlsize = val,
                      )
                    ]),                                  
                  ]),
                ],
              ),
              MaterialButton(
                child: Text("Submit"),
                onPressed: () async {
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Uploading"),));
                  Map<String,dynamic> stylesList = {
                    'xs':xssize,
                    's':ssize,
                    'm':msize,
                    'l':lsize,
                    'xl':xlsize,
                    'xxl':xxlsize
                  };
                  await Firestore.instance.collection("Style").document(styleNo).updateData({
                    'order_quantity':orderQuantity,
                    'cutting_colour':color,
                    'cutting_no_of_lays':lays,
                    'cutting_piles_per_day':piles,
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