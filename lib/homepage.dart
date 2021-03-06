import 'dart:convert';

import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/pages/countrypage.dart';
import 'package:covid_tracker/panels/infopanel.dart';
import 'package:covid_tracker/panels/mostaffected.dart';
import 'package:covid_tracker/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
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

  List countryData;
  fetchCountryWideData()async{
    http.Response response  = await http.get(DataSource.apiUrlMostAffected);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('WORLDWIDE',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CountryPage()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('Regional',style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
          worldWideData==null?
          Container(alignment: Alignment.center, child: CircularProgressIndicator()):WorldWidePanel(worldWideData:worldWideData),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text('MOST AFFECTED COUNTRIES',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          countryData==null?Container(alignment: Alignment.center, child: CircularProgressIndicator()):MostAffectedPanel(countryData:countryData),
          InfoPanel(),
          SizedBox(height: 50)
        ],
      )),
    );
  }
}
