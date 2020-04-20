import 'package:aarvi_textiles/models/Worker.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class AddWorker extends StatefulWidget {
  @override
  _AddWorkerState createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  List controllers = List<TextEditingController>();

  @override
  void initState() {
    [0,1,2,3,4].forEach((element) => controllers.add(TextEditingController()));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Operator'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: controllers[0],
                  decoration: TextFieldDec.inputDec("Name of Operator"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controllers[1],
                  decoration: TextFieldDec.inputDec("Email or userid"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controllers[2],
                  decoration: TextFieldDec.inputDec("password"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controllers[3],
                  decoration: TextFieldDec.inputDec("Operatoion"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: controllers[4],
                  decoration: TextFieldDec.inputDec("Line No"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () async {
                    Worker w = Worker(
                      name: controllers[0].value.text,
                      uid: int.tryParse(controllers[1].value.text),
                      password: controllers[2].value.text,
                      operation: controllers[3].value.text,
                      lineno: int.tryParse(controllers[4].value.text)
                    );
                    bool success = false;
                    success = await w.createWorker();
                    if (success){
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Worker added"),));
                    }
                    else{
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Failed to add worker"),));
                    }
                  },
                  child: Text('Add'),
                  color: Colors.cyan,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
