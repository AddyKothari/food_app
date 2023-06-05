import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_panda/widgets/custom_text_feild.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Position? position;
  List<Placemark>? placeMarks;

  void getCurrentPostion() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(newPosition);
    // placeMarks = await placemarkFromCoordinates(
    //   position!.latitude,
    //   position!.longitude,
    // );
    // Placemark placemark = placeMarks![0];
    // String completeAddress =
    //     '${placemark.subThoroughfare}, ${placemark.thoroughfare}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode}, ${placemark.country}';
    // locationController.text = completeAddress;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundColor: Colors.white,
              backgroundImage:
              imageXFile == null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null
                  ? Icon(
                Icons.add_a_photo,
                size: MediaQuery.of(context).size.width * 0.2,
                color: Colors.grey,
              )
                  : null,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Custom_Text_Feild(
                  icon: Icons.person,
                  controller: nameController,
                  hintText: "Name",
                  isObscured: false,
                ),
                Custom_Text_Feild(
                  icon: Icons.email,
                  controller: emailController,
                  hintText: "Email",
                  isObscured: false,
                ),
                Custom_Text_Feild(
                  icon: Icons.lock,
                  controller: passwordController,
                  hintText: "Password",
                  isObscured: true,
                ),
                Custom_Text_Feild(
                  icon: Icons.person,
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isObscured: true,
                ),
                Custom_Text_Feild(
                  icon: Icons.phone,
                  controller: phoneController,
                  hintText: "Phone",
                  isObscured: false,
                ),
                Custom_Text_Feild(
                  icon: Icons.location_on_outlined,
                  controller: locationController,
                  hintText: "Address",
                  isObscured: false,
                  enable: false,
                ),
                Container(
                  width: 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: Text(
                      "Get my location",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Clicked");
                      getCurrentPostion();

                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                getCurrentPostion();
              });
            },
            child: Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              primary: Colors.cyan,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      // Update the state with the selected image
    });
  }
}
