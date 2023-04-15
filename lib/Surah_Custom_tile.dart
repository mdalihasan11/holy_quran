import 'package:flutter/cupertino.dart';
import 'package:holy_quran/Surah.dart';

Widget SurahCustomListTile({
  required Surah surah,
  required BuildContext context,
  required VoidCallback ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(17),
      decoration: const BoxDecoration(color: Color(0xFFFFFFFF), boxShadow: [
        BoxShadow(
          color: Color(0x1F000000),
          blurRadius: 3.0,
        )
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 40,
                padding: EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x1F000000),
                ),
                child: Text((surah.number).toString(),
                    style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(surah.englishNameTranslation!),
                ],
              ),
              const Spacer(),
              Text(
                surah.name!,
                style: const TextStyle(
                    color: Color(0xF0070000),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
