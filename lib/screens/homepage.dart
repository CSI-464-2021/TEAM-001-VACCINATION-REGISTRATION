import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaccination_registration_app/main.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget{


  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<Home>{


  TextEditingController emailController = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String banner = "";
  String url;
  RegExp emailValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isEmail=true;


  Future<List> _login() async{

    url = "http://10.0.2.2/contact_tracing/getDriverData.php";
    //url = "http://10.220.3.74/contact_tracing/getDriverData.php";
    final response = await http.post(url, body: {
      "ID": emailController.text,
      "password": password.text,
    });

    print("object");
    print(response.body);

    var Details = json.decode(response.body);




    if((response.body).length==2){

      setState(() {

        banner = "Invalid username of password";
        emailController.clear();
        password.clear();
        bool isID=false;

      });
    }else{

      String ID = Details[0]['ContactID'];
      String name = Details[0]['Name'];


      print (ID);
      print (name);

      emailController.clear();
      password.clear();


      setState(() {

        email = ID;
        username=name;

        bool isID=false;


      });
      Navigator.of(context).pushNamed('/driverHomepage');
    }


  }

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
