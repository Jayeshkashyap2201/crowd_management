import 'package:crowd_management/StaticVariables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  O3DController o3dController = O3DController();
  @override
  void initState(){
    super.initState();
    //o3dController.initialize();
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Give feedback"),
        centerTitle: true,
        surfaceTintColor: Colors.red,
        backgroundColor: Colors.purple.shade300,
      ),
      backgroundColor: Colors.orange.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(
              tag: "moved_from_homepage3",
              child: SizedBox(
                height: size.height* 0.3,
                width: size.width*0.5,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.03,),
                        Text("Here you can give feedback by which we can improve our facilities",style: TextStyle(fontSize: size.width*0.05,),textAlign: TextAlign.center,),
                        Text(StaticVariable.loggedUserName,style: TextStyle(fontSize: size.width*0.02),),
                      ]
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height *0.3,
              width: size.width*0.45,
              // child: O3D(
              //   src: 'assets/3D_Models/women_model.glb',
              //   controller: o3dController,
              //   ar: false,
              //   autoPlay: false,
              //   autoRotate: false,
              // ),
            ),
          ]
        ),
      ),
    );
  }
}

