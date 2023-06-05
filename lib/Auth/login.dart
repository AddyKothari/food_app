import 'package:flutter/material.dart';
import 'package:food_panda/widgets/custom_text_feild.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                "images/images/seller.png",
                height: 270,
              ),
            ),
          ),
          Form(key : _formKey,
              child: Column(children: [
                Custom_Text_Feild(
                  icon: Icons.email,
                  controller: emailController,
                  hintText: "Email",
                  isObscured: false,
                ),
                Custom_Text_Feild(
                  icon: Icons.lock,
                  controller: passwordController,
                  hintText: "password",
                  isObscured: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(

                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ), backgroundColor: Colors.cyan,
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),

                  ),
                ),
                SizedBox(height: 20,)
              ],))
        ],
      ),
    );
  }
}
