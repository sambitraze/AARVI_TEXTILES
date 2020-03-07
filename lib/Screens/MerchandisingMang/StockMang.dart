import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter/material.dart';

class StockMang extends StatefulWidget {
  @override
  _StockMangState createState() => _StockMangState();
}

class _StockMangState extends State<StockMang> {
  final mycontroller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Styles s;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
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
              onPressed: () async {
                s = Styles.getObjectFromStyleNo(styleNo: mycontroller.value.text);
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Loading"),));
                if(await s.getStock() == true){
                  //TODO Preferably navigate to show data

                }
                else{
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Style does not exist"),));
                }
              },
              child: Text('Search'),
            ),
        ],
      ),
    );
  }
}