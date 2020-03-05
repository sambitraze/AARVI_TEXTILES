import 'package:aarvi_textiles/Screens/HomePage.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BoM.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BuyersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/FabricEnquiry.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/OrderTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/StockMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/TnA.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/CuttingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/FinishingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/PackagingPage.dart';
import 'package:aarvi_textiles/Screens/ProductionMang/SewingPage.dart';
import 'package:aarvi_textiles/Screens/login.dart';
import 'package:flutter/material.dart';
import 'Screens/PoMang/PoMang.dart';
import 'Screens/ProductionMang/ProductionMang.dart';
import 'Screens/QualityMang/QualityMang.dart';
import 'Screens/MerchandisingMang/MerchandisingMang.dart';
import 'Screens/DocumentationMang/DocumentationMang.dart';
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
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
      '/AdminHomePage': (BuildContext context) => HomePage(),
      '/HomePage': (BuildContext context) => MyHomePage(),   
      '/PoMang': (BuildContext context) => PoMang(),         
      '/MerchandisingMang': (BuildContext context) => MerchandisingMang(),     
      '/ProductionMang': (BuildContext context) => ProductionMnag(),
      '/QualityMang': (BuildContext context) => QualityMang(),      
      '/DocumentationMang': (BuildContext context) => DocumentationMang(),       
      '/AddBuyersPage': (BuildContext context) => AddBuyersPage(),
      '/CuttingPage': (BuildContext context) => CuttingPage(),
      '/SewingPage': (BuildContext context) => SewingPage(),
      '/PackagingPage': (BuildContext context) => PackagingPage(),
      '/FinishingPage': (BuildContext context) => FinishingPage(),
      '/BoM': (BuildContext context) => BoM(),
      '/BuyersMang':(BuildContext context) => BuyersMang(),
      '/FabricEnquiry':(BuildContext context) => FabricEnquiry(),
      '/OrderTrack': (BuildContext context) => OrderTrack(),
      '/SampleTrack': (BuildContext context) => SampleTrack(),
      '/StockMang': (BuildContext context) => StockMang(),
      '/SuppliersMang': (BuildContext context) => SuppliersMang(),
      '/TnA': (BuildContext context) => TnA(),
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
