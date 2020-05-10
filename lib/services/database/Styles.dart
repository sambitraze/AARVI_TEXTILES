
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class Styles{
  String bom,tna,styleNo,buyer,fabricDetails,printDetails,washingDetails,trimsDetails,trimsAvailable;
  String billOfMaterial,tnaFile;
  String gsm;
  String totalFabricReq,totalDefectedFabric,availableFabric;

  //Sample Tracking - Pattern
  DateTime expectedDateOfPatternCompletion;
  bool patternCompleted,patternCorrectionReq;
  //Submit This

  //Sample Tracking - Cutting
  int totalPiecesToBeCut;
  DateTime expectedDateToCutting;
  bool cuttingReq;
  String cuttingManPowerReq;
  String sampleType;

  //Sample Tracking - Sewing
  int totalPiece;
  String sewingMachineReq;
  String sewingManPowerReq;
  //SampleType given in cutting
  String sewingExpectedDate;

  //Sample Tracking - Quality
  int totalPiecesChecked;
  int totalDefect;
  int totalRework;
  int totalReject;

  //Merchandising Management - Order Tracking
  DateTime orderConfirmationDate;
  DateTime orderDispatchDate;
  String currentOrderStatus;


  //Simplifying stuff
  Styles.getObjectFromStyleNo({this.styleNo});
  //Sample Tracking
  Styles.setSampleTrack({this.styleNo,this.patternCompleted,this.patternCorrectionReq,this.expectedDateOfPatternCompletion});
  Future updateSamplePattern(Styles sample,bool update) async {
    if(update == true) {
      try {
        Firestore.instance.collection('aarvi').document(styleNo).updateData({
          'style': this.styleNo,
          'pattern_completed': this.patternCompleted,
          'pattern_correction_required': this.patternCorrectionReq,
          'expected_date_of_pattern_completion': this
              .expectedDateOfPatternCompletion,
        });
      } catch (e) {
        print(e.toString());
      }
    }
    else{
      Firestore.instance.collection('aarvi').document(styleNo).updateData({
        'style': this.styleNo,
        'pattern_completed': this.patternCompleted,
        'pattern_correction_required': this.patternCorrectionReq,
        'expected_date_of_pattern_completion': this
            .expectedDateOfPatternCompletion,
      });
    }
  }

  static Future<Styles> getSamplePatternTrack(String styleNo) async {
   var document = Firestore.instance.collection('aarvi').document(styleNo);
   Styles s;
   await document.get().then((value) async {
     if(value.exists){
       s = Styles.setSampleTrack(styleNo: value.data['style'],patternCompleted: value.data['pattern_completed'],patternCorrectionReq: value.data['pattern_correction_required'],
           expectedDateOfPatternCompletion: (value.data['expected_date_of_pattern_completion'] as Timestamp).toDate());
       print("FETCHED");
     }
     else{
       print("Record does not exist");
       s = null;
     }
   });
   return s;
  }

  //Sample Tracking -- Cutting
  Styles.getCutting({this.styleNo,this.totalPiecesToBeCut,this.expectedDateToCutting,this.cuttingReq,this.cuttingManPowerReq,this.sampleType});
  static Future <Styles> getCuttingFromStyleNo(String styleNo) async {
    Styles s;
    var doc =  Firestore.instance.collection('aarvi').document(styleNo);
    await doc.get().then((value) {
      if(value.exists){
        print("Exists");
        s = Styles.getCutting(styleNo: value.data['style'],totalPiecesToBeCut: value.data['cutting_total_pieces'],expectedDateToCutting: (value.data['cutting_expected_date'] as Timestamp).toDate(),
        cuttingReq: (value.data['cutting_required'] ?? false),cuttingManPowerReq: value.data['cutting_manpower_required'],sampleType: value.data['cutting_sample_type']);
      }
      else{
        s = null;
      }
    });
    return s;
  }
  Future updateSampleCutting(Styles sample,bool update) async {
    if(update == true) {
      try {
        Firestore.instance.collection('aarvi').document(styleNo).updateData({
          'cutting_total_pieces': this.totalPiecesToBeCut,
          'cutting_manpower_required': this.cuttingManPowerReq,
          'cutting_sample_type': this
              .sampleType,
          'cutting_required':this.cuttingReq,
          'cutting_expected_date':expectedDateToCutting
        });
      } catch (e) {
        print(e.toString());
      }
    }
    else{
      Firestore.instance.collection('aarvi').document(styleNo).updateData({
        'cutting_total_pieces': this.totalPiecesToBeCut,
        'cutting_manpower_required': this.cuttingManPowerReq,
        'cutting_sample_type': this
            .sampleType,
        'cutting_expected_date':expectedDateToCutting
      });
    }
  }

  //Bill of Material
  static Future<Styles> getStyleFromStyleNo(String style) async {
    Styles s;
    await Firestore.instance.collection('aarvi').document(style.toString()).get().then((value){
      print(value.data);
      if(value.exists){
        try{
          s = Styles.getObjectFromStyleNo(styleNo: value.data['style']);
          print(s.styleNo + "In function");
        }catch(e){
          print("DID NOT GET");
          print(e.toString());
        }
        print("GOT it");
      }
      else{
        print("DID NOT GET and Else");
        s = null;
      }
    });
    print(style);
    return s;
  }

  Future uploadBill(File bill) async {
    final filename = "bill_" +styleNo+"_"+ DateFormat('yyyy_MM_dd_HH:mm:ss').format(DateTime.now());
    print(filename);
    final StorageReference storageRef = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask uploadTask = storageRef.putFile(bill,StorageMetadata(
      contentType: "Bill",
      customMetadata: <String,String>{'uploadedAt':DateTime.now().toString()}
    ));

    await uploadTask.onComplete;
    if(uploadTask.isSuccessful){
      billOfMaterial = await storageRef.getDownloadURL();
      Firestore.instance.collection('aarvi').document(styleNo).updateData({
        'bill_of_material':billOfMaterial
      });
      return true;
    }
    else{
      return false;
    }
  }

  Future uploadTna(File tna) async {
    final filename = "tna_" +styleNo+"_"+ DateFormat('yyyy_MM_dd_HH:mm:ss').format(DateTime.now());
    print(filename);
    final StorageReference storageRef = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask uploadTask = storageRef.putFile(tna,StorageMetadata(
        contentType: "TnA",
        customMetadata: <String,String>{'uploadedAt':DateTime.now().toString()}
    ));

    await uploadTask.onComplete;
    if(uploadTask.isSuccessful){
      tnaFile = await storageRef.getDownloadURL();
      Firestore.instance.collection('aarvi').document(styleNo).updateData({
        'TnA':tnaFile
      });
      return true;
    }
    else{
      return false;
    }
  }

  //Fabric enquiry
  Future<bool> getFabricDetails() async {
    bool exists = false;
      await Firestore.instance.collection('aarvi').document(styleNo).get().then((value){
        if(value.exists){
          var data = value.data;
          buyer = data['buyer'] ?? '';
          fabricDetails = data['fabric_details'] ?? '';
          gsm = data['gsm'] ?? '0';
          printDetails = data['print_details'] ?? '';
          washingDetails = data['washing_details'] ?? '';
          totalFabricReq = data['total_fabric_required'] ?? '0';
          totalDefectedFabric = data['total_defective_fabric'] ?? '0';
          exists = true;
        }
      });
      return exists;
    }

  Future<bool> getStock() async {
    bool exists = false;
    await Firestore.instance.collection('aarvi').document(styleNo).get().then((value){
      if(value.exists){
        var data = value.data;
        fabricDetails = data['fabric_details'] ?? '';
        availableFabric = data['available_fabric'] ?? '0';
        trimsDetails = data['trims_details'] ?? '';
        trimsAvailable = data['trims_available'] ?? '0';
        exists = true;
      }
    });
    return exists;
  }



}