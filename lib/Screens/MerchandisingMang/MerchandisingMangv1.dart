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
        title: Text("Merchandising Management"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[          
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/BoM');
                },
                child: Text('BOM'),

              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/TnA');
                },
                child: Text('TnA'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/FabricEnquiry');
                },
                child: Text('Fabric Enquiry'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/StockMang');
                },
                child: Text('Stock Mangement'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/SampleTrack');
                },
                child: Text('Sample Tracking'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/OrderTrack');
                },
                child: Text('Order Tracking'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/SuppliersMang');
                },
                child: Text('Supplier Mangement'),
              ),
              MaterialButton(
                color: Colors.grey[200],
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/PoMang');
                },
                child: Text('Buyers Mangement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}