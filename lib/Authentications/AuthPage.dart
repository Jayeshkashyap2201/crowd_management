import 'package:crowd_management/Cubit/StateData.dart';
import 'package:crowd_management/Cubit/States.dart';
import 'package:crowd_management/StaticVariables.dart';
import 'package:crowd_management/User/Screens/BottomBar.dart';
import 'package:crowd_management/User/Screens/UserDetails.dart';
import 'package:crowd_management/User/Screens/home_english.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> with SingleTickerProviderStateMixin{
  static var email_pilgrim = TextEditingController();
  static var pass_pilgrim = TextEditingController();
  static var email_manager = TextEditingController();
  static var pass_manager = TextEditingController();
  static var managerID = TextEditingController();
  bool secureText = true;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void seeText(){
    setState(() {
      secureText = false;
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        animateColor: true,
        title: Text("Login Yourself"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person), text: "Pilgrim",),
            Tab(icon: Icon(Icons.manage_history_rounded), text: "Manager"),
          ],
        ),
      ),
      body: BlocConsumer<StateData,AllStates>(
        listener:(context ,state){
          if(state is ErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.e)),
            );
          }
          if (state is Loaded) {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Userdetails()));
          }
        },
        builder : (context , state) {
          if (state is Loading) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Stack(
            children: [
              SizedBox(
                height: size.height * 1,
                width: size.width * 1,
                child: Image(image: AssetImage("assets/background_auth.jpg"),
                  fit: BoxFit.cover,),
              ),
              Positioned(
                left: size.width * 0.1,
                right: size.width * 0.1,
                top: size.height * 0.13,
                bottom: size.height * 0.1,
                child: SizedBox(
                  height: size.height * 0.5,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          width: size.width * 0.1,
                          height: size.height * 0.5,
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(height: size.height * 0.07,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: email_pilgrim,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "email",
                                    hintText: "abc@gmail.com",
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                                SizedBox(height: 50,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: pass_pilgrim,
                                  obscureText: secureText,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    labelText: "ex - password",
                                    hintText: "ex - 123abs@&",
                                    prefixIcon: Icon(Icons.email),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        seeText();
                                      },
                                      icon: Icon(
                                          Icons.remove_red_eye_outlined),
                                    )
                                  ),
                                ),
                                SizedBox(height: 50,),
                                Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: ()async{
                                         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email_pilgrim.text, password: pass_pilgrim.text);
                                         User? user = userCredential.user;

                                         if(user != null){
                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The verification email has been sent please verify firstly")));
                                          return;
                                         }
                                         if (user != null && user.emailVerified == true) {
                                           Navigator.pushReplacement(
                                             context,
                                             MaterialPageRoute(builder: (context) => Userdetails()),
                                           );
                                           ScaffoldMessenger.of(context).showSnackBar(
                                             SnackBar(content: Text("Your account has been created successfully!")),
                                           );
                                         }
                                         else {
                                           await user?.sendEmailVerification();
                                           ScaffoldMessenger.of(context).showSnackBar(
                                             SnackBar(content: Text("Please verify your email before logging in.")),
                                           );
                                         }
                                      },
                                      child:Card(
                                        color: Colors.blue,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text("Signup"),
                                        ),
                                      ) ,
                                    ),
                                    Expanded(child: Container()),
                                    MaterialButton(
                                      onPressed: () async {
                                        await context.read<StateData>().fetching(email_pilgrim.text, pass_pilgrim.text);
                                      },
                                      child: Card(
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Verify",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.04),),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: size.width * 0.1,
                          height: size.height * 0.5,
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(height: size.height * 0.05,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: email_manager,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "email",
                                    hintText: "abc@gmail.com",
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: pass_manager,
                                  obscureText: secureText,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    labelText: "ex - password",
                                    hintText: "ex - 123abs@&",
                                    prefixIcon: Icon(Icons.email),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        seeText();
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined),
                                    )
                                  ),
                                ),
                                SizedBox(height: 25,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: managerID,
                                  obscureText: secureText,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    labelText: "Manager ID",
                                    hintText: "ex - 123abs@&",
                                    prefixIcon: Icon(Icons.email),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        seeText();
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined),
                                    )
                                  ),
                                ),
                                SizedBox(height: 30,),
                                MaterialButton(
                                  onPressed: () async {
                                    try{
                                      User? manager = FirebaseAuth.instance
                                          .currentUser;
                                      UserCredential managercredential = await FirebaseAuth
                                          .instance.signInWithEmailAndPassword(
                                          email: email_manager.text,
                                          password: pass_manager.text
                                      );
                                      if (manager != null &&
                                          !manager.emailVerified) {
                                        await manager.sendEmailVerification();
                                        ScaffoldMessenger
                                            .of(context)
                                            .showSnackBar(
                                          SnackBar(content: Text(
                                              "Verification email sent! Check your inbox.")),
                                        );
                                        return;
                                      }
                                      if (managercredential.user!
                                          .emailVerified) {
                                        // Navigator.push(
                                        //     context, MaterialPageRoute(
                                        //     builder: (context) => Bottombar()));
                                      }
                                      final snapshot = await FirebaseFirestore.instance.collection("users").where("email", isEqualTo: email_manager.text).get();
                                      if (snapshot.docs.isNotEmpty) {
                                        final userData = snapshot.docs.first.data();
                                        if (userData["managerKey"] == managerID.text) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => Bottombar()),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Invalid Manager ID")),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Manager not found")),
                                        );
                                      }
                                    }
                                    catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Login faild : ${e.toString()}"))
                                      );
                                    }
                                  },
                                  child: Card(
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Verify",
                                        style: TextStyle(fontSize: size.width * 0.04),),
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ),
                    ]
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
