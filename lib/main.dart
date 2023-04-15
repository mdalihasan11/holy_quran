import 'package:flutter/material.dart';
import 'package:holy_quran/Surah_details.dart';
import 'package:holy_quran/jus_screen.dart';
import 'package:holy_quran/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
    );
  }
}
