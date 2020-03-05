import 'package:flutter/material.dart';

class CuttingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aaarvi Textiles"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 100),
              child: Text("Cutting",
                style: TextStyle(fontSize: 30,color: Colors.brown),),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Cut Order Plan"),
                  onPressed: (){},
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Daily Cutting Plan"),
                  onPressed: (){},
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Quality"),
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

