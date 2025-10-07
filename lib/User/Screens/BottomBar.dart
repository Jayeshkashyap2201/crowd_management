import 'package:flutter/material.dart';
import 'Lane_english.dart';
import 'RestRooms_english.dart';
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
  late TabController _tabController;
  int _currentIndex = 0; // bottom nav index
  final List<Widget> pages =[
    Home_english(),
    LaneEnglish(),
    WashroomsEnglish(),
    WaterEnglish(),
    RestroomsEnglish(),
    InfoEnglish(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        selectedFontSize: 20,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
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
      body: pages[_currentIndex],
    );
  }
}
