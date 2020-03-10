import 'package:flutter/material.dart';

class CutOrderPlan extends StatefulWidget {
  @override
  _CutOrderPlanState createState() => _CutOrderPlanState();
}

class _CutOrderPlanState extends State<CutOrderPlan> {  
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
                        onChanged: (val) => xssize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        onChanged: (val) => ssize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        onChanged: (val) => msize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        onChanged: (val) => lsize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        onChanged: (val) => xlsize = val,
                      )
                    ]),
                    Column(children:[
                      TextField(
                        onChanged: (val) => xxlsize = val,
                      )
                    ]),                                  
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}