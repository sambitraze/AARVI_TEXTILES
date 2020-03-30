import 'package:flutter/material.dart';

class SewingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sewing-production management"),
      ),
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
                      'Daily\nProduction\nReport',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/DailyProductionReport');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text(
                      'Hourly\nProduction\nReport',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/SewingHourlyProduction');
                },
              ),
              GestureDetector(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text(
                      'IE\nManagement',
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/ieManage');
                },
              ),
            ],
        ),
      ),
    );
  }
}