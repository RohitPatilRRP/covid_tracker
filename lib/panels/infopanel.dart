import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQsPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("FAQs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                  Icon(Icons.arrow_forward,color: Colors.white)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch(DataSource.urlMythBusters);
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("MYTH BUSTERS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                  Icon(Icons.arrow_forward,color: Colors.white)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap:(){
              launch(DataSource.urlAboutUs);
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("ABOUT US",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                  Icon(Icons.arrow_forward,color: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
