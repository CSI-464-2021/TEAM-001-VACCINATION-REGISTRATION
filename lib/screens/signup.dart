import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaccination_registration_app/main.dart';

class SignUp extends StatefulWidget{


  @override
  SignUpPageState createState() => new SignUpPageState();

}

class SignUpPageState extends State<SignUp>{

  TextEditingController emailController = new TextEditingController();
  TextEditingController password = new TextEditingController();

  TextEditingController comfirmPassword = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController contact = new TextEditingController();

  String banner = "";
  String url;
  RegExp emailValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isEmail=true;
  RegExp nameValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isName=true;
  RegExp contactValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isContact=true;


  Future<List> _login() async{

    url = "http://10.0.2.2/contact_tracing/getDriverData.php";
    //url = "http://10.220.3.74/contact_tracing/getDriverData.php";
    final response = await http.post(url, body: {
      "username": userName.text,
      "email": emailController.text,
      "contact": contact.text,
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

      appBar: AppBar(title: Text("SIGNUP"),),
      body: Container(
        color: Color(0xFFF7E1E1),
        child: Center(

          child: Column(


            children: <Widget>[


              Text("",style: TextStyle(fontSize: 18.0),),
              Text("SIGNUP",style: TextStyle(fontSize: 18.0,color: Color(0xFF9F3D40), fontWeight: FontWeight.bold,),),
              Text("",style: TextStyle(fontSize: 18.0),),

              Container(
                width: 300,
                color: Color(0xFFFCF2F5),
                child: TextField(

                  controller: userName,
                  onChanged: (inputValue){
                    if(nameValidator.hasMatch(inputValue)){
                      setState(() {
                        isName = true;
                      });
                    } else{
                      setState(() {
                        isName = false;
                      });

                    }
                  },
                  decoration: InputDecoration(
                      hintText: "USERNAME",
                      errorText: isName ? null : "Please enter proper format of ID"
                  ),
                ),
              ),
              Text("",style: TextStyle(fontSize: 18.0),),

              Container(
                width: 300,
                color: Color(0xFFFCF2F5),
                child: TextField(

                  controller: emailController,
                  onChanged: (inputValue){
                    if(inputValue.isEmpty || emailValidator.hasMatch(inputValue)){
                      setState(() {
                        isEmail = true;
                      });
                    } else{
                      setState(() {
                        isEmail = false;
                      });

                    }
                  },
                  decoration: InputDecoration(
                      hintText: "EMAIL",
                      errorText: isEmail ? null : "Please enter proper format of ID"
                  ),
                ),
              ),
              Text("",style: TextStyle(fontSize: 18.0),),

              Container(
                width: 300,
                color: Color(0xFFFCF2F5),
                child: TextField(

                  controller: contact,
                  onChanged: (inputValue){
                    if(contactValidator.hasMatch(inputValue)){
                      setState(() {
                        isContact = true;
                      });
                    } else{
                      setState(() {
                        isContact = false;
                      });

                    }
                  },
                  decoration: InputDecoration(
                      hintText: "CELLNUMBER",
                      errorText: isEmail ? null : "Please enter proper format of ID"
                  ),
                ),
              ),

              Text("",style: TextStyle(fontSize: 18.0),),
              Container(
                color: Color(0xFFFCF2F5),
                width: 300,
                child: TextField(
                  controller: password,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Enter PASSWORD"
                  ),
                ),
              ),

              Text(banner,style: TextStyle(fontSize: 18.0),),

              Container(
                color: Color(0xFFFCF2F5),
                width: 300,
                child: TextField(
                  controller: comfirmPassword,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Enter PASSWORD"
                  ),
                ),
              ),

              Text(banner,style: TextStyle(fontSize: 18.0),),

              RaisedButton(
                child: Text("Submit",style: TextStyle(color: Colors.white)),
                color: Color(0xFF9F3D40),
                onPressed: (){
                  if(!isEmail){

                  }else {
                    _login();
                  }
                },
              ),

              RaisedButton(
                child: Text("Back",style: TextStyle(color: Colors.white)),
                color: Color(0xFF9F3D40),

              ),
            ],
          ),
        ),
      ),

    );
  }
}