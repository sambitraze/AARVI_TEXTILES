import 'package:flutter/material.dart';

class ProductionMnag extends StatefulWidget {
  @override
  _ProductionMnagState createState() => _ProductionMnagState();
}

class _ProductionMnagState extends State<ProductionMnag> {
  @override
  Widget build(BuildContext context) {
    return ProductionManagement();
  }
}

class ProductionManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Production Mangement"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: <Widget>[
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Cutting',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/CuttingPage');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Sewing',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/SewingPage');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Finishing',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/FinishingPage');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Packing',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/PackagingPage');
              },
            ),
          ],
        ),
      ),  
    );
  }
}