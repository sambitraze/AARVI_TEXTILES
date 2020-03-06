
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Styles{
  String bom,tna,styleNo,buyer,fabricDetails,printDetails,washingDetails,trimsDetails,trimsAvailable;
  File billOfMaterial,tnaFile;
  double gsm;
  int totalFabricReq,totalDefectedFabric,intAvailableFabric;

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


  //Sample Tracking
  Styles.setSampleTrack({this.styleNo,this.patternCompleted,this.patternCorrectionReq,this.expectedDateOfPatternCompletion});

  Future updateSample(Styles sample,bool update) async {
    if(update == true) {
      try {
        Firestore.instance.collection('Style').document(styleNo).setData({
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
      Firestore.instance.collection('Style').document(styleNo).updateData({
        'styleNo':this.styleNo,
        'patternCompleted':this.patternCompleted,
        'patternCorrectionRequired':this.patternCorrectionReq,
        'expectedDateOfPatternCompletion':this.expectedDateOfPatternCompletion,
    });
    }
  }

  static Future<Styles> getSampleTrack(String styleNo) async {
   var document = await Firestore.instance.collection('Style').document(styleNo);
   Styles s;
   await document.get().then((value) async {
     if(value.exists){
       s = Styles.setSampleTrack(styleNo: value.data['styleNo'],patternCompleted: value.data['patternCompleted'],patternCorrectionReq: value.data['patternCorrectionRequired'],expectedDateOfPatternCompletion: DateTime.now());
       print("FETCHED");
     }
     else{
       print("Record does not exist");
     }
   });
   return s;
  }

  //Sample Tracking -- Cutting
  Styles.getCutting({this.styleNo,this.totalPiecesToBeCut,this.expectedDateToCutting,this.cuttingReq,this.cuttingManPowerReq,this.sampleType});
  static getCuttingFromStyleNo(String styleNo) async {
    Styles s;
    var doc =  Firestore.instance.collection('Style').document(styleNo);
    await doc.get().then((value) {
      if(value.exists){
        s = Styles.getCutting(styleNo: value.data['styleNo'],totalPiecesToBeCut: value.data['totalPiecesToBeCut'],expectedDateToCutting: value.data['expectedDateToCutting'],
        cuttingReq: value.data['cuttingReq'],cuttingManPowerReq: value.data['cuttingManPowerReq'],sampleType: value.data['sampleType']);
      }
      else
        s = null;
      return s;
    });
  }

}