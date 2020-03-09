import 'package:flutter/material.dart';

class CuttingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cutting-Production Management"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Cut Order Plan"),
              onPressed: (){
                Navigator.pushNamed(context, '/CutOrderPlan');
              },
            ),
            RaisedButton(
              child: Text("Daily Cutting Plan"),
              onPressed: (){
                Navigator.pushNamed(context, '/DailyCuttingPlan');
              },
            ),
            RaisedButton(
              child: Text("Quality"),
              onPressed: (){
                Navigator.pushNamed(context, '/CuttingQuality');
              },
            )
          ],
        ),
      ),
    );
  }
}

