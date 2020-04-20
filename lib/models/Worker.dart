import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class Worker {

  static bool auth = false;

  DateTime date;
  int uid;//or email or username
  String password;
  String name;
  String operation;
  int lineno;
  DateTime timein;
  DateTime timeout;

  Worker({this.date,this.lineno,this.name,this.operation,this.timein,this.timeout,this.uid,this.password});

  static void signIn(int uid, int password){
    //Get worker with the uid from firebase, compare the password
    auth = true;
    //Also return worker
  }
  static void signOut(){
    auth = false;
  }

  void setTimeIn(){
    timein = DateTime.now();
  }
  void setTimeOut(){
    timeout = DateTime.now();
  }
  
  Future<bool> createWorker() async {
    bool success = false;
    await Firestore.instance.collection('Worker').document(uid.toString())
        .setData({
          'name':name,
          'uid':uid,
          'password':password,
          'operation': operation,
          'line_no':lineno
        })
        .then((value) => success = true)
        .catchError((e,stack) => print("ERROR"));

    return success;
  }
   
}