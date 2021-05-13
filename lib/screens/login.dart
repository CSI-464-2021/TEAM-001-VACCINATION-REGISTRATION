//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaccination_registration_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:vaccination_registration_app/screens/wrapper.dart';
import 'package:vaccination_registration_app/services/authentication.dart';

class Login extends StatefulWidget{

  Login({this.auth, this.onLoggedIn});
  final BaseAuth auth;
  final VoidCallback onLoggedIn;

  @override
  LoginPageState createState() => new LoginPageState();

}

class LoginPageState extends State<Login>{

  String email = '';
  TextEditingController emailController = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String banner = "";
  String url;
  RegExp emailValidator = RegExp("");
  bool isEmail=true;
  final _formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //void validateAndSave() {
  //  final form = _formKey.currentState;
  //  if (form.validate()) {
  //    print('Form is valid');
  //  } else {
  //    print('Form is invalid');
  //  }
  //}


  void _login() async{

    //await Firebase.initializeApp();
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: password.text);
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: password.text);
    }
    catch(e){
      print('Error $e');
    }


  }

  void moveToSignUp(){

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("LOGIN"),),
      body: Container(
        color: Color(0xFFF7E1E1),
        child: Center(

          child: Form(
            key: _formKey,

            child: Column(


              children: <Widget>[


              Text("",style: TextStyle(fontSize: 18.0),),
              Text("LOGIN",style: TextStyle(fontSize: 18.0,color: Color(0xFF9F3D40), fontWeight: FontWeight.bold,),),
              Text("",style: TextStyle(fontSize: 18.0),),

              Container(width: 300,
              color: Color(0xFFFCF2F5),
              child: TextFormField(

                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "EMAIL",

                  ),
                  autofillHints: [AutofillHints.email],
                  validator : (value) => !EmailValidator.validate(value) && value!=null
                      ? 'Enter a valid Email '
                      : null,
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

              RaisedButton(
                child: Text("Submit",style: TextStyle(color: Colors.white)),
                color: Color(0xFF9F3D40),
                onPressed: (){
                  final form = _formKey.currentState;
                if(form.validate()){

                  _login();
                }else {

                  }
                },
              ),

              Text(" ",style: TextStyle(fontSize: 18.0),),



              Container(
                child: RaisedButton(

                  child: Text("create a new account",style: TextStyle(color: Colors.white)),
                  color: Color(0xFF9F3D40),
                  onPressed: (){

                  },
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
