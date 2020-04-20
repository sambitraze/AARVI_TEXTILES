import 'package:aarvi_textiles/models/Worker.dart';
import 'package:flutter/material.dart';

class WorkerTile extends StatelessWidget {
  final Worker worker;

  WorkerTile({this.worker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,//for showing active ststus greenif working red if not
          ),
          title: Text(worker.name),
          subtitle: Text('line no and operation'),
        ),
      ),
    );
  }
}