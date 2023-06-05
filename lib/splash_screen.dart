import 'dart:async';

import 'package:flutter/material.dart';

import 'Auth/auth_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void initState() {
    super.initState();
    startTimer(Duration(seconds: 1));
  }
  void startTimer(Duration duration) {
    Timer(duration, () {
      // Navigate to the authentication screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Auth()),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("images/images/splash.jpg"),
                ),

                const SizedBox(height: 10,),

                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Sell Food Online",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 40,

                      letterSpacing: 3,
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