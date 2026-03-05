import 'package:crowd_management/StaticVariables.dart';
import 'package:flutter/material.dart';
class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  TextEditingController suggestionController = TextEditingController();
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
        backgroundColor: Colors.purpleAccent.shade100,
      ),
      backgroundColor: Colors.orange.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
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

                    ),
                  ]
                ),
                SizedBox(height: size.height * 0.05,),
                SizedBox(
                  height: size.height * 0.3,
                  width: size.width * 0.8,
                  child: Center(
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: suggestionController,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Write here",
                        labelText: "show your thoughts",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

