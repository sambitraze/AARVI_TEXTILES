import 'package:aarvi_textiles/Screens/PoMang/Buyer.dart';
import 'package:aarvi_textiles/Screens/PoMang/BuyersPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PoMang extends StatefulWidget {
  @override
  _PoMangState createState() => _PoMangState();
}
Widget BuyersList(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
  if(snapshot.hasData){
    return ListView.builder(
      itemBuilder: (context,index){
      DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
      Buyer b = Buyer.convert(documentSnapshot);
      return ListTile(
        leading: Icon(Icons.person),
        title: Text(b.name),
        subtitle: Text(b.desc),
      );
    },
    itemCount: snapshot.data.documents.length,
    );
  }
  else if(snapshot.connectionState == ConnectionState.done && !snapshot.hasData){
    return Center(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          )
        ],
      ),
    );
  }
  else{
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
class _PoMangState extends State<PoMang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AARVI TEXTILES'))),      
//      body: ListView(
//        children: <Widget>[
//          ListTile(
//            leading: Icon(Icons.person),
//            title: Text('Buyer 1'),
//            onTap: (){
//              Navigator.pushNamed(context, '/BuyersPage');
//            },
//          ),
//          ListTile(
//            leading: Icon(Icons.person),
//            title: Text('Buyer 2'),
//          ),
//          ListTile(
//            leading: Icon(Icons.person),
//            title: Text('Buyer 3'),
//          ),
//          ListTile(
//            leading: Icon(Icons.person),
//            title: Text('Buyer 4'),
//          ),
//          ListTile(
//            leading: Icon(Icons.person),
//            title: Text('Buyer 5'),
//          ),
//        ],
//      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Buyer").snapshots(),
        builder: BuyersList,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => BuyersPage()));},
      ),
    );
  }
}

