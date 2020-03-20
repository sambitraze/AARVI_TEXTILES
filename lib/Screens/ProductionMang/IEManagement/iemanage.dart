import 'package:flutter/material.dart';

class IEmanage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IE Management"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Operation Bulletin"),
              onPressed: () {
                Navigator.pushNamed(context, '/opBulletin');
              },
            ),
            RaisedButton(
              child: Text("Time Study"),
              onPressed: (){
                Navigator.pushNamed(context, '/timeStudy');
              },
            ),
            RaisedButton(
              child: Text("Machine Requirement(Style Wise)"),
              onPressed: (){
                Navigator.pushNamed(context, '/machinceReq');
              },
            ),
          ],
        ),
      ),
    );
  }
}