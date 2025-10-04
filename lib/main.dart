import 'package:crowd_management/Screens/AuthPage.dart';
import 'package:crowd_management/Screens/BottomBar.dart';
import 'package:crowd_management/Screens/home_english.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding().ensureSemantics();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.signOut();
  runApp(
    MaterialApp(
    home: Authpage(),
    debugShowCheckedModeBanner: false,
  ));
}