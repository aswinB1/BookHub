import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/home.dart';

import 'package:sample/login.dart';

class splashScreen extends StatefulWidget {
   splashScreen({super.key,});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return logIn();
        
      }));
     });
    
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 170,
                width: 150,
                // color: Colors.grey[200],
                decoration:  BoxDecoration(
                  // boxShadow: [BoxShadow(blurRadius:5,color: Colors.blue.shade50,)],shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("asset/images/ebook.png")))),
          ),
          // SizedBox(height: 120,),
          // const Text(
          //   "Develope your reading",
          //   style: TextStyle(
          //     color: Colors.blue,
          //     fontSize: 20,
          //     fontStyle: FontStyle.italic,
          //   ),
          // )
        ],
      )),
    );
  }
}
