import 'package:flutter/material.dart';
import 'package:holy_quran/Api-Service.dart';
import 'package:holy_quran/Surah.dart';
import 'package:holy_quran/qari_model.dart';

import 'audio_screen.dart';

class AudioSurahScreen extends StatefulWidget {
  AudioSurahScreen({Key? key, required this.qari}) : super(key: key);
  Qari qari;

  @override
  _AudioSurahScreenState createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Surah List',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: apiServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                  itemCount: surah!.length,
                  itemBuilder: (context, index) => AudioTile(
                      surahName: snapshot.data![index].englishName,
                      totalAya: snapshot.data![index].numberOfAyahs,
                      number: snapshot.data![index].number,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AudioScreen(
                                      qari: widget.qari,
                                      index: index + 1,
                                      list: surah,
                                    )));
                      }));
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff023994),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget AudioTile(
    {String? surahName, totalAya, number, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: Colors.black,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                (number).toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahName!,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Total Aya : $totalAya",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            Spacer(),
            const Icon(
              Icons.play_circle_fill,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ),
  );
}
