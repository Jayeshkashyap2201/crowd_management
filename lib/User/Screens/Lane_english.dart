import 'package:barcode_widget/barcode_widget.dart';
import 'package:crowd_management/StaticVariables.dart';
import 'package:flutter/material.dart';

class LaneEnglish extends StatefulWidget {
  const LaneEnglish({super.key});

  @override
  State<LaneEnglish> createState() => _LaneEnglishState();
}

class _LaneEnglishState extends State<LaneEnglish> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lane",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 100,
      ),
      body: Center(
        child: Hero(
          tag: "moved_from_homepage0",
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: SingleChildScrollView(
                  // height: size.height * 0.6,
                  // width: size.width * 0.8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.02,),
                          BarcodeWidget(data: StaticVariable.qrData, barcode: Barcode.qrCode(), height: size.width * 0.5, width: size.width * 0.5,),
                          SizedBox(height: size.height * 0.01,),
                          Text(StaticVariable.loggedUserName,style: TextStyle(fontSize: size.width * 0.02),),
                          SizedBox(height: size.height * 0.03,),
                          Text("Scan this QR to register for Darshan",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.04),),
                          SizedBox(height: size.height * 0.03,),
                          Row(
                            children: [
                              Text("Note :- ",style: TextStyle(color: Colors.red,fontSize: size.width * 0.05),),
                              Expanded(child: Text("Make sure you are in the right line so that you do not face any problem.",style: TextStyle(fontSize: size.width * 0.03),))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
