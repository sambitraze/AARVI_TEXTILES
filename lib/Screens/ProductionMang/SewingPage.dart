import 'package:flutter/material.dart';
class SewingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aaarvi Textiles"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 100),
              child: Text("Sewing",
                style: TextStyle(fontSize: 30,color: Colors.brown),),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Daily Production"),
                  onPressed: (){},
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Hourly Production"),
                  onPressed: (){},
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("IE Management"),
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
