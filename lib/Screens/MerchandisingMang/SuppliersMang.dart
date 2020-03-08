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
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              RaisedButton(onPressed: () {Navigator.pushNamed(context, '/FabricSup');}, child: Text('Fabric Suppliers')),
              RaisedButton(onPressed: () {Navigator.pushNamed(context, '/TrimSup');}, child: Text('Trim Suppliers')),
              RaisedButton(onPressed: () {Navigator.pushNamed(context, '/LabelTagSup');}, child: Text('Lable/Tag Suppliers')),
              RaisedButton(onPressed: () {Navigator.pushNamed(context, '/PolybagSup');}, child: Text('Polybag Suppliers')),              
              RaisedButton(onPressed: () {Navigator.pushNamed(context, '/CartonSup');}, child: Text('Carton Suppliers')),
            ],
          ),
        ),
      ),
    );
  }
}