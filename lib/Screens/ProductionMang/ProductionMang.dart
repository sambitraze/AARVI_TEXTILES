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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Cutting"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/CuttingPage');
                  },
                ),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text("Sewing"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/SewingPage');
                  },
                ),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text("Finishing"),
                  onPressed: (){Navigator.pushNamed(context, '/FinishingPage');},
                ),
                SizedBox(height: 50,),
                RaisedButton(
                  child: Text("Packing"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/PackagingPage');
                  },
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
