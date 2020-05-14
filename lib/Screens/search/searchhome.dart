import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  String styleno = '';
  List items = [
    'Cutting Quality',
    'Daily Cutting Report',
    'Operation Bulletin',
    'Daily Sewing Report',
    'Packing',
    'Time Study'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (v) => styleno = v,
                decoration: InputDecoration(
                  prefixIcon:
                  Icon(Icons.search, color: Colors.black, size: 30.0),
                  prefix: Text('Style No: '),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onEditingComplete: null,
              ),
            ),
            Container(
              child: MaterialButton(
                elevation: 8,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  setState(() {

                  });
                },
                child: Text(
                  'Fetch',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.cyan,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: styleno != ''
                    ? Firestore.instance.collection('aarvi').where(
                    'style', isEqualTo: styleno).snapshots()
                    : Firestore.instance.collection('aarvi').snapshots()
                ,
                builder: (context, snapshot) {
                  print("Starting render");
                  if (snapshot.hasData) {
                    List newList = snapshot.data.documents.map<Widget>((e) =>
                        ExpansionTile(
                            key: Key(e['style']),
                            title: Text(e['name'] ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text.rich(
                                TextSpan(
                                    text: "Order No:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(text: e['style'],
                                          style: DefaultTextStyle
                                              .of(context)
                                              .style)
                                    ]
                                )
                            ),
                            children: items.map<Widget>((e) =>
                                ListTile(
                                  title: Text(e),
                                )).toList()
                        )).toList();
                    print("List created");
                    print(newList.runtimeType);
                    return ListView(
                        children: newList
                    );
                  }
                  else {
                    return Text("No data");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
