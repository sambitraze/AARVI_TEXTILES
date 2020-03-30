import 'package:aarvi_textiles/Screens/HomePage.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BoM.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BuyersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/FabricEnquiry.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/OrderTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackCutting.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackPattern.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackSewing.dart';
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
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/MachineReq.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/iemanage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/opBulletin.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/IEManagement/timeStudy.dart';
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
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTracking/SampleTrackQuality.dart';
import 'package:custom_splash/custom_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,      
      ),
      // theme: ThemeData.dark(),
      
      home:  CustomSplash(
        imagePath: 'assets/icon/icon.png',
        animationEffect: 'zoom-in',
        logoSize: 200,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        home: Loginscreen() 
      ),
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
          '/Quality':(BuildContext context) => SampleTrackQuality(),
          '/Sewing':(BuildContext context) => SampleTrackSewing(),
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
          '/SewingHourlyProduction':(BuildContext context) => SewingHourlyProduction(),
          '/ieManage': (BuildContext context) => IEmanage(),
            '/opBulletin': (BuildContext context) => OpBulletin(),
            '/timeStudy': (BuildContext context) => TimeStudy(),
            '/machinceReq': (BuildContext context) => MachineReq(),
        '/PackagingPage': (BuildContext context) => PackagingPage(),
        '/FinishingPage': (BuildContext context) => FinishingPage(),
      '/QualityMang': (BuildContext context) => QualityMang(),             
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // bool _isLoggedIntion = false;
  // bool _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Loginscreen()
    );
  }
}
