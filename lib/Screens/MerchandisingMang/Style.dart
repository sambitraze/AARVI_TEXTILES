import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Style {
  String styleNo;
  String stylelist;

  Style({this.styleNo});

  Style.convert(DocumentSnapshot snapshot) {
    this.styleNo = snapshot['StyleNo'] ?? " ";
  }

  Future setData() async {
    await Firestore.instance
        .collection("Style")
        .document(stylelist)
        .setData({'StyleNo': styleNo});
  }

  Future updateData() async {
    await Firestore.instance
        .collection("Style")
        .document(stylelist)
        .updateData({'StyleNo': styleNo});
  }
}
