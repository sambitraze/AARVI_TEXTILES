import 'package:aarvi_textiles/Screens/search/searchhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aarvi Textiles"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, size: 30,),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchHome())),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut().then((value) {
              Navigator.pop(context);
            }),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  minWidth: 200,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/PoMang');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/po.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text('Po Mangement'),
                      SizedBox(height: 15)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  minWidth: 200,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/MerchandisingMang');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/merchandise.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text('Merchandising Mangement'),
                      SizedBox(height: 15)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  minWidth: 200,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ProductionMang');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/production.png',
                        height: 100,
                        width: 100,
                      ),
                      Text('Production Mangement'),
                      SizedBox(height: 15)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  minWidth: 200,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/QualityMang');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/quality.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text('Quality Mangement'),
                      SizedBox(height: 15)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  minWidth: 200,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/WorkerMang');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/worker.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Text('Worker Mangement'),
                      SizedBox(height: 15)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
