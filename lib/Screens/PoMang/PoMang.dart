import 'package:aarvi_textiles/Screens/PoMang/Buyer.dart';
import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'AddBuyersPage.dart';

class PoMang extends StatefulWidget {
  @override
  _PoMangState createState() => _PoMangState();
}

Widget buyersList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.hasData) {
    return ListView.builder(
      itemBuilder: (context, index) {
        DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
        Buyer b = Buyer.convert(documentSnapshot);
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(b.name),
          subtitle: Text(b.desc),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text("Buyer's Details"),
                  content: new Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Name: ' + b.name),
                        Text('Address: ' + b.address),
                        Text('Desc: ' + b.desc),
                        Text('Facbric: ' + b.fabricDetails),
                        Text('Lable: ' + b.labelDetails),
                        Text('Packing: ' + b.packingDetails),
                        Text('Price: ' + b.price.toString()),
                        Text('Print: ' + b.printDetails),
                        Text('Quantity: ' + b.quantity.toString()),
                        Text('Size: ' + b.sizeBreakup),
                        Text('Style: ' + b.style),
                        Text('Washing: ' + b.washingDetails),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      itemCount: snapshot.data.documents.length,
    );
  } else if (snapshot.connectionState == ConnectionState.done &&
      !snapshot.hasData) {
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
  } else {
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
      body: StreamBuilder(
        stream: Firestore.instance.collection("aarvi").snapshots(),
        builder: buyersList,
      ),
      floatingActionButton:
          /* FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => AddBuyersPage()));},
      ), */
          OpenContainer(

            closedColor: Colors.cyan,
        openBuilder: (BuildContext context, void Function() action) {
          return AddBuyersPage();
        },
        closedBuilder: (BuildContext context, void Function() action) {
          return Icon(Icons.add,size: 40,);
        },
        transitionDuration: Duration(milliseconds: 500),
        tappable: true,
      ),
    );
  }
}
