import 'package:flutter/material.dart';

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
      '/HomePage': (BuildContext context) => new MyHomePage(),   
      '/PoMang': (BuildContext context) => new MyHomePage(),         
      '/MerchandisingMang': (BuildContext context) => new MyHomePage(),     
      '/ProductionMang': (BuildContext context) => new MyHomePage(),
      '/QualityMang': (BuildContext context) => new MyHomePage(),      
      '/DocumentationMang': (BuildContext context) => new MyHomePage(),  
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
              onPressed: () {}, child: Text('Po Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {}, child: Text('Merchandising Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {}, child: Text('Production Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {}, child: Text('Quality Mangement'),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {}, child: Text('Documentation Mangement'),
            ),
          ],
        ),
      ),
    );
  }
}
