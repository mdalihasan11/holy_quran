import 'package:flutter/material.dart';
import 'package:holy_quran/Qari_custom.dart';
import 'package:holy_quran/qari_model.dart';

import 'Api-Service.dart';
import 'audio_surah_screen.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({Key? key}) : super(key: key);

  @override
  _QariListScreenState createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff023994),
          title: const Text('Qari\'s '),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        spreadRadius: 0.0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text('Search'),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Expanded(
              //   child: FutureBuilder(
              //     future: apiServices.getQariList(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<List<Qari>> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(
              //             color: Color(0xff023994),
              //           ),
              //         );
              //       }
              //       if (snapshot.hasError) {
              //         return const Center(
              //           child: Text('Qari\'s data not found '),
              //         );
              //       }
              //       return ListView.builder(
              //         itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           return QariCustomTile(
              //               qari: snapshot.data![index],
              //               ontap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => AudioSurahScreen(
              //                             qari: snapshot.data![index])));
              //               });
              //         },
              //       );
              //     },
              //   ),
              // ),
              Expanded(
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Qari>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Qari\'s data not found '),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return QariCustomTile(
                            qari: snapshot.data![index],
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AudioSurahScreen(
                                          qari: snapshot.data![index])));
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
