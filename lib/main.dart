import 'package:crowd_management/Authentications/AuthPage.dart';
import 'package:crowd_management/Cubit/StateData.dart';
import 'package:crowd_management/Cubit/detail.dart';
import 'package:crowd_management/User/Screens/Suggestion.dart';
import 'package:crowd_management/User/Screens/UserDetails.dart';
import 'package:crowd_management/User/Screens/home_english.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding().ensureSemantics();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://hwdlhrcnevcyeposwtid.supabase.co',
    anonKey: 'sb_publishable_Rfzs7BEK-RwXK3BgRW8N7A_XFEJqzW6',
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StateData>(
          create: (BuildContext context) =>StateData()
        ),
        BlocProvider<Detail>(
          create: (BuildContext cintext)=> Detail()
        ),
      ],
      child:
      MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor:  const Color(0xFF121826),
          textTheme: TextTheme()
        ),
        home: Userdetails(),
      debugShowCheckedModeBanner: false,
        ),
    ),
  );
}