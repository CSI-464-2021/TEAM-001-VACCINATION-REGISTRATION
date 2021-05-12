import 'package:flutter/material.dart';
import 'package:vaccination_registration_app/screens/bookappointment.dart';
import 'package:vaccination_registration_app/screens/login.dart';
import 'package:vaccination_registration_app/screens/signup.dart';
import 'package:vaccination_registration_app/screens/homepage.dart';
import 'package:vaccination_registration_app/screens/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


String email = '';
String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Map<int, Color> color2 =
  {
    50:Color.fromRGBO(159,61,64, .1),
    100:Color.fromRGBO(159,61,64, .2),
    200:Color.fromRGBO(159,61,64, .3),
    300:Color.fromRGBO(159,61,64, .4),
    400:Color.fromRGBO(159,61,64, .5),
    500:Color.fromRGBO(159,61,64, .6),
    600:Color.fromRGBO(159,61,64, .7),
    700:Color.fromRGBO(159,61,64, .8),
    800:Color.fromRGBO(159,61,64, .9),
    900:Color.fromRGBO(159,61,64, 1),
  };


  MaterialColor colorCustom = MaterialColor(0xFF9F3D40, {
    50:Color.fromRGBO(159,61,64, .1),
    100:Color.fromRGBO(159,61,64, .2),
    200:Color.fromRGBO(159,61,64, .3),
    300:Color.fromRGBO(159,61,64, .4),
    400:Color.fromRGBO(159,61,64, .5),
    500:Color.fromRGBO(159,61,64, .6),
    600:Color.fromRGBO(159,61,64, .7),
    700:Color.fromRGBO(159,61,64, .8),
    800:Color.fromRGBO(159,61,64, .9),
    900:Color.fromRGBO(159,61,64, 1.0),
  },);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccination registration',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
      ),



    routes: <String, WidgetBuilder> {




    },
      home: new Login(),
    );
  }
}



