import 'package:aarvi_textiles/Screens/MerchandisingMang/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
class SampleTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Aarvi Textiles"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Pattern');
              },
              child: Text('Pattern'),

            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Cutting');
              },
              child: Text('Cutting'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Sewing');
              },
              child: Text('Sewing'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Quality');
              },
              child: Text('Quality'),
            ),
          ],
        ),
      ),
    );
  }
}
