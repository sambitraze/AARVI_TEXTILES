import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class SampleTrackCutting extends StatefulWidget {
  @override
  _SampleTrackCuttingState createState() => _SampleTrackCuttingState();
}

class _SampleTrackCuttingState extends State<SampleTrackCutting> {
  String dropdownvalue = 'Proto';
  final _formKey = GlobalKey<FormState>();
  final _styleController = TextEditingController();
  bool _reCuttingRequired = false;
  bool _textEnabled = true;
  DateTime selectedDate;
  final _snackBarKey = GlobalKey<ScaffoldState>();
  bool _update = true;
  String totalPieces;
  String manPowerReq;
  String sampleType;
  Styles s;
  DateTime etc;
  final totalPiecesController = TextEditingController();
  final manPowerRequiredController = TextEditingController();
  final sampleTypeController = TextEditingController();
  final etcController = TextEditingController();
  // final _sampleType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      appBar: AppBar(
        title: Text("Sample Tracking - Cutting"),
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
                  TextFormField(
                    enabled: _textEnabled,
                    controller: _styleController,
                    decoration: TextFieldDec.inputDec("Style No"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text("Fetch"),
                    onPressed: () async {
                      s = await Styles.getCuttingFromStyleNo(
                          _styleController.value.text);
                      if (s == null) {
                        _update = false;
                        print("No record");
                      } else {
                        await Firestore.instance
                            .collection('aarvi')
                            .document(_styleController.value.text)
                            .get()
                            .then((value) =>
                                dropdownvalue = value.data['sample_type']);
                        setState(() {
                          print("Exist");
                          _reCuttingRequired = s.cuttingReq;
                          print(s.cuttingReq);
                          _textEnabled = false;
                          totalPieces = (s.totalPiecesToBeCut ?? 0).toString();
                          manPowerReq = s.cuttingManPowerReq;
                          manPowerRequiredController.text =
                              s.cuttingManPowerReq;
                          sampleType = s.sampleType;
                          sampleTypeController.text = s.sampleType;
                          totalPiecesController.text =
                              (s.totalPiecesToBeCut ?? 0).toString();
                          print("Expected date" +
                              s.expectedDateToCutting.toString());
                          etc = s.expectedDateToCutting;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: totalPiecesController,
                    onChanged: (val) => totalPieces = val,
                    keyboardType: TextInputType.number,
                    decoration: TextFieldDec.inputDec("Total pieces to be cut"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      // color: Colors.grey[200],
                      onPressed: () {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          },
                          onConfirm: (date) {
                            print(etc);
                            print('confirm $date');
                            setState(() {
                              etc = date;
                            });
                          },
                          currentTime: DateTime.now(),
                        );
                      },
                      child: Text(
                        'Enter Expected Date to Cutting:' +
                            (etc != null
                                ? DateFormat('dd-MM-yyyy').format(etc)
                                : ''),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: manPowerRequiredController,
                    onChanged: (val) => manPowerReq = val,
                    keyboardType: TextInputType.number,
                    decoration: TextFieldDec.inputDec("Man Power Required"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sample Type :",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        iconEnabledColor: Colors.blueAccent,
                        hint: Text('sample Type'),
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Re-Cutting Required",
                        style: TextStyle(fontSize: 15),
                      ),
                      Checkbox(
                        value: _reCuttingRequired,
                        onChanged: (val) {
                          setState(() {
                            _reCuttingRequired = !_reCuttingRequired;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      Styles s;
                      _snackBarKey.currentState.showSnackBar(SnackBar(
                        content: Text("Updating"),
                      ));
                      s = Styles.getCutting(
                          styleNo: _styleController.value.text,
                          totalPiecesToBeCut: int.parse(totalPieces),
                          expectedDateToCutting: etc,
                          cuttingReq: _reCuttingRequired,
                          cuttingManPowerReq: manPowerReq,
                          sampleType: dropdownvalue);
                      await s.updateSampleCutting(s, _update);
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
