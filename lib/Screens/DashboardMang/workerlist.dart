import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aarvi_textiles/models/Worker.dart';
import 'package:aarvi_textiles/Screens/DashboardMang/workerTile.dart';

class WorkerList extends StatefulWidget {
  @override
  _WorkerListState createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  @override
  Widget build(BuildContext context) {
    final worker = Provider.of<List<Worker>>(context) ?? [];

    return ListView.builder(
      itemCount: worker.length,
      itemBuilder: (context, index){
        return WorkerTile(worker: worker[index]);
      },
    );
  }
}