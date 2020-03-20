import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/Style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class SampleTrackPattern extends StatefulWidget {
  @override
  _SampleTrackPatternState createState() => _SampleTrackPatternState();
}

class _SampleTrackPatternState extends State<SampleTrackPattern> {
  String dropdownvalue = "Proto";
  final _formKey = GlobalKey<FormState>();
  final _styleController = TextEditingController();
  bool _patternCompleted = false;
  bool _patternCorrectionRequired = false, _textEnabled = true;
  DateTime selectedDate;
  final _snackBarKey = GlobalKey<ScaffoldState>();
  bool _update = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      appBar: AppBar(
        title: Text("Aarvi Textiles"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Sample Tracking - Pattern",
                    style: TextStyle(color: Colors.brown, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    enabled: _textEnabled,
                    controller: _styleController,
                    decoration: InputDecoration(
                      labelText: "Enter Style",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text("Fetch"),
                    onPressed: () async {
                      Styles s = await Styles.getSamplePatternTrack(
                          _styleController.value.text);
                      if (s == null) {
                        _update = false;
                      } else {
                        await Firestore.instance
                            .collection('aarvi')
                            .document(_styleController.value.text)
                            .get()
                            .then((value) =>
                                dropdownvalue = value.data['sample_type']);
                        setState(() {
                          _update = true;
                          _patternCorrectionRequired =
                              (s.patternCorrectionReq ?? false);
                          _patternCompleted = (s.patternCompleted ?? false);
                          _textEnabled = false;
                          selectedDate = s.expectedDateOfPatternCompletion ??
                              DateTime.now();
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Sample Type"),
                  DropdownButton<String>(
                    value: dropdownvalue,
                    icon: Icon(Icons.arrow_downward),
                    items: <String>[
                      'Proto',
                      'Fit',
                      'Salesman',
                      'Size Set',
                      'Pre Production',
                      'Shipment'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                  //Proto sample, Fit sample, salesman sample, size set sample, pre production sample, and shipment sample
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true, onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            selectedDate = date;
                          });
                        }, currentTime: DateTime.now());
                      },
                      child: Text(
                        'Expected Date of Patern Completion: ' +
                            (selectedDate != null
                                ? DateFormat('yyyy-MM-dd').format(selectedDate)
                                : ''),
                        style: TextStyle(color: Colors.blue),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Pattern Completed",
                        style: TextStyle(fontSize: 15),
                      ),
                      Checkbox(
                        value: _patternCompleted,
                        onChanged: (val) {
                          setState(() {
                            _patternCompleted = !_patternCompleted;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Pattern Correction Required",
                        style: TextStyle(fontSize: 15),
                      ),
                      Checkbox(
                        value: _patternCorrectionRequired,
                        onChanged: (val) {
                          setState(() {
                            _patternCorrectionRequired =
                                !_patternCorrectionRequired;
                          });
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      Styles s;
                      _snackBarKey.currentState.showSnackBar(SnackBar(
                        content: Text("Updating"),
                      ));
                      //TODO Implement Date Picker
                      s = Styles.setSampleTrack(
                          styleNo: _styleController.value.text,
                          patternCompleted: _patternCompleted,
                          patternCorrectionReq: _patternCorrectionRequired,
                          expectedDateOfPatternCompletion: selectedDate);
                      await s.updateSamplePattern(s, _update);
                      await Firestore.instance
                          .collection('aarvi')
                          .document(_styleController.value.text)
                          .updateData({'sample_type': dropdownvalue});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
