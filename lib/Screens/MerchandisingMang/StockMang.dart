import 'package:flutter/material.dart';

class StockMang extends StatefulWidget {
  @override
  _StockMangState createState() => _StockMangState();
}

class _StockMangState extends State<StockMang> {
  final mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Stock Management')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: mycontroller,
            decoration: InputDecoration(
              prefix: Text('Style No: '),
              contentPadding: EdgeInsets.all(10.0),
              alignLabelWithHint: false,
              labelText: 'Enter Style Number',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.brown, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.brown, width: 2.0),
              ),
            ),
          ),
          RaisedButton(
              onPressed: () {
                if(mycontroller.text == 'h')
                  print('hi');
              },
              child: Text('Search'),
            ),
        ],
      ),
    );
  }
}