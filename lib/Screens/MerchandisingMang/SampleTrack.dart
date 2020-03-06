import 'package:aarvi_textiles/Screens/MerchandisingMang/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Style.dart';
class SampleTrack extends StatefulWidget {
  @override
  _SampleTrackState createState() => _SampleTrackState();
}

class _SampleTrackState extends State<SampleTrack> {
  final _formKey = GlobalKey<FormState>();
  final _styleController = TextEditingController();
  bool _patternCompleted = false;
  bool _patternCorrectionRequired = false,_textEnabled = true;
  DateTime selectedDate;
  final _snackBarKey = GlobalKey<ScaffoldState>();
  bool _update = true;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      appBar: AppBar(title: Text("Aarvi Textiles"),),
      body: SingleChildScrollView(
        child: Center(
          child:
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,30,20,30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text("Sample Tracking",style: TextStyle(color: Colors.brown,fontSize: 20),),
                      SizedBox(height: 50,),
                      TextFormField(
                        enabled: _textEnabled,
                        controller: _styleController,
                        decoration: InputDecoration(
                          labelText: "Enter Style",
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:Colors.brown,width: 2)
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      RaisedButton(
                        child: Text("Fetch"),
                        onPressed: () async {
                          Styles s = await Styles.getSampleTrack(_styleController.value.text);
                          if(s == null){
                            _update = false;
                          }
                          else
                          setState(() {
                            _patternCorrectionRequired = s.patternCorrectionReq;
                            _patternCompleted = s.patternCompleted;
                            _textEnabled = false;
                          });
                        },
                      ),
                      SizedBox(height: 50,),

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
                            onChanged: (val){
                              setState(() {
                                _patternCompleted = !_patternCompleted;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Text(
                            "Pattern Correction Required",
                            style: TextStyle(fontSize: 15),
                          ),
                          Checkbox(
                            value: _patternCorrectionRequired,
                            onChanged: (val){
                              setState(() {
                                _patternCorrectionRequired = !_patternCorrectionRequired;
                              });
                            },
                          ),
                        ],
                      ),
                      RaisedButton(
                        child:Text("Submit") ,
                        onPressed: () async {
                          Styles s;
                          _snackBarKey.currentState.showSnackBar(SnackBar(content: Text("Updating"),));
                          //TODO Implement Date Picker
                          s = Styles.setSampleTrack(styleNo: _styleController.value.text,patternCompleted: _patternCompleted,patternCorrectionReq: _patternCorrectionRequired,expectedDateOfPatternCompletion: DateTime.now());
                          await s.updateSample(s,_update);
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