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

  Future<void> getSaveDate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
              (route) => false);

    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) =>  LoginScreen()), (route) => false);
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
      getSaveDate();
    });
  }
}

