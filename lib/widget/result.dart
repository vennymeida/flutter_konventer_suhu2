import 'package:flutter/material.dart';

class ResultKonversi extends StatelessWidget {
  final double result;

  const ResultKonversi({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hasil",
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
