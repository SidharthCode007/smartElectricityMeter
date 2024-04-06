import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartmeter/constants/size.dart';
import 'package:smartmeter/models/registrationModel.dart';
import 'package:smartmeter/screens/loginScreen.dart';
import 'package:smartmeter/services/userRegi.dart';

class Userregstration extends StatefulWidget {
  Userregstration({super.key});

  @override
  State<Userregstration> createState() => _UserregstrationState();
}

class _UserregstrationState extends State<Userregstration> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController housenoController = TextEditingController();

  TextEditingController pinnumberController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  TextEditingController phonenumController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController adharnumController = TextEditingController();

  String? _pickedImagePath;
  ValueNotifier<bool> isLoading = ValueNotifier(false); 

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              h10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: (){_pickImage(ImageSource.camera);}, icon: Icon(Icons.camera, size: 29,)),
                      Text("Camera")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){_pickImage(ImageSource.gallery);}, icon: Icon(Icons.image,size :29)),
                      Text("Gallery")
                    ],
                  )
                ],
              ),
              h10,
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your name";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Full name",
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 250, 253),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  filled: true,
                  fillColor: Color.fromARGB(255, 219, 237, 241),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: housenoController,
                      decoration: InputDecoration(
                        labelText: "House Number",
                        filled: true,
                        fillColor: Color.fromARGB(255, 219, 237, 241),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: pinnumberController,
                      validator: (value) {
                        print(value);
                        if (value == null || value.isEmpty) {
                          return 'enter pin code';
                        }
                        if (value.length < 6) {
                          return 'pin should contain 6 numbers';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Pin number",
                        filled: true,
                        fillColor: Color.fromARGB(255, 219, 237, 241),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: districtController,
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return 'enter district';
                  }
                },
                decoration: InputDecoration(
                  labelText: "District",
                  filled: true,
                  fillColor: Color.fromARGB(255, 219, 237, 241),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              h20,
              TextFormField(
                controller: phonenumController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return 'enter phone number';
                  }
                  if (value.length < 10 || value.length > 10) {
                    return 'phone number should contain only 10 numbers';
                  }
                },
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 250, 253),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: adharnumController,
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return 'enter Aadhaar number';
                  }
                  if (value.length < 12 || value.length > 12) {
                    return 'number should contain 12 numbers';
                  }
                },
                decoration: InputDecoration(
                    labelText: "Aadhaar Number",
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 250, 253),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "E-Mail",
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 250, 253),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  isLoading.value = true;
                  register();
                },
                child: Container(
                    height: 55,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 10, 58, 97)),
                    child: Center(
                        child: ValueListenableBuilder(valueListenable: isLoading, builder: (context, value, child) {
                          
                            if(isLoading.value == true){
                              return Center(child: CircularProgressIndicator(),);
                            }
                            else{
                              return Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    );
                            }                 
                        },))),
              )
            ],
          ),
        ),
      ),
    );
  }

  register() async {
    print("img : ${_pickedImagePath}");
    final user = await UserRegModel(
        imgPath: _pickedImagePath!,
        name: usernameController.text,
        address: addressController.text,
        district: districtController.text,
        pinnumber: pinnumberController.text,
        housenum: housenoController.text,
        phone: phonenumController.text,
        adharnum: adharnumController.text,
        email: emailController.text,
                );
    final regi = await adduserApi(user);
    isLoading.value = true;
    if (regi == "success") {
      isLoading.value == false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Successfully registered"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    else{
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Something went wrong. please try after some time"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
    }
    
  }

  //imgpicker
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });
    }
  }
}
