import 'package:flutter/material.dart';

class PoMang extends StatefulWidget {
  @override
  _PoMangState createState() => _PoMangState();
}

class _PoMangState extends State<PoMang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AARVI TEXTILES'))),      
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Buyer 1'),
            onTap: (){
              Navigator.pushNamed(context, '/BuyersPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Buyer 2'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Buyer 3'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Buyer 4'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Buyer 5'),
          ),
        ],
      ),
    );
  }
}

