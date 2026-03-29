import 'package:crowd_management/StaticVariables.dart';
import 'package:crowd_management/supabaseServices/supabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  List alerts = [];
  TextEditingController suggestionController = TextEditingController();
  @override
  void initState(){
    super.initState();
    fetchAlerts();
  }
  @override
  void dispose(){
    suggestionController.dispose();
    super.dispose();
  }
  Future submitFeedback(String message) async {
    final supabase = Supabase.instance.client;
    final user = FirebaseAuth.instance.currentUser;

    await supabase.from('feedback').insert({
      "user_id": user!.uid,
      "name": StaticVariable.loggedUserName,
      "feedback": message,
      "rating": 5
    });
  }
  Future<void> fetchAlerts() async {
    final data = await SupabaseService.client2
        .from('alerts')
        .select()
        .order('created_at', ascending: false);
    setState(() {
      alerts = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Give feedback",style: TextStyle(fontSize: size.width * 0.06,color: Colors.white),),
        centerTitle: true,
        surfaceTintColor: Colors.red,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1D2671),
                Color(0xffC33764),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff134e5e),
              Color(0xff1f3c88),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 20 , left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "moved_from_homepage3",
                      child: SizedBox(
                        height: size.height* 0.3,
                        width: size.width*0.43,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: size.height*0.03,),
                                Text("Here you can give feedback by which we can improve our facilities",style: TextStyle(fontSize: size.width*0.05,),textAlign: TextAlign.center,),
                                SizedBox(height: size.height*0.02,),
                                Text(StaticVariable.loggedUserName,style: TextStyle(fontSize: size.width*0.02),),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: size.height * 0.3,
                        child: ListView.builder(
                          itemCount: alerts.length,
                          itemBuilder: (context, index) {
                            final alert = alerts[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF1A1A2E),
                                      Color(0xFF16213E),
                                      Color(0xFF0F3460),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  title: Text(alert['title'],style: TextStyle(color: Colors.grey),),
                                  subtitle: Text(alert['message'],style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ]
                ),
                SizedBox(height: size.height * 0.05,),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.white,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Please enter your thoughts",style: TextStyle(fontSize: size.width*0.05,color: Colors.white),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  child: Center(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      expands: true,
                      maxLines: null,
                      controller: suggestionController,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "Write here",
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
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
                SizedBox(height: size.height * 0.02,),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(suggestionController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please write feedback"))
                        );
                        return;
                      }
                      await submitFeedback(suggestionController.text);
                      suggestionController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Feedback Submitted"))
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text("Submit",style: TextStyle(fontSize: size.width * 0.03),),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}

