import 'package:aarvi_textiles/models/Worker.dart';

class Line{
  int lineNo;
  List<int> workers = new List();

  //Constructor
  Line({this.lineNo});

  void addWorkerToLine(Worker worker){
    workers.add(worker.uid);
    //Firebase part
  }
}