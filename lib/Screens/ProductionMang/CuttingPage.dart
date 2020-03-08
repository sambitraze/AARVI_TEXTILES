import 'package:flutter/material.dart';

class CuttingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cutting"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Cut Order Plan"),
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("Daily Cutting Plan"),
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("Quality"),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}

