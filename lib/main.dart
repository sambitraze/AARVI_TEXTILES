import 'package:aarvi_textiles/Screens/HomePage.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BoM.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/BuyersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/FabricEnquiry.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/OrderTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SampleTrack.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/StockMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/SuppliersMang.dart';
import 'package:aarvi_textiles/Screens/MerchandisingMang/TnA.dart';
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
      '/BoM': (BuildContext context) => BoM(),
      '/TnA': (BuildContext context) => TnA(),
      '/FabricEnquiry': (BuildContext context) => FabricEnquiry(),
      '/StockMang': (BuildContext context) => StockMang(),
      '/SampleTrack': (BuildContext context) => SampleTrack(),
      '/OrderTrack': (BuildContext context) => OrderTrack(),
      '/SuppliersMang': (BuildContext context) => SuppliersMang(),
      '/BuyersMang': (BuildContext context) => BuyersMang(),
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
