import 'package:aarvi_textiles/models/Worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference workerCollection =
      Firestore.instance.collection('Worker');
  
  List<Worker> _workerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Worker.fromSnapshot(doc);
    }).toList();
  }

  Stream<List<Worker>> get worker { 
    return workerCollection.snapshots().map(_workerListFromSnapshot);
  }

}