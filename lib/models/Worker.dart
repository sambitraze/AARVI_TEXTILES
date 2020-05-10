import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Worker {
  static Worker user;

  DateTime date;
  int uid; //or email or username
  String password;
  String name;
  String operation;
  int lineno;
  DateTime timein;
  DateTime timeout;
  bool active;

  Worker({this.date,
    this.lineno,
    this.name,
    this.operation,
    this.timein,
    this.timeout,
    this.uid,
    this.password,
    this.active});

  static Future<bool> signIn(int uid, String password) async {
    try {
      var x = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "$uid@aarvi.com", password: password);
      print(x.toString());
      await Firestore.instance
          .collection('Worker')
          .document(uid.toString())
          .get()
          .then((value) {
        user = Worker.fromSnapshot(value);
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void setTimeIn() {
    timein = DateTime.now();
  }

  void setTimeOut() {
    timeout = DateTime.now();
  }

  Future<bool> createWorker() async {
    bool success = false;
    await Firestore.instance
        .collection('Worker')
        .document(uid.toString())
        .setData({
      'name': name,
      'uid': uid,
      'password': password,
      'operation': operation,
      'line_no': lineno
    }).then((value) async {
      print("Creating user");
      print("$uid@aarvi.com");
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "$uid@aarvi.com", password: password);
      success = true;
    }).catchError((e, stack) => print("ERROR"));

    return success;
  }

  Future<bool> updateWorkerData() async {
    bool success = false;
    await Firestore.instance
        .collection('Worker')
        .document(uid.toString())
        .updateData({
      'name': name,
      'uid': uid,
      'password': password,
          'operation': operation,
      'line_no': lineno
        })
        .then((value) => success = true)
        .catchError((e, stack) => print("not updated"));

    return success;
  }

  Future<bool> setActive() async {
    bool status = false;
    try {
      await Firestore.instance.collection('operation').document(DateFormat('yyyyMMdd').format(DateTime.now()))
          .collection(lineno.toString()).document(uid.toString()).setData({
        'name': name,
        'uid': uid,
        'operation': operation,
        'line_no': lineno,
        'time_in': timein,
        'active':true,
        'time_out':timeout
      })
          .then((_) => status = true);
    } catch (e) {
      print("Error adding worker to active");
    }
    return status;
  }

  Future<bool> activate() async {
    bool status = false;
    try {
      await Firestore.instance.collection('operation').document(DateFormat('yyyyMMdd').format(DateTime.now()))
          .collection(lineno.toString()).document(uid.toString()).setData({
        'name': name,
        'uid': uid,
        'operation': operation,
        'line_no': lineno,
        'time_in': timein,
        'active':true,
        'time_out':timeout
      })
          .then((_) => status = true);
      print("Update ops");
      await Firestore.instance.collection('operation').document(DateFormat('yyyyMMdd').format(DateTime.now())).setData({
        "lines": FieldValue.arrayUnion([lineno])
      },merge: true);
    } catch (e) {
      print("Error adding worker to active");
      print(e);
    }
    return status;
  }

  Future<bool> setComplete() async {
    bool status = false;
    try {
      await Firestore.instance.collection('operation').document(DateFormat('yyyyMMdd').format(DateTime.now()))
          .collection('$lineno')
          .document(
          uid.toString())
          .updateData({
        'name': name,
        'uid': uid,
        'operation': operation,
        'line_no': lineno,
        'time_in': timein,
        'time_out': timeout,
        'active':false
      })
          .then((_) => status = true);

      await Firestore.instance.collection('lines').document(lineno.toString())
          .collection('active').document(uid.toString())
          .delete();
    } catch (e) {
      print("Error adding worker to complete");
    }
    return status;
  }

  Worker.fromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot.data);
    name = snapshot.data['name'] ?? '';
    operation = snapshot.data['operation'] ?? '';
    password = snapshot.data['password'] ?? '';
    lineno = snapshot.data['line_no'];
    uid = snapshot.data['uid'];
  }
}
