import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topuptest/TopUpScreen/Login_Screen/login_screen.dart';

import '../MainScreen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 Future<void> checkLogin()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var userName = prefs.getString("userName");

    if(userName != null){
      Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) =>   MainScreen()));
    } else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>   LoginScreen()));

    }

  }

  @override
  void initState() {
    splashFunc();


    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/SplshScreen/animation_ldilmg7w.json"),),);
  }

  Future splashFunc() async {
    Future.delayed(const Duration(seconds: 3), () {
    checkLogin();
    });
  }
}

