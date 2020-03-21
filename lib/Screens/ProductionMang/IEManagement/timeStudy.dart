import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TimeStudy extends StatefulWidget {
  @override
  _TimeStudyState createState() => _TimeStudyState();
}

var controllers = <TextEditingController>[];
var rowList = List<DataRow>();

InputDecoration inputDec(String labelText) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    labelText: labelText,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown, width: 2.0),
    ),
  );
}
SizedBox leaveSpace() {
  return SizedBox(
    height: 10,
  );
}
DataRow getRow(int index,{bool newController = true}) {
  var list = List<DataCell>();
  index = index * 8;
  for (int i = index; i < index + 8; ++i) {
    newController ? controllers.add(TextEditingController()) : print("Not New Controller");
    list.add(DataCell(TextField(
      controller: controllers[i],
    )));
  }
  return DataRow(cells: list);
}

class _TimeStudyState extends State<TimeStudy> {

  final _scaffoldState = GlobalKey<ScaffoldState>();
  int rows = 0;
  TextEditingController srlNo = TextEditingController(),
   operationName = TextEditingController(),
   firstCycle = TextEditingController(),
   secondCycle = TextEditingController(),
   thirdCycle = TextEditingController(),
   fourthCycle = TextEditingController(),
   avg = TextEditingController(),
   comments = TextEditingController();
   

  String buyer;
  String garment;
  String orderQty;
  final styleNo = TextEditingController();
  final lineNo = TextEditingController();
  final date = TextEditingController();


  List<DataRow> getRows() {
    for (int i = 0; i < rows; ++i) rowList.add(getRow(i));
    return rowList;
    }

  @override
  void initState() {
    rows = 0;
    controllers = [];
    super.initState();
  }

// first enter style number then buyer gets shown automatically
// then enter line number to pull exact db
// then enter date for new record or to view existing db

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Study')),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: inputDec("Style Number"),
                  controller: styleNo,
                ),
              leaveSpace(),
              TextFormField(
                  decoration: inputDec("Byuer"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try{
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {

                      });
                    }
                    catch(e){}
                  },
                ),
              leaveSpace(),              
              DateTimeField(
                  controller: date,
                    format: DateFormat('dd-MM-yyyy'),
                    decoration: inputDec("Date"),
                    onShowPicker: (context, currentValue) async {
                      final dat = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2100));
                      try{
                        await Firestore.instance.collection('aarvi').document(styleNo.value.text).collection('CuttingQuality').document(DateFormat('dd-MM-yyyy').format(dat)).get().then((value) {
                          if(value.exists){
                            var data = value;
                            // layNo.text = data['lay_number'] ?? '';
                            // size.text = data['size'] ?? '';
                            // totalPartChecked.text = data['total_part_checked'] ?? '';
                            // pass.text = data['pass'] ?? '';
                            // fail.text = data['fail'] ?? '';
                            int len = 0;
                            data['table'].forEach((element) {
                              len++;
                            });
                            for(int i=0; i<len;i = i + 8){
                              for(int j=i;j<i+8;++j){
                                controllers.add(TextEditingController());
                                controllers[j].text = data['table'][j];
                                print(controllers[j].text);
                              }
                              rowList.add(getRow(rows++,newController: false));
                            }
                          }
                        });
                      }
                      catch(e){
                        _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(e.toString()),));
                      }
                      setState(() {

                      });
                      return dat;
                    }),
              leaveSpace(),
              TextFormField(
                  decoration: inputDec("Garemnt"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try{
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {

                      });
                    }
                    catch(e){}
                  },
                ),
              leaveSpace(),
              TextFormField(
                  decoration: inputDec("Order Quantity"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try{
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {

                      });
                    }
                    catch(e){}
                  },
                ),
              leaveSpace(),
              TextFormField(
                  decoration: inputDec("Efficiency"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try{
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {

                      });
                    }
                    catch(e){}
                  },
                ),
              leaveSpace(),
              TextFormField(
                  decoration: inputDec("Target"),
                  controller: styleNo,
                  onChanged: (value) async {
                    try{
                      // await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value) =>
                      //  buyer.text = value.data['buyer']);
                      setState(() {

                      });
                    }
                    catch(e){}
                  },
                ),
              leaveSpace(),
              Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text("SRL NO",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                              label: Text("Operation",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(
                                label: Text("Machine Type",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Sample",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("No of Operators",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("No of Machines",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Hourly Target",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text("Comments",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)))
                          ],
                          rows: rowList,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              print("Rows = " + rows.toString());
                              rowList.add(getRow(rows++));
                              print(controllers.length);
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              print(controllers.length);
                              rows--;
                              if(rows>=0){
                                rowList.removeLast();
                                [1,2,3,4,5,6,7,8].forEach((element) {
                                  controllers.removeLast();
                                });
                              }
                              else{
                                rows = 0;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: (){
                            setState(() {
                              controllers = [];
                              rows = 0;
                              rowList = [];
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Uploading"),));
                    try{
                      var tableList = [];
                      controllers.forEach((element) {
                        tableList.add(element.value.text);
                      });
                      await Firestore.instance.collection('aarvi').document(styleNo.value.text).collection('CuttingQuality').document(date.value.text).
                      setData({
                        //set the data
                      });
                    }
                    catch(e){
                      _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(e.toString()),));
                    }
                    controllers.forEach((element) {print(element.value.text);});
                    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Done"),));

                  },
                )
            ],
          )
        ),
      ),
    );
  }   
}

