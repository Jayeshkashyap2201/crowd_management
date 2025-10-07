import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  String currentUser;
  CheckUser({super.key, required this.currentUser});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("data")
    );
  }
}
