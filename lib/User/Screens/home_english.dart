import 'package:crowd_management/StaticVariables.dart';
import 'package:crowd_management/User/Screens/Lane_english.dart';
import 'package:crowd_management/User/Screens/Suggestion.dart';
import 'package:crowd_management/User/Screens/Washrooms_english.dart';
import 'package:crowd_management/User/Screens/Water_english.dart';
import 'package:flutter/material.dart';

import 'BottomBar.dart';

class Home_english extends StatefulWidget {
  const Home_english({super.key});

  @override
  State<Home_english> createState() => _Home_englishState();
}

class _Home_englishState extends State<Home_english> with TickerProviderStateMixin{
  List<Widget>pages =[
    LaneEnglish(),
    WashroomsEnglish(),
    WaterEnglish(),
    Suggestion(),
  ];
  List<Widget> Items =[
    Icon(Icons.qr_code,color: Colors.grey),
    Icon(Icons.wash_rounded,color: Colors.orange.shade200,),
    Icon(Icons.water_drop,color: Colors.blue,),
    Icon(Icons.feedback_rounded,color: Colors.yellow.shade700,)
  ];
  List<Widget>Name =[
    Text("QR for entry"),
    Text("Washroom"),
    Text("Drinking Water"),
    Text("Feedback"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2,
                centerTitle: true,
                background: Image(
                  image: AssetImage("assets/temple minor.jpg"),
                  fit: BoxFit.cover,),
                title: Text("Crowd Management System", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: size.width * 0.045),),
              ),
              expandedHeight: size.height * 0.319,
              surfaceTintColor: Colors.black87,
              backgroundColor: Colors.purple,
              elevation: 100,
              shadowColor: Colors.white,
              leading: Icon(
                Icons.temple_hindu, color: Colors.white, size: size.height*0.05,),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: size.height*0.02,right: size.width*0.015,left: size.width*0.015,bottom: size.height*0.01),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        StaticVariable.page = index+1;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottombar()));
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[index]));
                    },
                    child: Hero(
                      tag: "moved_from_homepage$index",
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height *0.05,
                                width: size.width * 0.05,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Items[index]
                                ),
                              ),
                              SizedBox(height: size.height * 0.01,),
                              Name[index],
                            ],
                          )
                        ),
                      ),
                    ),
                  );
                },
                childCount: 4,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03,),
                  Text("About this Application",textAlign: TextAlign.start,style: TextStyle(fontSize: size.width * 0.06,color: Colors.white),),
                  SizedBox(height: size.height * 0.03),
                  Text("India’s rich spiritual heritage draws millions of devotees and tourists to temples, festivals, and pilgrimage sites every year. While these sacred places symbolize faith and unity, they also face challenges like overcrowding, long queues, health risks, and mismanagement during peak times.\nThe Crowd Management System is a smart, technology-driven solution designed to enhance safety, convenience, and the overall experience of devotees. Through real-time monitoring, intelligent crowd control, and digital communication tools, the system ensures smooth movement, reduces waiting times, and provides emergency support when needed.\nOur goal is to create a safer, more organized, and spiritually fulfilling environment for every pilgrim — blending traditional devotion with modern innovation.",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: size.width*0.04),),
                  SizedBox(height: size.height * 0.03),

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
