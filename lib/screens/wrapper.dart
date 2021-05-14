import 'package:flutter/material.dart';
import 'package:vaccination_registration_app/services/authentication.dart';
import 'package:vaccination_registration_app/screens/login.dart';
import "package:vaccination_registration_app/screens/homepage.dart";
class Wrapper extends StatefulWidget {

  Wrapper({this.auth});
  final BaseAuth auth;
  @override
  _WrapperState createState() => _WrapperState();
}

enum AuthStatus{

  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN
}

class _WrapperState extends State<Wrapper> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _UserID="";

  @override
  void initState(){

    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user!=null){
          _UserID = user?.uid;
        }
        authStatus = user?.uid == null? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn(){
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user!=null){
          _UserID = user?.uid.toString();
        }

      });
    });
    setState(() {
      setState(){
        authStatus = AuthStatus.LOGGED_IN;

      }
    });
  }
  void _onSignedOut(){

    setState(() {
      setState(){
        authStatus = AuthStatus.NOT_LOGGED_IN;

      }
    });
  }

  Widget _buildWaitScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child:CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    switch (authStatus){

      case AuthStatus.NOT_DETERMINED:
        return _buildWaitScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return Login(
          auth: widget.auth,
          onLoggedIn: _onLoggedIn,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_UserID.length>0 && _UserID !=null){
          return HomePage(
            user: _UserID,
            auth: widget.auth,
            onSignOut: _onSignedOut,
          );
        }else
          return _buildWaitScreen();
          break;

      default:
        return _buildWaitScreen();


    }
  }
}
