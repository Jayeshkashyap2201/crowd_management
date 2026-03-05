import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WaterEnglish extends StatefulWidget {
  const WaterEnglish({super.key});

  @override
  State<WaterEnglish> createState() => _WaterEnglishState();
}

class _WaterEnglishState extends State<WaterEnglish> {
  bool show = false;
  @override
  final List<Map<String, dynamic>> marks = const[
    {'x': 0.13 , 'y': 1.50, 'title': ' Water Cooler 1', 'color': Colors.red},
    {'x': 0.13 , 'y': 1.34, 'title': ' Water Cooler 2', 'color': Colors.blue},
    {'x': 0.13 , 'y': 1.19, 'title': ' Water Cooler 3', 'color': Colors.yellow},
    {'x': 0.13 , 'y': 1.01, 'title': ' Water Cooler 4', 'color': Colors.orange},
    {'x': 1.00 , 'y': 1.45, 'title': ' Water Cooler 5', 'color': Colors.purple},
    {'x': 1.05 , 'y': 0.38, 'title': ' Water Cooler 6', 'color': Colors.amberAccent},
    {'x': 0.09 , 'y': 0.75, 'title': ' Water Cooler 7', 'color': Colors.red},
    {'x': 0.09 , 'y': 0.35, 'title': ' Water Cooler 8', 'color': Colors.orange},
    {'x': 1.00 , 'y': 1.10, 'title': ' Water Cooler 9', 'color': Colors.white70},
  ];

  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 1),(){
      setState(() {
        show = true;
      });
    });
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Searching for Water Cooler?",style: TextStyle(fontSize: size.width*0.04,color: Colors.white),),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Hero(
        tag: "moved_from_homepage2",
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 10,
          child: Center(
            child: SizedBox(
              height: size.height * 1,
              width: size.width * 1,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height*0.03,
                    left: size.width*0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(show)
                          Icon(Icons.location_on,color: Colors.white,),
                        if(show)
                          Text(" Indicates the Water Coolers in the Map",style: TextStyle(color: Colors.white,fontSize: size.width*0.03,),),
                      ],
                    ),
                  ),
                  Image(
                    image: AssetImage("assets/MapMinor.jpg"),
                    height: size.height *0.9,
                    width: size.width * 1,
                  ),
                  ...marks.map((marker) {
                    return Positioned(
                      left: marker['x'] * MediaQuery.of(context).size.width * 0.8,
                      top: marker['y'] * MediaQuery.of(context).size.width * 0.8,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (index) => AlertDialog(
                              title: Text(marker['title']),
                              content: const Text("you tapped this mark"),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("close"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.location_on,color: marker['color'],size: 32,),
                      ),
                    );
                  }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}