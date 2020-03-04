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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/PoMang');
              },
              child: Text('Po Mangement'),

            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MerchandisingMang');
              },
              child: Text('Merchandising Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ProductionMang');
              },
              child: Text('Production Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/QualityMang');
              },
              child: Text('Quality Mangement'),
            ),
            SizedBox(height: 30),
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
