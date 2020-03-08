import 'package:flutter/material.dart';

class BuyersMang extends StatefulWidget {
  @override
  _BuyersMangState createState() => _BuyersMangState();
}

class _BuyersMangState extends State<BuyersMang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buyers Management')),
      //search for existing buyers and add additonal buyers.
    );
  }
}