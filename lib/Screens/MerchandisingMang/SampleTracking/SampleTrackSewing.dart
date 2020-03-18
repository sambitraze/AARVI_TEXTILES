import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
class SampleTrackSewing extends StatefulWidget {
  @override
  _SampleTrackSewingState createState() => _SampleTrackSewingState();
}

class _SampleTrackSewingState extends State<SampleTrackSewing> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final totalPieces = TextEditingController();
  final machineRequired = TextEditingController();
  final manPowerRequired = TextEditingController();
  final sampleType = TextEditingController();
  final date = TextEditingController();
  final inputDec = InputDecoration(
    labelText: "Style No",
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown, width: 2)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Aarvi Textiles"),
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
                Text(
                  "Sample Tracking - Quality",
                  style: TextStyle(color: Colors.brown, fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance.collection('aarvi').document(value).
                    get().then((value) {
                      var data = value.data;
                      buyer.text = data['buyer'];
                      sampleType.text = data['sample_type'] ?? '';
                      totalPieces.text = data['sewing_total_pieces'] ?? '';
                      machineRequired.text = data['sewing_machine_required'] ?? '';
                      manPowerRequired.text = data['sewing_manpower_required'] ?? '';
                      date.text = data['sewing_date'] ?? '';
                    });
                    setState(() {
                      print("Got");
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Style No",
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2)),
                  ),
                ),
                TextFormField(
                  enabled: false,
                  controller: buyer,
                  decoration: inputDec.copyWith(labelText: "Buyer"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: sampleType,
                  decoration: inputDec.copyWith(labelText: "Sample Type"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: totalPieces,
                  keyboardType: TextInputType.number,
                  decoration:
                  inputDec.copyWith(labelText: "Total Pieces"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: machineRequired,
                  keyboardType: TextInputType.number,
                  decoration: inputDec.copyWith(labelText: "Machine Requirement"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: manPowerRequired,
                  keyboardType: TextInputType.number,
                  decoration: inputDec.copyWith(labelText: "Manpower Requirement"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: sampleType,
                  keyboardType: TextInputType.number,
                  decoration: inputDec.copyWith(labelText: "Sample Type"),
                ),
                SizedBox(height: 10,),
                DateTimeField(format: DateFormat('dd-MM-yy'),
                controller: date,
                  decoration: inputDec.copyWith(labelText: "Expected Date"),
                  onShowPicker: (context, currentValue) async {
                    final dat = await showDatePicker(context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(1970), lastDate: DateTime(2100));
                    setState(() {
                      print("Dat"+dat.toString());
                      print("control"+date.value.text);
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
                        'sewing_machine_requirement': machineRequired.value.text,
                        'sewing_manpower_requirement': manPowerRequired.value.text,
                        'sample_type': sampleType.value.text,
                        'sewing_date':date.value.text
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
