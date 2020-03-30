import 'package:flutter/material.dart';

class SuppliersMang extends StatefulWidget {
  @override
  _SuppliersMangState createState() => _SuppliersMangState();
}

class _SuppliersMangState extends State<SuppliersMang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suppliers Mangaement')),
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
                    'Fabric\nSuppliers',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/FabricSup');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Trim\nSuppliers',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/TrimSup');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Lable/Tag Suppliers',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/LabelTagSup');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Polybag Suppliers',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/PolybagSup');
              },
            ),
            GestureDetector(
              child: Card(
                elevation: 8.0,
                child: Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text(
                    'Carton\nSuppliers',
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/CartonSup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
