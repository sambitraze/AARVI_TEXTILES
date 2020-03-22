import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class SampleTrackSewing extends StatefulWidget {
  @override
  _SampleTrackSewingState createState() => _SampleTrackSewingState();
}

class _SampleTrackSewingState extends State<SampleTrackSewing> {
  String dropdownvalue = 'Fit';
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final totalPieces = TextEditingController();
  final machineRequired = TextEditingController();
  final manPowerRequired = TextEditingController();
  final sampleType = TextEditingController();
  final date = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Sample Tracking - Quality"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance
                        .collection('aarvi')
                        .document(value)
                        .get()
                        .then((value) {
                      var data = value.data;
                      buyer.text = data['buyer'];
                      dropdownvalue = data['sample_type'] ?? 'Fit';
                      totalPieces.text = data['sewing_total_pieces'] ?? '';
                      machineRequired.text =
                          data['sewing_machine_required'] ?? '';
                      manPowerRequired.text =
                          data['sewing_manpower_required'] ?? '';
                      date.text = data['sewing_date'] ?? '';
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
                  decoration: TextFieldDec.inputDec("Buyer"),
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
                  controller: totalPieces,
                  keyboardType: TextInputType.number,
                  decoration: TextFieldDec.inputDec("Total Pieces"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: machineRequired,
                  keyboardType: TextInputType.number,
                  decoration:TextFieldDec.inputDec("Machine Requirement"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: manPowerRequired,
                  keyboardType: TextInputType.number,
                  decoration:TextFieldDec.inputDec("Manpower Requirement"),
                ),                
                SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  format: DateFormat('dd-MM-yy'),
                  controller: date,
                  decoration: TextFieldDec.inputDec("Expected Date"),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2100));
                    setState(() {
                      print("Dat" + dat.toString());
                      print("control" + date.value.text);
                    });
                    return dat;
                  },
                ),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    _scaffoldState.currentState.showSnackBar(SnackBar(
                      content: Text("Uploading"),
                    ));
                    try {
                      await Firestore.instance
                          .collection('aarvi')
                          .document(styleNo.value.text)
                          .updateData({
                        'sample_type': sampleType.value.text,
                        'sewing_total_pieces': totalPieces.value.text,
                        'sewing_machine_requirement':
                            machineRequired.value.text,
                        'sewing_manpower_requirement':
                            manPowerRequired.value.text,
                        'sample_type': dropdownvalue,
                        'sewing_date': date.value.text
                      });
                      _scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Done"),
                      ));
                    } catch (e) {
                      _scaffoldState.currentState.showSnackBar(SnackBar(
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
