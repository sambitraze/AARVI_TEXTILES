import 'package:flutter/material.dart';

class CuttingQuality extends StatefulWidget {
  @override
  _CuttingQualityState createState() => _CuttingQualityState();
}

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

class _CuttingQualityState extends State<CuttingQuality> {
  TextEditingController styleNo, buyer, fabric, layNo, size, totalPartChecked, pass, fail;

  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cutting Quality')),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: inputDec("Style Number"),
                  controller: styleNo,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Buyer"),
                  controller: buyer,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //TODO get date picker
                  decoration: inputDec("Date"),
                  onChanged: (val) => date = val as DateTime,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Lay Number"),
                  keyboardType: TextInputType.number,
                  controller: layNo,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Size"),
                  controller: size,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Total Part Checked"),
                  controller: totalPartChecked,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Pass"),
                  controller: pass,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: inputDec("Fail"),
                  controller: fail,
                  keyboardType: TextInputType.number,
                ),
                //TODO fix data table
                SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Part Name")),
                      DataColumn(label: Text("Notch")),
                      DataColumn(label: Text("Shape")),
                      DataColumn(label: Text("Grain")),
                      DataColumn(label: Text("Placement")),
                      DataColumn(label: Text("Bowing"))
                    ],
                    rows:[1,2,3,4,5].map((i) => DataRow(cells: [
                      DataCell(Text(""),showEditIcon: true,placeholder: true),
                      DataCell(Text(""),showEditIcon: true,placeholder: true),
                      DataCell(Text(""),showEditIcon: true,placeholder: true),
                      DataCell(Text(""),showEditIcon: true,placeholder: true),
                      DataCell(Text(""),showEditIcon: true,placeholder: true),
                      DataCell(Text(""),showEditIcon: true,placeholder: true)
                    ])).toList() ,
                  ),
                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
