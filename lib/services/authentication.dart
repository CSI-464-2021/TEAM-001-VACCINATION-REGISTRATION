import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{

  Future<User> getCurrentUser();
}

class Auth implements BaseAuth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async{
    User userCredential = _firebaseAuth.currentUser;
    return userCredential;
  }


}