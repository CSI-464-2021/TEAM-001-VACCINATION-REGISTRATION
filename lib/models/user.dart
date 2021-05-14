import 'package:flutter/material.dart';
class User{
  String id;
  String name;
  String email;
  String contacts;

  User({this.id, this.name, this.email, this.contacts});

  User.fromData(Map<String, dynamic> data)
  :id = data['id'],
        name = data['name'],
        email = data['email'],
        contacts=data['email'];

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'email':email,
      'contacts':contacts,
    };
  }



}