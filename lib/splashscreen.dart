import 'dart:async';

import 'package:flutter/material.dart';
import 'package:holy_quran/Home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool AlreadyUsed = false;
  void getDate() async {
    final prefs = await SharedPreferences.getInstance();
    AlreadyUsed = prefs.getBool('AlreadyUsed') ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context as BuildContext,
                MaterialPageRoute(builder: (context) {
              return AlreadyUsed ? const home_page() : const home_page();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: const [
          Center(
              child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 250,
            backgroundImage: AssetImage('assets/quran.png'),
          )),
        ],
      )),
    );
  }
}
