import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaccination_registration_app/models/user.dart';


class FirestoreService{


  final CollectionReference _userCollectionReference = FirebaseFirestore.instance.collection('users');

  Future createUser(User user) async{
    try{
      await _userCollectionReference.doc(user.id).set(user.toJson());
    }catch(e){

    }


  }
}