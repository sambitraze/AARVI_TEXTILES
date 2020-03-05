import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Navigator.pushNamed(context, '/PoMang');
              },
              child: Text('Po Mangement'),

            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MerchandisingMang');
              },
              child: Text('Merchandising Mangement'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ProductionMang');
              },
              child: Text('Production Mangement'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/QualityMang');
              },
              child: Text('Quality Mangement'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/DocumentationMang');
              },
              child: Text('Documentation Mangement'),
            ),
          ],
        ),
      ),
    );
  }
}
