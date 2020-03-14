import 'dart:core';
// import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class Buyer{
  String name;
  String style;
  String desc;
  String quantity;
  String sizeBreakup;
  String fabricDetails;
  String printDetails;
  String washingDetails;
  String labelDetails;
  String price;
  String packingDetails;
  String address;
  String other;
  Buyer({this.name,this.style,this.desc,this.quantity,this.sizeBreakup,this.fabricDetails,this.printDetails,
  this.washingDetails,this.labelDetails,this.price,this.packingDetails,this.address,this.other});

  Buyer.convert(DocumentSnapshot snapshot){
    this.name = snapshot['buyer'] ?? " ";
    this.style = snapshot['style'] ?? " ";
    this.desc = snapshot['description']?? " ";
    this.quantity = snapshot['order_quantity'];
    this.sizeBreakup = snapshot['size_breakup'] ?? "";
    this.fabricDetails = snapshot['fabric_details'] ?? '';
    this.printDetails = snapshot['print_details'] ?? '';
    this.washingDetails = snapshot['washing_details'] ?? '';
    this.labelDetails = snapshot['label_details'] ?? '';
    this.price = snapshot['price'] ?? '';
    this.packingDetails = snapshot['packingDetails'] ?? '';
    this.address = snapshot['address'] ?? '';
    this.other = snapshot['other'] ?? '';
  }
  Future setData() async {
    await Firestore.instance.collection("aarvi").document(style).setData({
      'name':name,
      'style':style,
      'description':desc,
      'order_quantity':quantity,
      'size_breakup':sizeBreakup,
      'fabric_details':fabricDetails,
      'print_details':printDetails,
      'washing_details':washingDetails,
      'label_details':labelDetails,
      'price':price,
      'packing_details':packingDetails,
      'address':address,
      'other':other,
      'buyer':name,
    });
  }
  Future updateData() async {
    await Firestore.instance.collection("aarvi").document(style).updateData({
      'name':name,
      'style':style,
      'description':desc,
      'order_quantity':quantity,
      'size_breakup':sizeBreakup,
      'fabric_details':fabricDetails,
      'print_details':printDetails,
      'washing_details':washingDetails,
      'label_details':labelDetails,
      'price':price,
      'packing_details':packingDetails,
      'address':address,
      'other':other,
      'buyer':name,
    });
  }

}
