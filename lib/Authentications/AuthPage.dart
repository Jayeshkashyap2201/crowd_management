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
import 'package:lottie/lottie.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> with SingleTickerProviderStateMixin{
  static var email_pilgrim = TextEditingController();
  static var pass_pilgrim = TextEditingController();
  bool secureText = true;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }
  @override
  void seeText(){
    setState(() {
      secureText =! secureText;
    });
  }
  @override
  void dispose() {
    email_pilgrim.dispose();
    pass_pilgrim.dispose();
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Login Yourself",style: TextStyle(color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0F2027),
                Color(0xFF203A43),
                Color(0xFF2C5364)
              ],
            ),
          ),
        ),
        animateColor: true,
        bottom: TabBar(
          indicatorColor: Colors.green,
          labelColor: Colors.blue,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person,color: Colors.white,), text: "Pilgrim",),
            //Tab(icon: Icon(Icons.manage_history_rounded), text: "Manager"),
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
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Lottie.network("https://lottiefiles.com/free-animation/faceid-green-M1tKk6bIaB",height: 300,reverse: true,repeat: true),
                ),
              );
            }
            return Stack(
              children: [
                SizedBox(
                  height: size.height * 1,
                  width: size.width * 1,
                  child: Container(
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
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.13,
                  bottom: size.height * 0.1,
                  child: SizedBox(
                    height: size.height * 0.5,
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              width: double.maxFinite,
                              height: size.height * 0.45,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF0F2027),
                                      Color(0xFF203A43),
                                      Color(0xFF2C5364)
                                    ]
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: size.height * 0.07,),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.emailAddress,
                                        enabled: true,
                                        controller: email_pilgrim,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: "email",
                                          hintText: "abc@gmail.com",
                                          labelStyle: TextStyle(color: Colors.white),
                                          hintStyle: TextStyle(color: Colors.white),
                                          prefixIcon: Icon(Icons.email,color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 50,),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.emailAddress,
                                        enabled: true,
                                        controller: pass_pilgrim,
                                        obscureText: secureText,
                                        obscuringCharacter: "*",
                                        decoration: InputDecoration(
                                            labelText: "password",
                                            hintText: "ex - 123abs@&",
                                          labelStyle: TextStyle(color: Colors.white),
                                          hintStyle: TextStyle(color: Colors.white),
                                            prefixIcon: Icon(Icons.password,color: Colors.white),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                seeText();
                                              },
                                              icon: Icon(
                                                  Icons.remove_red_eye_outlined,color: Colors.white,),
                                            ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
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
                                            child:Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                                child: Text("Signup", style: TextStyle(fontSize: size.width * 0.035)),
                                              ),
                                            ) ,
                                          ),
                                          Expanded(child: Container()),
                                          MaterialButton(
                                            onPressed: () async {
                                              await context.read<StateData>().fetching(email_pilgrim.text, pass_pilgrim.text);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                                child: Text("Verify", style: TextStyle(fontSize: size.width * 0.035),
                                                ),
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