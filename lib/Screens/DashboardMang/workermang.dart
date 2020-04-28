import 'package:aarvi_textiles/Screens/DashboardMang/webview.dart';
import 'package:aarvi_textiles/Screens/DashboardMang/workerlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aarvi_textiles/models/Worker.dart';
import 'package:aarvi_textiles/Screens/DashboardMang/database.dart';

class WorkerMang extends StatefulWidget {
  @override
  _WorkerMangState createState() => _WorkerMangState();
}

class _WorkerMangState extends State<WorkerMang> {
  @override

   
    
  Widget build(BuildContext context) {
    return StreamProvider<List<Worker>>.value(
      value: DatabaseService().worker,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Operator Mangement'),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.track_changes),
            onPressed: () {
              Navigator.pushNamed(context, '/aarviweb');
            },
          ),
        ],
      ),
      body: WorkerList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.person_add),
        onPressed: () {
           Navigator.pushNamed(context, '/addworker');
        },
      ),
    ),
    );
  }
}