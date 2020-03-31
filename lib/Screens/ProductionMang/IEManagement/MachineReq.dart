import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class MachineReq extends StatefulWidget {
  @override
  _MachineReqState createState() => _MachineReqState();
}

SizedBox leaveSpace(){
  return SizedBox(
    height: 10,
  );
}
class _MachineReqState extends State<MachineReq> {
  final styleNo = TextEditingController();
  final buyer = TextEditingController();
  final orderQty = TextEditingController();
  final numberOfOperations = TextEditingController();
  final machineType1 = TextEditingController();
  final totalMachineReq1 = TextEditingController();
  final machineType2 = TextEditingController();
  final totalMachineReq2 = TextEditingController();
  final machineType3 = TextEditingController();
  final totalMachineReq3 = TextEditingController();
  final scaffoldState = GlobalKey<ScaffoldState>();
  final garment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(title: Text("Machine Requirements    ")),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("Style Number"),
                  controller: styleNo,
                  onChanged: (value) async {
                    await Firestore.instance.collection('aarvi').document(styleNo.value.text).get().then((value){
                      if(value.exists){
                        var data = value.data;
                        buyer.text = data['buyer'];
                        orderQty.text = data['order_quantity'];
                        numberOfOperations.text = data['number_of_operations'];
                        machineType1.text = data['machine_type_1'] ?? '';
                        totalMachineReq1.text = data['total_machine_required_1'] ?? '';
                        machineType2.text = data['machine_type_2'] ?? '';
                        totalMachineReq2.text = data['total_machine_required_2'] ?? '';
                        machineType3.text = data['machine_type_3'] ?? '';
                        totalMachineReq3.text = data['total_machine_required_3'] ?? '';
                        garment.text = data['garment'] ?? '';
                      }
                    });
                  },
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Buyer"),
                  controller: buyer,
                  enabled: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: garment,
                  decoration: TextFieldDec.inputDec("Garment"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Order Quantity"),
                  keyboardType: TextInputType.number,
                  controller: orderQty,
                  enabled: false,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Number of Operation"),
                  controller: numberOfOperations,
                  keyboardType: TextInputType.number,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Machine Type"),
                  controller: machineType1,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Machine Required"),
                  controller: totalMachineReq1,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Machine Type"),
                  controller: machineType2,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Machine Required"),
                  controller: totalMachineReq2,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Machine Type"),
                  controller: machineType3,
                ),
                leaveSpace(),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Total Machine Required"),
                  controller: totalMachineReq3,
                  keyboardType: TextInputType.number,

                ),
                leaveSpace(),
                RaisedButton(
                  child: Text("Submit") ,
                  onPressed: () async {
                    scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Uploading"),));
                    try {
                        await Firestore.instance.collection('aarvi').document(styleNo.text).updateData({
                        'number_of_operations':numberOfOperations.text,
                        'machine_type_1':machineType1.text,
                        'total_machine_required_1':totalMachineReq1.text,
                        'machine_type_2':machineType2.text,
                        'total_machine_required_2':totalMachineReq2.text,
                        'machine_type_3':machineType3.text,
                        'total_machine_required_3':totalMachineReq3.text,
                      });
                      scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Done"),));
                    } catch (e) {
                      scaffoldState.currentState.showSnackBar(SnackBar(content: Text(e.toString()),));
                    }
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