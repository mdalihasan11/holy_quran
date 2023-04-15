import 'package:flutter/material.dart';
import 'package:holy_quran/qari_model.dart';

class QariCustomTile extends StatefulWidget {
  QariCustomTile({Key? key, required this.qari, required this.ontap})
      : super(key: key);

  final Qari qari;
  final VoidCallback ontap;

  @override
  _QariCustomTileState createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          //alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.qari.name!,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
