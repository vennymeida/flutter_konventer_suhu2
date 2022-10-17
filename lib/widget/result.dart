import 'package:flutter/material.dart';

class ResultKonversi extends StatelessWidget {
  final double result;
  final String jenis;

  const ResultKonversi({super.key, required this.result, required this.jenis});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Suhu Dalam $jenis",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          "$result",
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
