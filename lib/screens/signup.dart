import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaccination_registration_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:vaccination_registration_app/screens/wrapper.dart';
import 'package:vaccination_registration_app/services/authentication.dart';
import 'package:vaccination_registration_app/models/user.dart';
import 'package:vaccination_registration_app/services/firestore_service.dart';

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
  final _formKey = GlobalKey<FormState>();

  String banner = "";
  String url;
  RegExp emailValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isEmail=true;
  RegExp nameValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isName=true;
  RegExp contactValidator = RegExp("^[0-9][0-9][0-9][0-9][1|2][0-9][0-9][0-9][0-9]");
  bool isContact=true;

  String email;
  String pass;
  //Formtype

  void _Signup() async{

    //await Firebase.initializeApp();
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: password.text);
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: password.text);
      //await createUser()


    }
    catch(e){
      print('Error $e');
    }


  }





  @override
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

                Container(
                  width: 300,
                  color: Color(0xFFFCF2F5),
                  child: TextFormField(

                    controller: userName,
                    validator : (value) => nameValidator.hasMatch(value) && value!=null
                        ? 'Enter a valid name '
                        : null,

                    decoration: InputDecoration(
                        hintText: "USERNAME",
                        errorText: isName ? null : "Please enter proper format of ID"
                    ),
                  ),
                ),

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
                  width: 300,
                  color: Color(0xFFFCF2F5),
                  child: TextFormField(

                    controller: contact,
                    validator : (value) => contactValidator.hasMatch(value) && value!=null
                        ? 'Enter a valid contact '
                        : null,
                    decoration: InputDecoration(
                        hintText: "CELLNUMBER",
                    ),
                  ),
                ),


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

                      _Signup();
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



