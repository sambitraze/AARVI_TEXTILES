import 'package:flutter/material.dart';

class MerchandisingMang extends StatefulWidget {
  @override
  _MerchandisingMangState createState() => _MerchandisingMangState();
}

class _MerchandisingMangState extends State<MerchandisingMang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Merchandising Management"),
        ),
        body: Padding(
          padding: const  EdgeInsets.fromLTRB(20, 30, 20, 10),
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
                    child: Text('BoM', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/BoM');
                },
              ),GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('TnA', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/TnA');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Fabric\nEnquiry', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/FabricEnquiry');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Stock\nMangement', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/StockMang');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Sample\nTracking', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/SampleTrack');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Order\nTracking', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/OrderTrack');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Supplier\nManagement', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/SuppliersMang');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text('Buyer\'s\nManagement', style: TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                  )
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/Po Mang');
                },
              ),
            ],
          ),
        ));
  }
}
