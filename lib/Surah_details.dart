import 'package:flutter/material.dart';
import 'package:holy_quran/Api-Service.dart';
import 'package:holy_quran/Constants.dart';
import 'package:holy_quran/Cus_transilation.dart';
import 'package:holy_quran/transelation%20_model.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

enum Translation { urdu, hindi, english, bengali }

class Surahdetail extends StatefulWidget {
  const Surahdetail({Key? key}) : super(key: key);

  static const String id = 'surahDetail_screen';

  @override
  _SurahdetailState createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiServices _apiServices = ApiServices();
  //SolidController _controller = SolidController();
  Translation? _translation = Translation.bengali;

  @override
  Widget build(BuildContext context) {
    print(_translation!.index);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _apiServices.getTranslation(
              Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff023994),
                ),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                      index: index,
                      surahTranslation: snapshot.data!.translationList[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Translation Not found'),
              );
            }
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Color(0xff023994),
            height: 50,
            child: const Center(
              child: Text(
                "Select Language",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Urdu'),
                    leading: Radio<Translation>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff023994)),
                      value: Translation.urdu,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Hindi'),
                    leading: Radio<Translation>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff023994)),
                      value: Translation.hindi,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('English'),
                    leading: Radio<Translation>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff023994)),
                      value: Translation.english,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Bengali'),
                    leading: Radio<Translation>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff023994)),
                      value: Translation.bengali,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
