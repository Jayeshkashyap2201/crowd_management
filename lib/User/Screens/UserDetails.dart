import 'package:crowd_management/StaticVariables.dart';
import 'package:crowd_management/User/Screens/BottomBar.dart';
import 'package:crowd_management/User/Screens/home_english.dart';
import 'package:flutter/material.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String? current;
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
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController age = TextEditingController();
  // TextEditingController number = TextEditingController();
  TextEditingController sex = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: Icon(Icons.drive_file_rename_outline,color: Colors.yellow,size: size.width*0.1,),
        title: Text("Please enter your Details",style: TextStyle(fontSize: size.width*0.05,color: Colors.white),),
      ),
      backgroundColor: Colors.purple.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.02,),
            Text("General Details",style: TextStyle(fontSize: size.width*0.07,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02,),
            Card(
              color: Colors.purple.shade100,
              child: TextField(
                controller: name,
                keyboardType: TextInputType.name,
                enabled: true,
                decoration: InputDecoration(
                  labelText: "name",
                  hintText: "MS Dhoni",
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.redAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.01,),
            Card(
              color: Colors.purple.shade100,
              child: TextField(
                controller: number,
                keyboardType: TextInputType.number,
                enabled: true,
                decoration: InputDecoration(
                  labelText: "phone",
                  hintText: "9321239467",
                  prefixIcon: Icon(Icons.phone),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.redAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Text("Additional Details",style: TextStyle(fontSize: size.width*0.07,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02,),
            Row(
              children: [
                SizedBox(
                  width: size.width*0.50,
                  child: Card(
                    color: Colors.purple.shade100,
                    child: TextField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "22",
                        prefixIcon: Icon(Icons.numbers),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.redAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(
                  width: size.width*0.50,
                  child: Card(
                    color: Colors.purple.shade100,
                    child: TextField(
                      controller: sex,
                      keyboardType: TextInputType.name,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: "Gender",
                        hintText: "Male",
                        prefixIcon: Icon(Icons.male),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.redAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height*0.02,),
            Card(
              color: Colors.purple.shade100,
              child: DropdownButtonFormField(
                initialValue: current,
                menuMaxHeight: 1000,
                items: states.map((state){
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (Choosed){
                  setState(() {
                    current = Choosed;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Tap and Choose your State",
                  labelText: "Select State",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.red,
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.1,),
            ElevatedButton(
              onPressed: (){
                if(age.text.isNotEmpty && name.text.isNotEmpty && sex.text.isNotEmpty && number.text.isNotEmpty) {
                  StaticVariable.userAge = age.toString();
                  StaticVariable.userName = name.toString();
                  StaticVariable.userGender = sex.toString();
                  StaticVariable.userNumber = number.toString();
                  print("submitted");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottombar()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your details properly")));
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
