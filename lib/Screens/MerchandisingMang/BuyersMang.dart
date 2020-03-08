import 'package:aarvi_textiles/Screens/PoMang/Buyer.dart';
import 'package:flutter/material.dart';

class BuyersMang extends StatefulWidget {
  @override
  _BuyersMangState createState() => _BuyersMangState();
}

class _BuyersMangState extends State<BuyersMang> {
  String buyer;
  final buyerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buyers Management')),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,30,20,30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: buyerName,
                  decoration: InputDecoration(
                    labelText: "Enter Buyer Name",
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.brown,width: 2)
                    ),
                  ),
                  onChanged: (buyerName){
                    buyer = buyerName.toString();
                  },
                ),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text("Search"),
                  onPressed: () async {},
                ),              
                SizedBox(height: 100),
                RaisedButton(
                  child: Text("Add New Buyer"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text('Add Buyer'),
                          content: new Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextField(
                                  controller: buyerName,
                                  decoration: InputDecoration(
                                    labelText: "Enter Name of Buyer",
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color:Colors.brown,width: 2)
                                    ),
                                  ),
                                  onChanged: (buyer) {
                                    buyer = buyer.toString();
                                    print("$buyer");
                                  },
                                ),
                                SizedBox(height: 10,),
                                RaisedButton(
                                  onPressed: (){
                                    print('$buyer');
                                  },
                                  child: Text('Add'),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: new Text('close')
                            )
                          ],
                        );
                      },
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}