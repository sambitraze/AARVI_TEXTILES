import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class AddWorker extends StatefulWidget {
  @override
  _AddWorkerState createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Worker'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: TextFieldDec.inputDec("Name of worker"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Email or userid"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: TextFieldDec.inputDec("password"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Sam"),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: TextFieldDec.inputDec("Line No"),
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: (){},
                  child: Text('Add'),
                  color: Colors.orangeAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
