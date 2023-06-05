import 'package:flutter/material.dart';
import 'package:food_panda/Auth/login.dart';
import 'package:food_panda/Auth/register.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.cyan,
                        Colors.amber,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
            ),
            title: const Text(
              "Ifood",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 60),
            ),
            bottom: const TabBar(
              tabs: [
                 Tab(
                   icon: Icon(Icons.lock,color: Colors.white,),
                   text: "Login",
                 ),
                Tab(
                  icon: Icon(Icons.person,color: Colors.white,),
                  text: "Registration",
                ),

              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 6,
              indicatorSize:TabBarIndicatorSize.label,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  Colors.cyan
                ]
              )
            ),
            child: TabBarView(
              children: [
                Login(),
                SignUp(),

              ],
            ),
          ) ,
        ));
  }
}
