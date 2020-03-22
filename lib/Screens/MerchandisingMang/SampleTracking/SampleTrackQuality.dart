import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class SampleTrackQuality extends StatefulWidget {
  @override
  _SampleTrackQualityState createState() => _SampleTrackQualityState();
}

class _SampleTrackQualityState extends State<SampleTrackQuality> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final sampleType = TextEditingController();
  final totalPiecesChecked = TextEditingController();
  final totalDefecit = TextEditingController();
  final totalRework = TextEditingController();
  final totalRejected = TextEditingController();
  String dropdownvalue = 'Proto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text("Sample Tracking - Quality"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance
                        .collection('aarvi')
                        .document(styleNo.value.text)
                        .get()
                        .then((value) {
                      if (value.exists) {
                        var data = value.data;
                        buyer.text = data['buyer'];
                        dropdownvalue = data['sample_type'] ?? 'Fit';
                        totalPiecesChecked.text =
                            data['sample_track_checked'] ?? '';
                        totalDefecit.text = data['sample_track_defecit'] ?? '';
                        totalRework.text = data['sample_track_rework'] ?? '';
                        totalRejected.text =
                            data['sample_track_rejected'] ?? '';
                      } else
                        print("NOTGOT");
                    });
                    setState(() {
                      print("Got");
                    });
                  },
                  decoration: TextFieldDec.inputDec("Style No"),
                ),
                TextFormField(
                  enabled: false,
                  controller: buyer,
                  decoration:  TextFieldDec.inputDec("Buyer"),
                ),
                SizedBox(height: 10),
                Text("Sample Type"),
                DropdownButton<String>(
                  iconEnabledColor: Colors.blueAccent,
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
                SizedBox(height: 10),
                TextFormField(
                  controller: totalPiecesChecked,
                  keyboardType: TextInputType.number,
                  decoration:
                       TextFieldDec.inputDec("Total Pieces Checked"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: totalDefecit,
                  keyboardType: TextInputType.number,
                  decoration:  TextFieldDec.inputDec("Total Defects"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: totalRework,
                  keyboardType: TextInputType.number,
                  decoration:  TextFieldDec.inputDec("Total Rework"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: totalRejected,
                  keyboardType: TextInputType.number,
                  decoration:  TextFieldDec.inputDec("Total Rejected"),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Uploading"),
                    ));
                    try {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .updateData({
                        'sample_type': dropdownvalue,
                        'sample_track_checked': totalPiecesChecked.value.text,
                        'sample_track_defecit': totalDefecit.value.text,
                        'sample_track_rework': totalRework.value.text,
                        'sample_track_rejected': totalRejected.value.text
                      });
                      scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Done"),
                      ));
                    } catch (e) {
                      scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
