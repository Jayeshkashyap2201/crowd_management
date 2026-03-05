import 'package:crowd_management/StaticVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'Lane_english.dart';
import 'Suggestion.dart';
import 'Washrooms_english.dart';
import 'Water_english.dart';
import 'home_english.dart';
import 'info_english.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  final List<Widget> pages =[
    Home_english(),
    LaneEnglish(),
    WashroomsEnglish(),
    WaterEnglish(),
    Suggestion(),
    InfoEnglish(),
  ];
  @override
  void initState (){
    super.initState();
    timeDilation = 2.0;
  }
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              StaticVariable.page = index;
            });
          },
          iconSize: 30,
          showSelectedLabels: false,
          selectedItemColor: Colors.blue,
          selectedFontSize: 20,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          currentIndex: StaticVariable.page,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Lane"),
            BottomNavigationBarItem(icon: Icon(Icons.wc), label: "Washrooms"),
            BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: "Water"),
            BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: "Restrooms"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
          ]
        ),
        body: pages[StaticVariable.page],
        // body: pages[2],
      ),
    );
  }
}
