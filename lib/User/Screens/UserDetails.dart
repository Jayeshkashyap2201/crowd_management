import 'package:crowd_management/User/Screens/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Cubit/States.dart';
import '../../Cubit/detail.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String? current;
  String state = "unkonwn";
  String? currentGender;
  List<String> gender = [
    "male",
    "female",
    "others"
  ];
  List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  @override
  void dispose(){
    nameController.dispose();
    numberController.dispose();
    ageController.dispose();
    sexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364)
            ]),
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.drive_file_rename_outline,color: Colors.white,size: size.width*0.07,),
        title: Text("Please enter your Details",style: TextStyle(fontSize: size.width*0.05,color: Colors.white),),
      ),
      body: BlocListener<Detail, AllStates>(
        listener: (BuildContext context, currentState) {
          if (currentState is Loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          }
          if (currentState is Loaded) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Submitted Successfully",style: TextStyle(color: Colors.white),)
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Bottombar()),
            );
          }
          if (currentState is ErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(currentState.e)),
            );
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
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
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 40),

                    Text(
                      "General Details",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    // NAME
                    TextField(
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "MS Dhoni",
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // PHONE
                    TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "**********",
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.phone, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    Text(
                      "Additional Details",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        // AGE
                        Expanded(
                          child: TextField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Age",
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.numbers, color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        // GENDER
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: currentGender,
                            dropdownColor: Colors.black,
                            hint: Text("Gender", style: TextStyle(color: Colors.white)),
                            items: gender.map((g) {
                              return DropdownMenuItem(
                                value: g,
                                child: Text(g, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                currentGender = val;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: "Gender",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // STATE
                    DropdownButtonFormField<String>(
                      value: current,
                      dropdownColor: Colors.black,
                      hint: Text(
                        "Select State",
                        style: TextStyle(color: Colors.white),
                      ),
                      items: states.map((s) {
                        return DropdownMenuItem(
                          value: s,
                          child: Text(s, style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          current = val;
                          state = val!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "State",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    // BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (ageController.text.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            numberController.text.length == 10 &&
                            currentGender != null) {

                          context.read<Detail>().submitDetails(
                            name: nameController.text,
                            number: numberController.text,
                            age: ageController.text,
                            gender: currentGender!,
                            state: state,
                          );
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Fill all details correctly")),
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
