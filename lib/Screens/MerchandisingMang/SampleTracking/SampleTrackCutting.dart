import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/database/Styles.dart';
class SampleTrackCutting extends StatefulWidget {
  @override
  _SampleTrackCuttingState createState() => _SampleTrackCuttingState();
}

class _SampleTrackCuttingState extends State<SampleTrackCutting> {
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
                  Text("Sample Tracking - Cutting",style: TextStyle(color: Colors.brown,fontSize: 20),),
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
                      s = await Styles.getCuttingFromStyleNo(_styleController.value.text);
                      if(s == null){
                        _update = false;
                        print("No record");
                      }
                      else
                        setState(() {
                          print("Exist");
                          _reCuttingRequired = s.cuttingReq;
                          _textEnabled = false;
                          totalPieces = (s.totalPiecesToBeCut ?? 0).toString();
                          manPowerReq = s.cuttingManPowerReq;
                          sampleType = s.sampleType;
                        });
                    },
                  ),
                  SizedBox(height: 50,),

                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: (totalPieces ?? 0).toString(),
                    onChanged: (val) => totalPieces = val,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Total Pieces to be Cut",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: (manPowerReq ?? ''),
                    onChanged: (val) => manPowerReq = val,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Man Power Required",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: (sampleType ?? ''),
                    onChanged: (val) => sampleType = val,
                    decoration: InputDecoration(
                      labelText: "Sample Type",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.brown,width: 2)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Text(
                        "Re-Cutting Required",
                        style: TextStyle(fontSize: 15),
                      ),
                      Checkbox(
                        value: _reCuttingRequired,
                        onChanged: (val){
                          setState(() {
                            _reCuttingRequired = !_reCuttingRequired;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(
                    child:Text("Submit") ,
                    onPressed: () async {
                      Styles s;
                      _snackBarKey.currentState.showSnackBar(SnackBar(content: Text("Updating"),));
                      //TODO Implement Date Picker
                      s = Styles.getCutting(styleNo: _styleController.value.text,totalPiecesToBeCut: int.parse(totalPieces),expectedDateToCutting: DateTime.now(),
                      cuttingReq: _reCuttingRequired,cuttingManPowerReq: manPowerReq,sampleType: sampleType);
                      await s.updateSampleCutting(s,_update);
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