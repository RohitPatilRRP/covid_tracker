import 'dart:convert';

import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldWideData;
  fetchWorldWideData()async{
    http.Response response  = await http.get(DataSource.apiUrlWorldWide);
    setState(() {
      worldWideData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }



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
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Text('WORLDWIDE',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.center,
            child: worldWideData==null?CircularProgressIndicator(
            ):WorldWidePanel(worldWideData:worldWideData),
          )
        ],
      )),
    );
  }
}
