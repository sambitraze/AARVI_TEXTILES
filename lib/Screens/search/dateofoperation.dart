import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage/CuttingQuality.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage/DailyCuttingReport.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/opBulletin.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/timeStudy.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/PackagingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/SewingPage/DailyProductionReport.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DateList extends StatelessWidget {
  final Map heading;
  final String styleNo;

  DateList({Key key, this.heading, this.styleNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("StyleNo $styleNo");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                heading['heading'] ?? '',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 27,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListOfDates(
              styleNo: styleNo,
              collection: heading['collection'] ?? '',
            ),
          )
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
  String mod;
  @override
  void initState() {
    getDates();
    super.initState();
  }

  void getDates() async {
    print(widget.collection);
    if (widget.collection == "bill_of_material" || widget.collection == "TnA") {
      print("YO");
      await Firestore.instance
          .collection('aarvi')
          .document(widget.styleNo)
          .get()
          .then((value) => listOfDates = value.data[widget.collection] ?? []);
      print(listOfDates);
    } else {
      await Firestore.instance
          .collection('aarvi')
          .document(widget.styleNo)
          .collection(widget.collection)
          .getDocuments()
          .then((value) {
        listOfDates = value.documents.map((e) => e.documentID).toList();
      });
    }
    setState(() {});
  }
  launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  @override
  Widget build(BuildContext context) {
    print(listOfDates.length > 0);
    return listOfDates.length <= 0
        ? Text(
            "No Entries in this set",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          )
        : ListView(
            primary: false,
            padding: EdgeInsets.all(0),
            children: listOfDates.reversed.map((map) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      print(
                          "input collection: " + widget.collection.toString());
                      if (widget.collection == "DailyCuttingReport") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return DailyCuttingReport(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == "DailyProductionReport") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return DailyProductionReport(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == "CuttingQuality") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CuttingQuality(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == "OperationBulletin") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return OpBulletin(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == "Packing") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return PackagingPage(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == "TimeStudy") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return TimeStudy(
                            date: map,
                            style: widget.styleNo,
                          );
                        }));
                      } else if (widget.collection == 'bill_of_material' ||
                          widget.collection == 'TnA') {
                            launchURL(map);
                        print(map);
                      } else {
                        print("UnKnown collection: " +
                            widget.collection.toString());
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Center(
                        child: (widget.collection == 'bill_of_material' ||
                                widget.collection == 'TnA')
                            ? Text(
                                map.toString().substring(78,106) ?? '',
                                style: TextStyle(fontSize: 10),
                              )
                            : Text(
                                map ?? '',
                                style: TextStyle(fontSize: 10),
                              ),
                      ),
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
              );
            }).toList(),
          );
  }
}
