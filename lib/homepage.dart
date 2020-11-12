import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COVID-TRACKER'),
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.orange[100],
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(DataSource.quote,style: TextStyle(color: Colors.orange[800] , fontWeight: FontWeight.bold ,fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('WORLDWIDE',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
          ),
          WorldWidePanel()
        ],
      )),
    );
  }
}
