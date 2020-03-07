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
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/PoMang');
              },
              child: Text('Po Mangement', style: TextStyle(fontSize: 25.0)),
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/MerchandisingMang');
              },
              child: Text('Merchandising Mangement', style: TextStyle(fontSize: 25.0)),
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/ProductionMang');
              },
              child: Text('Production Mangement', style: TextStyle(fontSize: 25.0)),
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/QualityMang');
              },
              child: Text('Quality Mangement', style: TextStyle(fontSize: 25.0)),
            ),
          ],
        ),
      ),
    );
  }
}
