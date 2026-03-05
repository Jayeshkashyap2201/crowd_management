import 'package:flutter/material.dart';

class InfoEnglish extends StatefulWidget {
  const InfoEnglish({super.key});

  @override
  State<InfoEnglish> createState() => _InfoEnglishState();
}

class _InfoEnglishState extends State<InfoEnglish> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("About this Application",style: TextStyle(fontSize: size.width * 0.06,color: Colors.white)),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.03,),
          SizedBox(height: size.height * 0.03),
          Flexible(child: Text("India’s rich spiritual heritage draws millions of devotees and tourists to temples, festivals, and pilgrimage sites every year. While these sacred places symbolize faith and unity, they also face challenges like overcrowding, long queues, health risks, and mismanagement during peak times.\nThe Crowd Management System is a smart, technology-driven solution designed to enhance safety, convenience, and the overall experience of devotees. Through real-time monitoring, intelligent crowd control, and digital communication tools, the system ensures smooth movement, reduces waiting times, and provides emergency support when needed.\nOur goal is to create a safer, more organized, and spiritually fulfilling environment for every pilgrim — blending traditional devotion with modern innovation.",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: size.width*0.04),)),
          SizedBox(height: size.height * 0.03),

        ],
      ),
    );
  }
}
