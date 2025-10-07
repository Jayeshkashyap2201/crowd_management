import 'package:crowd_management/Cubit/StateData.dart';
import 'package:crowd_management/Authentications/AuthPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Authentications/checkUser.dart';

void main() async{
  WidgetsFlutterBinding().ensureSemantics();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StateData>(
          create: (BuildContext context) =>StateData()
        )
      ],
      child:
      MaterialApp(
        home: Authpage(),
      debugShowCheckedModeBanner: false,
        ),
    ),
  );
}