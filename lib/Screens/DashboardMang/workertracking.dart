import 'package:aarvi_textiles/models/Worker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkerTracking extends StatefulWidget {
  @override
  _WorkerTrackingState createState() => _WorkerTrackingState();
}

class _WorkerTrackingState extends State<WorkerTracking> {
  Worker w = Worker.user;
  String timeIn = '';
  String timeOut = '';
  DateTime tin;
  DateTime tout;
  bool buttonSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Operator Tracking'),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.track_changes),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Name: ',
                  style: TextStyle(fontSize: 28.0),
                ),
                SizedBox(width: 20.0),
                Text(
                  w.name,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Operation: ',
                  style: TextStyle(fontSize: 28.0),
                ),
                SizedBox(width: 20.0),
                Text(
                  w.operation,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Line No: ',
                  style: TextStyle(fontSize: 28.0),
                ),
                SizedBox(width: 20.0),
                Text(
                  w.lineno.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: Colors.redAccent,
                  onPressed: buttonSwitch ? () async {
                    w.timein = DateTime.now();
                    setState(() {
                      buttonSwitch = false;
                      timeIn = DateFormat(DateFormat.HOUR_MINUTE_SECOND).format(
                          w.timein);
                      w.setActive();
                    });
                  } : null,
                  child: Text('Start/In'),
                ),
                SizedBox(width: 20.0),
                Text(
                  timeIn,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: buttonSwitch ? null : () {
                    w.timeout = DateTime.now();
                    setState(() {
                      buttonSwitch = true;
                      timeOut = DateFormat(DateFormat.HOUR_MINUTE_SECOND)
                          .format(w.timeout);
                      w.setComplete();
                    });
                  },
                  child: Text('Stop/Out'),
                ),
                SizedBox(width: 20.0),
                Text(
                  timeOut,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total Time: ',
                  style: TextStyle(
                      fontSize: 28.0
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  "${w.timein != null && w.timeout != null ? w.timeout
                      .difference(w.timein).toString() : ''}",
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
