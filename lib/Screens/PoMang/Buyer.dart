import 'dart:core';
// import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class Buyer{
  String name;
  String style;
  String desc;
  int quantity;
  String sizeBreakup;
  String fabricDetails;
  String printDetails;
  String washingDetails;
  String labelDetails;
  double price;
  String packingDetails;
  String address;
  String other;
  Buyer({this.name,this.style,this.desc,this.quantity,this.sizeBreakup,this.fabricDetails,this.printDetails,
  this.washingDetails,this.labelDetails,this.price,this.packingDetails,this.address,this.other});

  Buyer.convert(DocumentSnapshot snapshot){
    this.name = snapshot['name'] ?? " ";
    this.style = snapshot['style'] ?? " ";
    this.desc = snapshot['desc']?? " ";
    this.quantity = int.parse(snapshot['qty'].toString()) ?? 0;
    this.sizeBreakup = snapshot['sizeBreakup'] ?? "";
    this.fabricDetails = snapshot['fabricDetails'] ?? '';
    this.printDetails = snapshot['printDetails'] ?? '';
    this.washingDetails = snapshot['washingDetails'] ?? '';
    this.labelDetails = snapshot['labelDetails'] ?? '';
    if(snapshot['price']==null)
      this.price = 0;
    else
      this.price = double.parse(snapshot['price'].toString());
    this.packingDetails = snapshot['packingDetails'] ?? '';
    this.address = snapshot['address'] ?? '';
    this.other = snapshot['other'] ?? '';
  }
  Future setData() async {
    await Firestore.instance.collection("Buyer").document(name).setData({
      'name':name,
      'style':style,
      'desc':desc,
      'qty':quantity,
      'sizeBreakup':sizeBreakup,
      'fabricDetails':fabricDetails,
      'printDetails':printDetails,
      'washingDetails':washingDetails,
      'labelDetails':labelDetails,
      'price':price,
      'packingDetails':packingDetails,
      'address':address,
      'other':other
    });
  }
  Future updateData() async {
    await Firestore.instance.collection("Buyer").document(name).updateData({
      'name':name,
      'style':style,
      'desc':desc,
      'qty':quantity,
      'sizeBreakup':sizeBreakup,
      'fabricDetails':fabricDetails,
      'printDetails':printDetails,
      'washingDetails':washingDetails,
      'labelDetails':labelDetails,
      'price':price,
      'packingDetails':packingDetails,
      'address':address,
      'other':other
    });
  }

}
