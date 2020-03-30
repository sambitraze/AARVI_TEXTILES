import 'package:flutter/material.dart';

class IEmanage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IE Management"),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: new GridView.count(
          crossAxisCount: 1,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: <Widget>[
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text(
                      'Operation\nBulletin',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/opBulletin');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text(
                      'Time\nStudy',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/timeStudy');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text(
                      'Machine\nRequirement',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/machinceReq');
                },
              ),
            ],
        ),
      ),
    );
  }
}