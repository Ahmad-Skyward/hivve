import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivve/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {Get.to(const HomeScreen());});
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome \n Here',textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 40,color: Colors.black,
              backgroundColor: Colors.amber),
        ),
      ),
    );
  }
}
