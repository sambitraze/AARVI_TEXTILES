import 'package:flutter/material.dart';
class SewingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sewing-production management"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Daily Production Report"),
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("Hourly Production Report"),
              onPressed: (){
                Navigator.pushNamed(context, '/SewingHourlyProduction');
              },
            ),
            RaisedButton(
              child: Text("IE Management"),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
