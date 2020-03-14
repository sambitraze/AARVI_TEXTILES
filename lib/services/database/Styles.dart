
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
        Firestore.instance.collection('Style').document(styleNo).updateData({
          'styleNo': this.styleNo,
          'patternCompleted': this.patternCompleted,
          'patternCorrectionRequired': this.patternCorrectionReq,
          'expectedDateOfPatternCompletion': this
              .expectedDateOfPatternCompletion,
        });
      } catch (e) {
        print(e.toString());
      }
    }
    else{
      Firestore.instance.collection('Style').document(styleNo).setData({
        'styleNo':this.styleNo,
        'patternCompleted':this.patternCompleted,
        'patternCorrectionRequired':this.patternCorrectionReq,
        'expectedDateOfPatternCompletion':this.expectedDateOfPatternCompletion,
    });
    }
  }

  static Future<Styles> getSamplePatternTrack(String styleNo) async {
   var document = await Firestore.instance.collection('Style').document(styleNo);
   Styles s;
   await document.get().then((value) async {
     if(value.exists){
       s = Styles.setSampleTrack(styleNo: value.data['styleNo'],patternCompleted: value.data['patternCompleted'],patternCorrectionReq: value.data['patternCorrectionRequired'],
           expectedDateOfPatternCompletion: (value.data['expectedDateOfPatternCompletion'] as Timestamp).toDate());
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
    var doc =  Firestore.instance.collection('Style').document(styleNo);
    await doc.get().then((value) {
      if(value.exists){
        print("Exists");
        s = Styles.getCutting(styleNo: value.data['styleNo'],totalPiecesToBeCut: value.data['totalPiecesToBeCut'],expectedDateToCutting: (value.data['expectedDateToCutting'] as Timestamp).toDate(),
        cuttingReq: (value.data['cuttingReq'] ?? false),cuttingManPowerReq: value.data['cuttingManPowerReq'],sampleType: value.data['sampleType']);
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
        Firestore.instance.collection('Style').document(styleNo).updateData({
          'styleNo': this.styleNo,
          'cutting_total_pieces': this.totalPiecesToBeCut,
          'cutting_manpower_required': this.cuttingManPowerReq,
          'cutting_sampleType': this
              .sampleType,
          'cutting_expected_date_of_completion':expectedDateToCutting
        });
      } catch (e) {
        print(e.toString());
      }
    }
    else{
      Firestore.instance.collection('Style').document(styleNo).setData({
        'styleNo': this.styleNo,
        'cutting_total_pieces': this.totalPiecesToBeCut,
        'cutting_manpower_required': this.cuttingManPowerReq,
        'cutting_sampleType': this
            .sampleType,
        'cutting_expected_date_of_completion':expectedDateToCutting
      });
    }
  }

  //Bill of Material
  static Future<Styles> getStyleFromStyleNo(String style) async {
    Styles s;
    await Firestore.instance.collection('Style').document(style).get().then((value){
      if(value.exists){
        try{
          s = Styles.getObjectFromStyleNo(styleNo: value.data['styleNo']);
          print(s.styleNo + "In function");
        }catch(e){
          print(e.toString());
        }
        print("GOT it");
      }
      else{
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
      Firestore.instance.collection('Style').document(styleNo).updateData({
        'billOfMaterial':billOfMaterial
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
      Firestore.instance.collection('Style').document(styleNo).updateData({
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
      await Firestore.instance.collection('Style').document(styleNo).get().then((value){
        if(value.exists){
          var data = value.data;
          buyer = data['buyer'] ?? '';
          fabricDetails = data['fabricDetails'] ?? '';
          gsm = data['gsm'] ?? '0';
          printDetails = data['printDetails'] ?? '';
          washingDetails = data['washingDetails'] ?? '';
          totalFabricReq = data['totalFabricRequired'] ?? '0';
          totalDefectedFabric = data['totalDefectedFabric'] ?? '0';
          exists = true;
        }
      });
      return exists;
    }

  Future<bool> getStock() async {
    bool exists = false;
    await Firestore.instance.collection('Style').document(styleNo).get().then((value){
      if(value.exists){
        var data = value.data;
        fabricDetails = data['fabricDetails'] ?? '';
        availableFabric = data['availableFabirc'] ?? '0';
        trimsDetails = data['trimsDetails'] ?? '';
        trimsAvailable = data['trimsAvailable'] ?? '0';
        exists = true;
      }
    });
    return exists;
  }



}