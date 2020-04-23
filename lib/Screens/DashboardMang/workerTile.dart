import 'package:aarvi_textiles/models/Worker.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/services/textfieldBox.dart';

class WorkerTile extends StatelessWidget {
  final Worker worker;

  WorkerTile({this.worker});
  final _formKey = GlobalKey<FormState>();

  final List<String> operation = [
    'operation1',
    'operation2',
    'operation3',
    'operation4',
    'operation5',
  ];

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        isScrollControlled: true,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(60.0),
          ),
        ),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Update Operator Preferences',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Uid: ' + worker.uid.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: worker.name,
                    decoration: TextFieldDec.inputDec('Name'),
                    validator: (value) => value.isEmpty ? 'Enter a name' : null,
                    onChanged: (value) => worker.name = value,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: worker.operation,
                    decoration: TextFieldDec.inputDec('Operation'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter a Operation' : null,
                    onChanged: (value) => worker.operation = value,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: worker.lineno.toString(),
                    decoration: TextFieldDec.inputDec('Line No'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter a Line No' : null,
                    onChanged: (value) => worker.lineno = int.parse(value),
                  ),
                  // SizedBox(height: 20.0),
                  // TextFormField(
                  //   keyboardType: TextInputType.number,
                  //   initialValue: worker.uid.toString(),
                  //   decoration: TextFieldDec.inputDec('Uid'),
                  //   validator: (value) => value.isEmpty ? 'Enter a Uid' : null,
                  //   onChanged: (value) => worker.uid = int.parse(value),
                  // ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    initialValue: worker.password,
                    decoration: TextFieldDec.inputDec('password'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter a password' : null,
                    onChanged: (value) => worker.password = value,
                  ),

                  SizedBox(height: 20.0),
                  MaterialButton(
                      color: Colors.red,
                      child: Text('Update'),
                      onPressed: () {
                        worker.updateWorkerData();
                      })
                ]),
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: IconButton(
            icon: Icon(
              Icons.edit,
              size: 40.0,
            ),
            onPressed: () => _showSettingsPanel(),
          ),
          title: Text(worker.name),
          subtitle: Text(worker.operation ?? ''),
          trailing: Text(worker.lineno.toString()),
        ),
      ),
    );
  }
}
