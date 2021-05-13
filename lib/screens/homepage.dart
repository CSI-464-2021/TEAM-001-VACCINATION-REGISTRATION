import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaccination_registration_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vaccination_registration_app/screens/wrapper.dart';
import 'package:vaccination_registration_app/services/authentication.dart';

class HomePage extends StatefulWidget {

  HomePage({ Key key, this.user, this.auth, this.onSignOut}) :super(key: key);
  final user;
  final BaseAuth auth;
  final VoidCallback onSignOut;

  @override
  HomePageState createState() => new HomePageState();

}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Home"),

      ),
      body: Container(
        color: Color(0xFFF7E1E1),
        child: Center(

          child: Column(


            children: <Widget>[


              Text("",style: TextStyle(fontSize: 18.0),),
              Text("Welcome to the vaccine registration"
                  " mobile application",style: TextStyle(fontSize: 18.0,color: Color(0xFF9F3D40), fontWeight: FontWeight.bold,),),
              Text("",style: TextStyle(fontSize: 18.0),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF9F3D40),
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [

          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.white),
            title: new Text('Home', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.bar_chart, color: Colors.white),
            title: new Text('Report', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.article, color: Colors.white),
            title: new Text('Feedback', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.white),
              title: Text('Booking', style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white))
          )

        ],
      ),
    );
  }
}
