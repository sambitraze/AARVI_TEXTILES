import 'package:flutter/material.dart';
import 'Screens/PoMang/PoMang.dart';
import 'Screens/ProductionMang/ProductionMang.dart';
import 'Screens/QualityMang/QualityMang.dart';
import 'Screens/MerchandisingMang/MerchandisingMang.dart';
import 'Screens/DocumentationMang/DocumentationMang.dart';

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
      '/HomePage': (BuildContext context) => MyHomePage(),   
      '/PoMang': (BuildContext context) => PoMang(),         
      '/MerchandisingMang': (BuildContext context) => MerchandisingMang(),     
      '/ProductionMang': (BuildContext context) => ProductionMnag(),
      '/QualityMang': (BuildContext context) => QualityMang(),      
      '/DocumentationMang': (BuildContext context) => DocumentationMang(),  
    },
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AARVI TEXTILES'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('Po Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context, '/PoMang');
              },
              child: Text('Merchandising Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: Text('Production Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: Text('Quality Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: Text('Documentation Mangement'),
            ),
          ],
        ),
      ),
    );
  }
}
