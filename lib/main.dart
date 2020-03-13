import 'package:aarvi_textiles/Screens/HomePage.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BoM.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BuyersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/FabricEnquiry.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/OrderTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackCutting.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackPattern.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/StockMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMangement/CartonSup.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMangement/FabricSup.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMangement/LabelTagSup.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMangement/PolybagSup.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMangement/TrimSup.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/TnA.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage/CutOrderPlan.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage/CuttingQuality.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage/DailyCuttingReport.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/FinishingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/PackagingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/SewingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/SewingPage/DailyProductionReport.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/SewingPage/HourlyProduction.dart';
import 'package:aarvi_textiles/Screens/login.dart';
import 'package:flutter/material.dart';
import 'Screens/PoMang/PoMang.dart';
import 'Screens/ProductionMang/ProductionMang.dart';
import 'Screens/QualityMang/QualityMang.dart';
import 'Screens/MerchandisingMang/MerchandisingMang.dart';
import 'package:aarvi_textiles/Screens/PoMang/AddBuyersPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      // theme: ThemeData.dark(),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
      '/AdminHomePage': (BuildContext context) => HomePage(),
      '/HomePage': (BuildContext context) => MyHomePage(),   
      '/PoMang': (BuildContext context) => PoMang(),
        '/AddBuyersPage': (BuildContext context) => AddBuyersPage(),         
      '/MerchandisingMang': (BuildContext context) => MerchandisingMang(),
        '/BoM': (BuildContext context) => BoM(),
        '/BuyersMang':(BuildContext context) => BuyersMang(),
        '/FabricEnquiry':(BuildContext context) => FabricEnquiry(),
        '/OrderTrack': (BuildContext context) => OrderTrack(),
        '/SampleTrack': (BuildContext context) => SampleTrack(), 
          '/Pattern': (BuildContext context) => SampleTrackPattern(),
          '/Cutting':(BuildContext context) => SampleTrackCutting(), 
        '/StockMang': (BuildContext context) => StockMang(),
        '/SuppliersMang': (BuildContext context) => SuppliersMang(),
          '/FabricSup': (BuildContext context) => FabricSup(),
          '/TrimSup': (BuildContext context) => Trimsup(),
          '/LabelTagSup': (BuildContext context) => LabelTagSup(),
          '/PolybagSup': (BuildContext context) => PolybagSup(),
          '/CartonSup': (BuildContext context) => CartonSup(),   
        '/TnA': (BuildContext context) => TnA(),
      '/ProductionMang': (BuildContext context) => ProductionMnag(),
        '/CuttingPage': (BuildContext context) => CuttingPage(),
          '/CutOrderPlan': (BuildContext context) => CutOrderPlan(),
          '/DailyCuttingPlan': (BuildContext context) => DailyCuttingReport(),
          '/CuttingQuality': (BuildContext context) => CuttingQuality(),          
        '/SewingPage': (BuildContext context) => SewingPage(),
          '/DailyProductionReport': (BuildContext context) => DailyProductionReport(),
        '/PackagingPage': (BuildContext context) => PackagingPage(),
        '/FinishingPage': (BuildContext context) => FinishingPage(),
      '/QualityMang': (BuildContext context) => QualityMang(),          
      '/SewingHourlyProduction':(BuildContext context) => SewingHourlyProduction()
      
      
        
      
      //subScrrens
        
     
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;
  bool _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AARVI TEXTILES'))),
      body:Loginscreen()
    );
  }
}
