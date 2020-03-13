import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/iemanage.dart';
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
              onPressed: (){
                 Navigator.pushNamed(context, '/DailyProductionReport');
              },
            ),
            RaisedButton(
              child: Text("Hourly Production Report"),
              onPressed: (){
                Navigator.pushNamed(context, '/SewingHourlyProduction');
              },
            ),
            RaisedButton(
              child: Text("IE Management"),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => IEmanage(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
