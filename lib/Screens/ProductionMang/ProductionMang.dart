import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';


class ProductionMnag extends StatefulWidget {
  @override
  _ProductionMnagState createState() => _ProductionMnagState();
}

class _ProductionMnagState extends State<ProductionMnag> {
  @override
  Widget build(BuildContext context) {
    return ProductionManagement();
  }
}

class ProductionManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aarvi Textiles"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Text("Production Management",
                style: TextStyle(fontSize: 30,color: Colors.brown),),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Cutting"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/CuttingPage');
                  },
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Sewing"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/SewingPage');
                  },
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Finishing"),
                  onPressed: (){Navigator.pushNamed(context, '/FinishingPage');},
                ),
                SizedBox(height: 30,),
                RaisedButton(
                  child: Text("Packing"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/PackagingPage');
                  },
                )
              ],
            )

          ],
        ),
      ),
    );;
  }
}
