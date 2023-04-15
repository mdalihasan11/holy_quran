import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:holy_quran/Home_Screen.dart';
import 'package:holy_quran/Quran_Screen.dart';
import 'package:holy_quran/qari_screen.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int selectindex = 0;
  final List<Widget> _widgetList = const [
    HomeScreen(),
    QuranScreen(),
    QariListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _widgetList[selectindex],
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: const Color(0xff023994),
            items: [
              const TabItem(icon: Icons.home, title: 'Home'),
              TabItem(
                  icon: Image.asset('assets/holyQuran.png'),
                  title: 'Holy_Quran'),
              const TabItem(icon: Icons.audiotrack, title: 'Audio'),
            ],
            initialActiveIndex: 0,
            onTap: updateIndex,
          )),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
