import 'package:flutter/material.dart';
import 'package:holy_quran/transelation%20_model.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;

  const TranslationTile({required this.index, required this.surahTranslation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(blurRadius: 1),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff023994),
                    //color: Color(0xffA5D2D6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                  ),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                ),
                Positioned(
                  top: 3,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Text(
                      surahTranslation.aya!,
                      style: const TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      surahTranslation.arabic_text!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      surahTranslation.translation!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
