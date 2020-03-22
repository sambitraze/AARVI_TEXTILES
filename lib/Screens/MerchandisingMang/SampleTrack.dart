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
                decoration: TextFieldDec.inputDec("Style No")
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.white70,
                child: Text("Search"),
                onPressed: () async {
                  await Firestore.instance.collection('aarvi').document(inputStyleNo).get().then((value) {
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
      body: Center(
        child: !_styleExists
            ? searchStyle()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Pattern');
                    },
                    child: Text('Pattern'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Cutting');
                    },
                    child: Text('Cutting'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Sewing');
                    },
                    child: Text('Sewing'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Quality');
                    },
                    child: Text('Quality'),
                  ),
                ],
              ),
      ),
    );
  }
}
