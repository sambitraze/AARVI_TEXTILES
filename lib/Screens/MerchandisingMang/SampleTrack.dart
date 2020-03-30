import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class SampleTrack extends StatefulWidget {
  @override
  _SampleTrackState createState() => _SampleTrackState();
}

class _SampleTrackState extends State<SampleTrack> {
  String inputStyleNo;
  bool _styleExists = false;
  Styles s;
  var _scaffoldState = GlobalKey<ScaffoldState>();

  Form searchStyle() => Form(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  onChanged: (val) => inputStyleNo = val,
                  decoration: TextFieldDec.inputDec("Style No")),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.white70,
                child: Text("Search"),
                onPressed: () async {
                  await Firestore.instance
                      .collection('aarvi')
                      .document(inputStyleNo)
                      .get()
                      .then((value) {
                    _scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("searching"),
                    ));
                    print(value.data);
                  });
                  s = await Styles.getStyleFromStyleNo(inputStyleNo);
                  if (s != null) {
                    setState(() {
                      _styleExists = true;
                    });
                  } else {
                    _scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Style does not exist"),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // initState() {}
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Sample Trackiing"),
      ),
      body: !_styleExists
          ? searchStyle()
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
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
                        child: Text(
                          'Pattern',
                          style: TextStyle(fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Pattern');
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      child: Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: Text(
                          'Cutting',
                          style: TextStyle(fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Cutting');
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      child: Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: Text(
                          'Sewing',
                          style: TextStyle(fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Sewing');
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      child: Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: Text(
                          'Quality',
                          style: TextStyle(fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Quality');
                    },
                  ),
                ],
              ),
            ),
    );
  }
}