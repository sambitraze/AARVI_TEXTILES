import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateList extends StatelessWidget {
  final Map heading;
  final String styleNo;

  DateList({Key key, this.heading, this.styleNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("StyleNo $styleNo");
    return Scaffold(
      body: Column(
        children: <Widget>[
          Transform.translate(
            offset: Offset(50.0, 93.0),
            child: SizedBox(
              width: 284.0,
              child: Text(
                heading['heading'],
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 27,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(39.0, 226.0),
            child: Container(
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 318,
                  height: 599,
                  child: ListOfDates(
                    styleNo: styleNo,
                    collection: heading['collection'],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListOfDates extends StatefulWidget {
  final String collection;
  final String styleNo;

  const ListOfDates({Key key, this.collection, this.styleNo}) : super(key: key);

  @override
  _ListOfDatesState createState() => _ListOfDatesState();
}

class _ListOfDatesState extends State<ListOfDates> {
  List listOfDates = [];

  @override
  void initState() {
    getDates();
    super.initState();
  }

  void getDates() async {
    await Firestore.instance
        .collection('aarvi')
        .document(widget.styleNo)
        .collection(widget.collection)
        .getDocuments()
        .then((value) {
      listOfDates = value.documents.map((e) => e.documentID).toList();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return listOfDates == []
        ? Container
        : GridView.count(
            primary: false,
            padding: EdgeInsets.all(0),
            mainAxisSpacing: 3,
            crossAxisSpacing: 20,
            crossAxisCount: 1,
            childAspectRatio: 3.8313253012048194,
            children: listOfDates.map((map) {
              return Transform.translate(
                offset: Offset(-29.0, -226.0),
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(39.0, 233.0),
                      child: Container(
                        child: Center(child: Text(map)),
                        width: 298.0,
                        height: 63.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x7a000000),
                                offset: Offset(0, 3),
                                blurRadius: 6)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
  }
}
