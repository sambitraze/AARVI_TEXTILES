import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: mycontroller,
              decoration:TextFieldDec.inputDec("Style No"),
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
      ),
    );
  }
}