import 'package:aarvi_textiles/Screens/MerchandisingMang/Style.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class TnA extends StatefulWidget {
  @override
  _TnAState createState() => _TnAState();
}

class _TnAState extends State<TnA> {
  final mycontroller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Styles s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('TnA')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: mycontroller,
            decoration: InputDecoration(
              prefix: Text('Style No: '),
              contentPadding: EdgeInsets.all(10.0),
              alignLabelWithHint: false,
              labelText: 'Enter Style Number',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.brown, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.brown, width: 2.0),
              ),
            ),
          ),
          RaisedButton(
              onPressed: () async {
                s = await Styles.getStyleFromStyleNo(mycontroller.value.text);
                if(s != null){
                  var file = await FilePicker.getFile();
                  bool isUploaded = await s.uploadTna(file);
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Uploading"),));
                  if(!isUploaded){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Error"),));
                  }
                }
                else{
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Style does not exist"),));
                }
              },
              child: Text('Search'),
            ),
        ],
      ),
    );
  }
}