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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              // padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/PoMang');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/po.png', height: 100.0, width: 100.0,),
                  Text('Po Mangement'),
                  SizedBox(height: 15)
                ],
              )
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/MerchandisingMang');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/merchandise.png', height: 100.0, width: 100.0,),
                  Text('Merchandising Mangement'),
                  SizedBox(height: 15)
                ],
              )
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              // padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/ProductionMang');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/production.png', height: 100, width: 100,),
                  Text('Production Mangement'),
                  SizedBox(height: 15)
                ],
              )
            ),
            FlatButton(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              // padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
              onPressed: () {
                Navigator.pushNamed(context, '/QualityMang');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/quality.png', height: 100.0, width: 100.0,),
                  Text('Quality Mangement'),
                  SizedBox(height: 15)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
