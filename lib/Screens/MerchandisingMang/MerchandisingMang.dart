import 'package:flutter/material.dart';

class MerchandisingMang extends StatefulWidget {
  @override
  _MerchandisingMangState createState() => _MerchandisingMangState();
}

class _MerchandisingMangState extends State<MerchandisingMang> {
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
                Navigator.pushNamed(context, '/BoM');
              },
              child: Text('BOM'),

            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TnA');
              },
              child: Text('TnA'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/FabricEnquiry');
              },
              child: Text('Fabric Enquiry'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/StockMang');
              },
              child: Text('Stock Mangement'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SampleTrack');
              },
              child: Text('Sample Tracking'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/OrderTrack');
              },
              child: Text('Order Tracking'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SuppliersMang');
              },
              child: Text('Supplier Mangement'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/BuyersMang');
              },
              child: Text('Buyers Mangement'),
            ),
          ],
        ),
      ),
    );
  }
}