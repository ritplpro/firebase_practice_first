import 'dart:async';

import 'package:firebase_practice_first/home_page.dart';
import 'package:firebase_practice_first/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    logincheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Firebase', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange
        ),),
      ),
    );
  }

  logincheck() async {
    var prefs = await SharedPreferences.getInstance();
    var check = prefs.getString(LoginPage.S_Key);
    if (check != null) {
      if (check.isNotEmpty) {
         Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MyHomePage()));

        setState(() {

        });

      } else {
        Timer(Duration(seconds: 2),(){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });

      }
    }else{
      Timer(Duration(seconds: 2),(){
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });


    }
  }
}